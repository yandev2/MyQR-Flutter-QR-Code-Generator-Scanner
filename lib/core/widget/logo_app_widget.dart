import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myqrcode/core/color/pallet_color.dart';
import 'package:myqrcode/core/design/responsif_design.dart';
import 'package:myqrcode/core/enum/app_style.dart';

class LogoAppWidget extends StatelessWidget {
  const LogoAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PalletColor().palletApp(AppStyle.primary),
        borderRadius: BorderRadius.circular(15).w,
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(color: const Color.fromARGB(17, 0, 0, 0), blurRadius: 2, spreadRadius: 2),
        ],
      ),
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Icon(Icons.qr_code_2, size: size(30), color: const Color.fromARGB(50, 255, 255, 255)),
          Text(
            'MyQR',
            textScaler: TextScaler.linear(scale()),
            style: GoogleFonts.itim(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: size(10),
              shadows: [BoxShadow(color: Colors.black12)],
            ),
          ),
        ],
      ),
    );
  }
}
