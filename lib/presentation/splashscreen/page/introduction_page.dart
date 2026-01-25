import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myqrcode/core/color/pallet_color.dart';
import 'package:myqrcode/core/design/box_decoration_design.dart';
import 'package:myqrcode/core/design/responsif_design.dart';
import 'package:myqrcode/core/enum/app_style.dart';
import 'package:myqrcode/core/widget/bg_app_widget.dart';
import 'package:myqrcode/core/widget/logo_app_widget.dart';
import 'package:myqrcode/presentation/splashscreen/controller/splash_screen_controller.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashScreenController>();
    return Scaffold(
      body: SafeArea(
        child: BgApp(
          padding: EdgeInsets.all(20).w,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Row(
                    spacing: size(15),
                    children: [
                      SizedBox(height: size(40), width: size(40), child: LogoAppWidget()),
                      Text(
                        'Wellcome',
                        textScaler: TextScaler.linear(scale()),
                        style: GoogleFonts.itim(
                          color: PalletColor().palletApp(AppStyle.primary),
                          fontWeight: FontWeight.bold,
                          fontSize: size(25),
                          shadows: [BoxShadow(color: Colors.black12)],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: sizeHeight(30)),
                  Text(
                    'Create your own QR Code',
                    textScaler: TextScaler.linear(scale()),
                    style: TextStyle(
                      height: 1,
                      fontSize: size(40),
                      color: Colors.black,
                      fontVariations: <FontVariation>[FontVariation('wght', 900.0)],
                    ),
                  ),

                  SizedBox(height: sizeHeight(10)),
                  Text.rich(
                    textAlign: TextAlign.justify,
                    textScaler: TextScaler.linear(scale()),
                    TextSpan(
                      text: 'Scan. Create. Connect. ',
                      style: TextStyle(
                        height: 1,
                        fontSize: size(10),
                        color: PalletColor().palletApp(AppStyle.primary),
                        wordSpacing: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text:
                              'A versatile application for quickly and easily scanning and creating QR codes. Designed with a simple and lightweight interface, MyQR helps you access information, share data, and connect to the digital world in just seconds.',
                          style: TextStyle(
                            height: 1,
                            fontSize: size(10),
                            color: Colors.black,
                            wordSpacing: 1.5,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Spacer(),
                  Image.asset('assets/image/scan_qr.png', width: Get.width),

                  Spacer(),
                  Bounceable(
                    onTap: () {
                      controller.saveStatus();
                    },
                    child: Container(
                      height: size(50),
                      width: Get.width,
                      decoration: decorationBox(),
                      child: Row(
                        spacing: size(10),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get Started',
                            textScaler: TextScaler.linear(scale()),
                            style: TextStyle(
                              height: 1,
                              fontSize: size(12),
                              color: Colors.black,
                              wordSpacing: 1.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
