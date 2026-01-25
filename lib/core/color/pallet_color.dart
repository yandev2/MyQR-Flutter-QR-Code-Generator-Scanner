import 'package:flutter/material.dart';
import 'package:myqrcode/core/enum/app_style.dart';
import 'package:myqrcode/core/enum/barcode_type.dart';

class PalletColor {
  Color palletApp(AppStyle style) {
    switch (style) {
      case AppStyle.primary:
        return Color.fromARGB(255, 68, 35, 253);
      case AppStyle.success:
        return Color.fromARGB(255, 39, 206, 33);
      case AppStyle.warning:
        return Colors.amber;
      case AppStyle.danger:
        return Colors.red;
      case AppStyle.custom:
        return const Color.fromARGB(255, 158, 223, 5);
    }
  }

  Color palletColorBarcode(QrType type) {
    switch (type) {
      case QrType.url:
        return Colors.blue;
      case QrType.text:
        return const Color.fromARGB(255, 218, 164, 5);
      case QrType.wifi:
        return const Color.fromARGB(255, 5, 190, 223);
      case QrType.geo:
        return const Color.fromARGB(255, 5, 223, 59);
      case QrType.contactInfo:
        return const Color.fromARGB(255, 223, 5, 5);
      case QrType.calendarEvent:
        return const Color.fromARGB(255, 223, 5, 187);
      case QrType.custom:
        return const Color.fromARGB(255, 158, 223, 5);
    }
  }

  Gradient palletGradientBarcode(QrType type) {
    switch (type) {
      case QrType.url:
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 184, 217, 255), Color.fromARGB(255, 99, 169, 255)],
        );
      case QrType.text:
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 255, 233, 184), Color.fromARGB(255, 255, 206, 99)],
        );
      case QrType.wifi:
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 184, 238, 255), Color.fromARGB(255, 99, 211, 255)],
        );
      case QrType.geo:
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 186, 255, 184), Color.fromARGB(255, 99, 255, 112)],
        );
      case QrType.contactInfo:
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 255, 184, 184), Color.fromARGB(255, 255, 99, 99)],
        );
      case QrType.calendarEvent:
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 255, 184, 246), Color.fromARGB(255, 255, 99, 255)],
        );
      case QrType.custom:
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 230, 255, 184), Color.fromARGB(255, 200, 255, 99)],
        );
    }
  }
}
