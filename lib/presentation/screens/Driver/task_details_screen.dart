import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../styles/colors.dart';
import '../../widgets/default_app_button.dart';
import '../../widgets/default_icon_button.dart';
import '../../widgets/task_card.dart';

class TaskSetailsScreen extends StatefulWidget {
  final data;

  const TaskSetailsScreen({this.data,Key? key}) : super(key: key);
  @override
  State<TaskSetailsScreen> createState() => _TaskSetailsScreenState();
}




class _TaskSetailsScreenState extends State<TaskSetailsScreen> {
  
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
    addMarker(LatLng(position.latitude, position.longitude),markerId:"driverLocation");
    orderLocation(LatLng(29.84671751626389, 31.159779749768894));
  }

  Future<void> orderLocation(LatLng position1) async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            position1.latitude,
            position1.longitude,
          ),
          zoom: 18,
        ),
      ),
    );
    getAddress(LatLng(position.latitude, position.longitude));
    addMarker(LatLng(position.latitude, position.longitude),markerId: "orderLocation");
  }

  Future addMarker(LatLng position, {String? markerId}) async {
    setState(() {
      // _markers.clear();
      final marker = Marker(
        markerId: MarkerId(markerId!),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        ),
        position: position,
      );
      _markers[markerId] = marker;
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
    print(LatLng(position.latitude, position.longitude));
    myAddress =
        "${address.streetNumber}, ${address.streetAddress}, ${address.city}, ${address.region}, ${address.countryName}";
    print(myAddress);
    // CacheHelper.saveDataSharedPreference(key: 'lat', value: position.latitude);
    // CacheHelper.saveDataSharedPreference(key: 'lon', value: position.longitude);
    // CacheHelper.saveDataSharedPreference(
    //     key: 'orderLocation', value: myAddress);
  }
  





  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
      30.036074702034966, 31.237643441318134
    ),
    zoom: 18,
  );

  final Completer<GoogleMapController> _controller = Completer();
  final Map<String, Marker> _markers = {};
  String myAddress = "";
  double lon = 0, lat = 0;
  GeoCode geoCode = GeoCode();
  // static const _initialCameraPosition = CameraPosition(
  //   target: LatLng(30.033333, 31.233334),
  //   zoom: 11.5,
  // );

  @override
  void initState() {
    getMyLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: AppColors.darkPurple,
          title: Text(
            widget.data['id'].toString(),
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
        ),
      ),
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
          Padding(
            padding:
                const EdgeInsets.only(top: 420,left:30, right: 25),
            child: Container(
                width: 100.w,
                height: 29.h,
                decoration: BoxDecoration(
                  color: AppColors.darkPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 3, bottom: 0, left: 15, right: 15),
                    child: Column(children: [
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.white,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Row(
                          children: [
                            Text(
                              'Client : ',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              widget.data['name'],
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Items : ',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              widget.data['items'].toString(),
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'Total : ',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              widget.data['total'].toString(),
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start : ',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              widget.data['start'],
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'End : ',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              widget.data['end'],
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 5, right: 6,left:6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultAppButton(
                              onTap: () {
                                getMyLocation();
                              },
                              text: 'End Task',
                              height: 7.h,
                              backGround: AppColors.white,
                              fontSize: 17.sp,
                              textColor: AppColors.lightPurple,
                              width: 50.w,
                            ),
                            DefaultIconButton(
                                width: 14.w,
                                buttonColor: AppColors.white,
                                iconColor: AppColors.darkPurple,
                                icon: Icons.phone_rounded,
                                onTap: () {
                                  launch('tel://${widget.data['phone']}');
                                })
                          ],
                        ),
                      ),
                    ]))),
          )
        ],
      ),
    );
  }

}
