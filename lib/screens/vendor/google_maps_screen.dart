import 'package:flutter/material.dart';
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
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(30.033333, 31.233334),
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
                backGround: AppColors.darkBlue,
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
