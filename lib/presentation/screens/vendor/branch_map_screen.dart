import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/business_logic/add_branch_cubit/add_branch_cubit.dart';
import 'package:mobile/data/local/cache_helper.dart';
import 'package:sizer/sizer.dart';
import '../../styles/colors.dart';
import '../../widgets/default_app_button.dart';

class BranchMapsScreen extends StatefulWidget {
  final data;

  const BranchMapsScreen({this.data, Key? key}) : super(key: key);

  @override
  State<BranchMapsScreen> createState() => _BranchMapsScreenState();
}

class _BranchMapsScreenState extends State<BranchMapsScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final Map<String, Marker> _markers = {};
  String myAddress = "";
  double lon = 0, lat = 0;
  GeoCode geoCode = GeoCode();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
      37.42796133580664,
      -122.085749655962,
    ),
    zoom: 18,
  );

  Future<void> getMyLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            position.latitude,
            position.longitude,
          ),
          zoom: 18,
        ),
      ),
    );
    getAddress(LatLng(position.latitude, position.longitude));
    addMarker(LatLng(position.latitude, position.longitude));
  }

  void addMarker(LatLng position) async {
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: const MarkerId("branchLocation"),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        ),
        position: position,
      );
      _markers["branchLocation"] = marker;
    });
    getAddress(LatLng(position.latitude, position.longitude));
  }

  void getAddress(LatLng position) async {
    Address address = await geoCode.reverseGeocoding(
      latitude: position.latitude,
      longitude: position.longitude,
    );
    lat = position.latitude;
    lon = position.longitude;
    myAddress =
        "${address.streetNumber}, ${address.streetAddress}, ${address.city}, ${address.region}, ${address.countryName}";
  }

  @override
  void initState() {
    getMyLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            markers: _markers.values.toSet(),
            onTap: addMarker,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.only(
                top: 6.h,
                right: 4.w,
                left: 4.w,
              ),
              child: Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: AppColors.darkPurple,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: CacheHelper.getDataFromSharedPreference(
                              key: 'language') ==
                          "ar"
                      ? const EdgeInsets.only(left: 2, right: 11)
                      : const EdgeInsets.only(left: 11, right: 2),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 80.h,
            ),
            child: Center(
              child: DefaultAppButton(
                text: translate("confLocation"),
                backGround: AppColors.darkPurple,
                fontSize: 25,
                height: 8.h,
                onTap: () {
                  AddBranchCubit.get(context)
                      .addNewBranch(
                        name: widget.data['name'],
                        phone: widget.data['phone'],
                        lon: lon,
                        lat: lat,
                        address: myAddress,
                      )
                      .then(
                        (value) => Navigator.pushNamed(context, "/home"),
                      );
                },
                width: 50.w,
                textColor: AppColors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkPurple,
        foregroundColor: AppColors.white,
        onPressed: getMyLocation,
        child: const Icon(
          Icons.my_location,
        ),
      ),
    );
  }
}
