import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';

class Order_tracking_ViewModel extends BaseViewModel{
  //  LocationData? currentLocation;
  //   final Completer<GoogleMapController> _controller = Completer();

  //   getCurrentLocation() async {
  //   Location location = Location();
  //   location.getLocation().then((Location) {
  //     currentLocation = Location;
  //   }
  //   );
  //   GoogleMapController googleMapController =  await _controller.future;
  //   location.onLocationChanged.listen((NewLocation) {
  //     currentLocation = NewLocation;  
  //    googleMapController.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(target: LatLng(NewLocation.latitude!, NewLocation.longitude!))
  //       )
  //       );

  //     setState(() {});
  //    });
  // }
}