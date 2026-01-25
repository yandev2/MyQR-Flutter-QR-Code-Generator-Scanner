import 'package:flutter/material.dart';

BoxDecoration decorationBox() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.white),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color.fromARGB(255, 238, 246, 255), Color.fromARGB(255, 199, 224, 255)],
    ),
    boxShadow: [
      BoxShadow(
        // ignore: deprecated_member_use
        color: Color.fromARGB(255, 199, 224, 255).withOpacity(0.4),
        offset: Offset(0, 4),
        blurRadius: 5,
        spreadRadius: 1,
      ),
    ],
  );
}

BoxDecoration decorationBox2() {
  return BoxDecoration(
    color: Color(0xFFF5F7FF),
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        // ignore: deprecated_member_use
        color: Colors.black.withOpacity(0.04),
        blurRadius: 20,
        offset: Offset(0, 10),
      ),
    ],
  );
}

BoxDecoration decorationBox3() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.white),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 249, 224, 255), // ungu muda
        Color(0xFFEAF1FF), // biru muda
        Color(0xFFFFFFFF), // putih
      ],
    ),
  );
}
