import 'package:flutter/material.dart';
import 'package:myqrcode/core/design/responsif_design.dart';

class BgApp extends StatelessWidget {
  const BgApp({super.key, required this.child, this.padding});
  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 249, 224, 255), // ungu muda
                Color(0xFFEAF1FF), // biru muda
                Color(0xFFFFFFFF), // putih
              ],
            ),
          ),
        ),
        Positioned(
          right: size(-60),
          top: size(-60),
          child: Icon(
            Icons.qr_code_2,
            size: size(250),
            color: const Color.fromARGB(15, 109, 109, 109),
          ),
        ),
        Padding(padding: padding ?? EdgeInsets.all(0), child: child),
      ],
    );
  }
}
