import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myqrcode/core/color/pallet_color.dart';
import 'package:myqrcode/core/design/box_decoration_design.dart';
import 'package:myqrcode/core/enum/app_style.dart';
import 'package:myqrcode/core/widget/dialog_app_widget.dart';
import 'package:myqrcode/presentation/qr_recent/controller/qr_recent_controller.dart';

import '../../../core/design/responsif_design.dart';
import '../widget/build_item_list.dart';

class QrRecentPage extends StatelessWidget {
  const QrRecentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QrRecentController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: size(50),
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10).w,
          child: Row(
            children: [
              Text.rich(
                textScaler: TextScaler.linear(scale()),
                TextSpan(
                  text: 'My',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    fontVariations: <FontVariation>[FontVariation('wght', 900.0)],
                  ),
                  children: [
                    TextSpan(
                      text: 'QR',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Bounceable(
            onTap: () => showGWDialog(
              title: 'Delete all',
              message: 'Continue deleting all history?',
              style: AppStyle.danger,
              onRight: () => controller.deleteAllRecent(),
            ),
            child: Container(
              padding: EdgeInsets.all(5).w,
              decoration: decorationBox().copyWith(borderRadius: BorderRadius.circular(10)),
              child: Row(
                spacing: size(5),
                children: [
                  Icon(Icons.delete_forever, color: PalletColor().palletApp(AppStyle.danger)),
                  Text(
                    'Delete All',
                    textScaler: TextScaler.linear(scale()),
                    style: TextTheme.of(context).bodySmall,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: size(20)),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () => controller.getRecentData(),
        child: Obx(
          () => controller.isLoading.isTrue
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: EdgeInsets.all(20).w,
                  itemCount: controller.data.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = controller.data[index];
                    return buildItemList(data, context, controller);
                  },
                ),
        ),
      ),
    );
  }
}
