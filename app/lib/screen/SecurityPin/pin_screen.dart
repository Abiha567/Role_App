import 'package:app/screen/home_screen.dart';
import 'package:app/viewmodels/Pin_screen_viewModel.dart';
import 'package:app/viewmodels/login_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'SecPin_screen.dart';

class Pin_screen extends StatefulWidget {
   Pin_screen({super.key});

  @override
  State<Pin_screen> createState() => _Pin_screenState();
}

class _Pin_screenState extends State<Pin_screen> {
  //   TextEditingController _pinController = TextEditingController();

  // late SharedPreferences prefs;

  // bool isAuthenticated = false;

  // late String correctPin='123';

  // @override
  // void initState() {
  //   super.initState();
  //   _loadPin();
  // }

  // _loadPin() async {
  //   prefs = await SharedPreferences.getInstance();
  //   correctPin = prefs.getString('pin')!;
  // }

  // _savePin() async {
  //   await prefs.setString('pin', _pinController.text);
  //   setState(() {
  //     isAuthenticated = true;
  //   });
  // }

  // _authenticate(BuildContext context) {
  //   if (_pinController.text == correctPin) {
  //     _savePin();
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => Home_screen(),
  //       ),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Incorrect Pin'),
  //         duration: Duration(seconds: 3),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: ()=> PinScreenViewModel(),
      builder: (context , viewModel , child){
        return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
               Colors.deepOrangeAccent,
               Colors.red
            ],
            begin: Alignment.topRight,
             ),
        ),
        child: SecurityPin_screen(),
      ),
    );
      }
      );
  }
}