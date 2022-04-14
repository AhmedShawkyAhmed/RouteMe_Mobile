import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  static MapCubit get(context) => BlocProvider.of(context);

  final Completer<GoogleMapController> mapController = Completer();

   initLocation(){
    const CameraPosition initial = CameraPosition(
      target: LatLng(
        37.42796133580664,
        -122.085749655962,
      ),
      zoom: 16.5,
    );
    return initial;
  }

    myLocation() async{
    const CameraPosition myLocation = CameraPosition(
      target: LatLng(
        27.178504335604043,
        33.811984888518055,
      ),
      zoom: 16.5,
    );
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(myLocation));
    return myLocation;
  }

  void get init async => emit(initLocation());

  void get my async => emit(myLocation());
}
