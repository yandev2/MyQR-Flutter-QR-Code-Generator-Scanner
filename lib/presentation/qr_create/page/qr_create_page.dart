import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myqrcode/presentation/qr_create/controller/qr_create_controller.dart';
import 'package:myqrcode/presentation/qr_create/widget/build_collaborate.dart';
import 'package:myqrcode/routes/route_app/route_name.dart';
import '../../../core/design/responsif_design.dart';
import '../widget/build_card_feature.dart';
import '../widget/build_header.dart';

class QrCreatePage extends StatelessWidget {
  const QrCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QrCreateController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10).w,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            buildHeader(context),
            buildCollaborate(controller, context),
            SliverGrid.builder(
              itemCount: controller.menuCreateQr.getRange(0, 4).length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20 * ScreenUtil().scaleWidth,
                crossAxisSpacing: 20 * ScreenUtil().scaleWidth,
                childAspectRatio: 2.2 / 1.6,
              ),
              itemBuilder: (context, index) {
                final data = controller.menuCreateQr.getRange(0, 4).toList()[index];
                return buildCardFeature(data, () {
                  controller.clearValue();
                  controller.qrType.value = data;
                  Get.toNamed(RouteName.createqr);
                });
              },
            ),

            SliverList.list(
              children: [
                SizedBox(height: size(20)),
                buildCardFeature(controller.menuCreateQr[4], () {
                  controller.clearValue();
                  controller.qrType.value = controller.menuCreateQr[4];
                  Get.toNamed(RouteName.createqr);
                }),
                SizedBox(height: size(20)),
              ],
            ),

            SliverGrid.builder(
              itemCount: controller.menuCreateQr.getRange(5, 7).length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20 * ScreenUtil().scaleWidth,
                crossAxisSpacing: 20 * ScreenUtil().scaleWidth,
                childAspectRatio: 2.2 / 1.6,
              ),
              itemBuilder: (context, index) {
                final data = controller.menuCreateQr.getRange(5, 7).toList()[index];
                return buildCardFeature(data, () {
                  controller.clearValue();
                  controller.qrType.value = data;
                  Get.toNamed(RouteName.createqr);
                });
              },
            ),

            SliverList.list(
              children: [
                SizedBox(height: size(20)),
                Center(child: Text('MY QR  V.1 2026 BY JUNDEV')),
                SizedBox(height: size(100)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
