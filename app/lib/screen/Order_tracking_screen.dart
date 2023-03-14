import 'dart:async';
import 'package:app/components/consonants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Order_tracking extends StatefulWidget {
  const Order_tracking({super.key});

  @override
  State<Order_tracking> createState() => _Order_trackingState();
}

class _Order_trackingState extends State<Order_tracking> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then((Location) {
      currentLocation = Location;
    }
    );
    GoogleMapController googleMapController =  await _controller.future;
    location.onLocationChanged.listen((NewLocation) {
      currentLocation = NewLocation;  
     googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(NewLocation.latitude!, NewLocation.longitude!))
        )
        );
      setState(() {});
     });
  }

  void getPolyPoints() async{
    PolylinePoints polylinePoints = PolylinePoints();
   
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude , sourceLocation.longitude),
      PointLatLng(destination.latitude , destination.longitude)
      );
      if(result.points.isNotEmpty){
        result.points.forEach(
          (PointLatLng point) => 
        polylineCoordinates.add(
        LatLng(point.latitude, point.longitude)
        )
        );
        setState(() {});
      }
  }

  void setCustomMarkerIcon(){
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "");
  }
 
   @override
  void initState(){
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
            "Track Order",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body:  currentLocation == null
      ? const Center(child: Text("Loading"))
        :GoogleMap(
        initialCameraPosition:
        CameraPosition(
        target: LatLng(currentLocation!.latitude! , currentLocation!.longitude!),
       zoom: 14.5
       ),
          polylines: {
                Polyline(
                polylineId: const PolylineId('routes'),
                points: polylineCoordinates,
                color: AppColor,
                width: 6
                ),
          },
          markers: {
                  Marker(
                  markerId: const MarkerId("current Location"),
                  position: LatLng(currentLocation!.latitude! , currentLocation!.longitude!),
                  // icon: currentLocationIcon
                  ),
                 const Marker(
                  markerId: MarkerId("Source"),
                  position: sourceLocation
                  ),
                  const Marker(
                  markerId: MarkerId("Destination"),
                  position: sourceLocation
                  ),
          },
          onMapCreated: (mapController) {
            _controller.complete(mapController);
          },
         ),
    );
  }
}