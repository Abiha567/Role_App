import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class Internet_Connectivity_screen extends StatefulWidget {
  const Internet_Connectivity_screen({super.key});

  @override
  State<Internet_Connectivity_screen> createState() => Internet_Connectivity_screenState();
}


   Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

class Internet_Connectivity_screenState extends State<Internet_Connectivity_screen> {
  Future<void> checkInternetConnectivity(BuildContext context) async {
  var connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.none) {
    ScaffoldMessenger.of(context).showSnackBar(
   const SnackBar(
        content: Text('No internet connection'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
  child: Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      title: const Text('My App'),
    ),
    body: const Center(
      child: Text('Hello World!'),
    ),
  ),
);

  }
}