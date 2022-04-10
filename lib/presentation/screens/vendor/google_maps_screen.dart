import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../styles/colors.dart';
import '../../widgets/default_app_button.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {

   var latitudeData ;
   var longitudeData ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
    print(latitudeData);
  }
  void getCurrentLocation() async{
   final geoposition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitudeData = geoposition.latitude;
      longitudeData = geoposition.longitude;
    });
  }

    late final _initialCameraPosition = CameraPosition(
        target: LatLng( latitudeData, longitudeData),
        zoom: 11.5,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 640,left:50),
            child: DefaultAppButton(
                text: 'Set Location',
                backGround: AppColors.darkPurple,
                fontSize: 30,
                height: 10.h,
                onTap: () {},
                width: 75.w,
                textColor: AppColors.white),
          )
        ],
      ),
    );
  }
}
