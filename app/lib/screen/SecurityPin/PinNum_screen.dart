import 'package:flutter/material.dart';

class PINNumber extends StatelessWidget {
 PINNumber({super.key, required this.textEditingController, required this.outlineInputBorder});

 final TextEditingController textEditingController;
 final OutlineInputBorder outlineInputBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: true,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16.0),
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.white30
        ),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21.0,
          color: Colors.white
        ),
      ),
    );
  }
}

class KeyBoardNumber extends StatelessWidget {
  const KeyBoardNumber({super.key , required this.n , required this.onPressed});

  final int n;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.deepPurpleAccent.withOpacity(0.1)
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0)
        ),
        height: 90.0,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24*MediaQuery.of(context).textScaleFactor,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
    );
  }
}