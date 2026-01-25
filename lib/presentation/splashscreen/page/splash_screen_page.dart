import 'package:flutter/material.dart';
import 'package:myqrcode/core/design/box_decoration_design.dart';
import 'package:myqrcode/core/design/responsif_design.dart';
import 'package:myqrcode/core/widget/bg_app_widget.dart';
import '../../../core/color/pallet_color.dart';
import '../../../core/enum/app_style.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BgApp(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size(100),
                width: size(100),
                decoration: decorationBox(),
                child: Icon(Icons.qr_code_2, size: size(100)),
              ),
              SizedBox(height: size(10)),
              Text(
                'My QR Code',
                textScaler: TextScaler.linear(scale()),
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  fontSize: size(12),
                  color: PalletColor().palletApp(AppStyle.primary),
                  fontWeight: FontWeight.bold,
                  fontVariations: <FontVariation>[FontVariation('wght', 900.0)],
                ),
              ),
              SizedBox(height: size(5)),
              Text(
                'Scan. Create. Connect.',
                textScaler: TextScaler.linear(scale()),
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  fontSize: size(8),
                  color: Colors.black,
                  wordSpacing: 1.5,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
