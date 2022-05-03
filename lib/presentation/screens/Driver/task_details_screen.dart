import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../styles/colors.dart';
import '../../widgets/default_app_button.dart';
import '../../widgets/default_icon_button.dart';

class TaskDetailsScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;

  const TaskDetailsScreen({this.data, Key? key}) : super(key: key);

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final Map<String, Marker> _markers = {};
  Set<Polyline> polyline = <Polyline>{};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String myAddress = "";
  double lon = 0, lat = 0;
  Position? origin;
  GeoCode geoCode = GeoCode();

  static const CameraPosition _initialLocation = CameraPosition(
    target: LatLng(
      30.049960701609457,
      31.23683759550562,
    ),
    zoom: 16,
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
          zoom: 16,
        ),
      ),
    );
    getAddress(LatLng(position.latitude, position.longitude));
    setState(() {
      origin = position;
      final marker = Marker(
        markerId: const MarkerId("driverLocation"),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueAzure,
        ),
        position: LatLng(position.latitude, position.longitude),
      );
      _markers["driverLocation"] = marker;
    });
    setPolyline();
  }

  Future<void> getOrderLocation(
      {required double lat, required double lon}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            lat,
            lon,
          ),
          zoom: 16,
        ),
      ),
    );
    getAddress(LatLng(lat, lon));
    setState(() {
      final marker = Marker(
        markerId: const MarkerId("orderLocation"),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        ),
        position: LatLng(lat, lon),
      );
      _markers["orderLocation"] = marker;
    });
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

  void setPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyAtHSDd-jAFuhWwxDA1NDHeL2RL3XCLKZY',
      PointLatLng(origin!.latitude, origin!.longitude),
      PointLatLng(widget.data['lat'], widget.data['lon']),
    );
    if (result.status == 'OK') {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      setState(() {
        polyline.add(Polyline(
          polylineId: const PolylineId('polyline'),
          width: 10,
          color: AppColors.red,
          points: polylineCoordinates,
        ));
      });
    } else {}
  }

  @override
  void initState() {
    polylinePoints = PolylinePoints();
    getOrderLocation(lat: widget.data['lat'], lon: widget.data['lon'])
        .then((value) async {
      await Future.delayed(const Duration(seconds: 5), () {
        getMyLocation();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          translate('orderNo') + ' ' + widget.data['id'].toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColors.darkGray,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppColors.darkGray,
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.darkGray,
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
            polylines: polyline,
            initialCameraPosition: _initialLocation,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 470,
              left: 30,
              right: 25,
            ),
            child: Container(
              width: 100.w,
              height: 23.h,
              decoration: BoxDecoration(
                color: AppColors.darkPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 1,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          left: 8,
                          right: 8,
                        ),
                        child: Row(
                          children: [
                            Text(
                              translate("Client"),
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
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Row(
                          children: [
                            Text(
                              translate("total"),
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
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
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              translate("start"),
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
                              translate("end"),
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
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 6,
                          left: 6,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DefaultAppButton(
                              onTap: () {
                                Navigator.pushNamed(context, "/endTask", arguments: {
                                  'taskId': widget.data['taskId'],
                                  'id': widget.data['id'],
                                  'name': widget.data['name'],
                                  'items': widget.data['items'],
                                  'total': widget.data['total'],
                                  'start': widget.data['start'],
                                  'end': widget.data['end'],
                                  'lat': widget.data['lat'],
                                  'lon': widget.data['lon'],
                                  'phone': widget.data['phone'],
                                });
                              },
                              text: translate('endTask'),
                              height: 6.h,
                              backGround: AppColors.white,
                              fontSize: 18,
                              textColor: AppColors.darkPurple,
                              width: 40.w,
                            ),
                            DefaultIconButton(
                              width: 12.w,
                              buttonColor: AppColors.white,
                              iconColor: AppColors.darkPurple,
                              icon: Icons.phone_rounded,
                              onTap: () {
                                launch('tel://${widget.data['phone']}');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
