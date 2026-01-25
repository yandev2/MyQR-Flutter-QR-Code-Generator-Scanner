import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myqrcode/core/color/pallet_color.dart';
import 'package:myqrcode/core/design/box_decoration_design.dart';
import 'package:myqrcode/core/design/responsif_design.dart';
import 'package:myqrcode/core/enum/barcode_type.dart';
import 'package:myqrcode/core/widget/bg_app_widget.dart';
import 'package:myqrcode/core/widget/icon_button_widget.dart';
import 'package:myqrcode/presentation/qr_create/controller/qr_create_controller.dart';
import '../widget/build_form_calender_event.dart';
import '../widget/build_form_contack_info.dart';
import '../widget/build_form_custom.dart';
import '../widget/build_form_geo.dart';
import '../widget/build_form_text.dart';
import '../widget/build_form_url.dart';
import '../widget/build_form_wifi.dart';

class QrFormGeneratePage extends StatelessWidget {
  const QrFormGeneratePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QrCreateController>();
    return Scaffold(
      body: BgApp(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: sizeHeight(20)),
            Row(
              children: [
                SizedBox(width: size(10)),
                IconButtonWidget(action: () => Get.back()),
              ],
            ),

            SizedBox(height: sizeHeight(20)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size(10)),
              child: Text.rich(
                textScaler: TextScaler.linear(scale()),
                TextSpan(
                  text: 'Make ',
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.black,
                    fontSize: size(20),
                    fontWeight: FontWeight.w900,
                  ),
                  children: [
                    TextSpan(
                      text: '\nmy code for scan to ',
                      style: TextStyle(
                        height: 1,
                        color: Colors.black,
                        fontSize: size(25),
                        fontWeight: FontWeight.w900,
                        fontVariations: <FontVariation>[FontVariation('wght', 900.0)],
                      ),
                    ),
                    TextSpan(
                      text: controller.qrType.value.name,
                      style: TextStyle(
                        height: 1,
                        color: Theme.of(context).primaryColor,
                        fontSize: size(25),
                        fontWeight: FontWeight.w900,
                        fontVariations: <FontVariation>[FontVariation('wght', 900.0)],
                      ),
                    ),
                    TextSpan(
                      text: '\n Your QR Code will be generated automatically',
                      style: TextTheme.of(context).bodyMedium?.copyWith(height: 3),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: sizeHeight(30)),
            Expanded(
              child: Container(
                decoration: decorationBox2().copyWith(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: size(15), vertical: size(20)),
                  children: [
                    Text(
                      'Enter your ${controller.qrType.value.name}',
                      textScaler: TextScaler.linear(scale()),
                      style: TextTheme.of(context).bodySmall,
                    ),

                    SizedBox(height: size(10)),
                    switch (controller.qrType.value) {
                      QrType.url => buildFormUrl(context, controller),
                      QrType.text => buildFormText(context, controller),
                      QrType.wifi => buildFormWifi(context, controller),
                      QrType.geo => buildFormGeo(context, controller),
                      QrType.contactInfo => buildFormContackInfo(context, controller),
                      QrType.calendarEvent => buildFormCalenderEvent(context, controller),
                      QrType.custom => buildFormCustom(context, controller),
                    },

                    SizedBox(height: size(10)),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.priviewQr();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PalletColor().palletColorBarcode(controller.qrType.value),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(vertical: size(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code, color: Colors.white, size: size(20)),
                          SizedBox(width: size(10)),
                          Text(
                            'Generate QR Code',
                            textScaler: TextScaler.linear(scale()),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
