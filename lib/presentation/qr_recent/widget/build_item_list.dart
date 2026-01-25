import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/color/pallet_color.dart';
import '../../../core/design/box_decoration_design.dart';
import '../../../core/design/responsif_design.dart';
import '../../../core/enum/app_style.dart';
import '../../../core/model/recent_model.dart';
import '../../../core/widget/dialog_app_widget.dart';
import '../../../core/widget/qr_show_widget.dart';
import '../controller/qr_recent_controller.dart';

Widget buildItemList(RecentModel? data, BuildContext context, QrRecentController controller) {
  return Container(
    padding: EdgeInsets.all(10).w,
    margin: EdgeInsets.only(bottom: 10).w,
    decoration: decorationBox2(),
    child: Row(
      spacing: size(10),
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                '${data?.data}',
                textScaler: TextScaler.linear(scale()),
                style: TextTheme.of(context).bodyMedium,
              ),
              Text(
                'Type: ${data?.type}',
                textScaler: TextScaler.linear(scale()),
                style: TextTheme.of(context).bodySmall,
              ),
              Text(
                'Action: ${data?.action}',
                textScaler: TextScaler.linear(scale()),
                style: TextTheme.of(context).bodySmall,
              ),
            ],
          ),
        ),

        Bounceable(
          onTap: () {
            Get.dialog(
              QrShowWidget(
                data: RecentModel(
                  data: data!.data!,
                  title: data.title,
                  type: data.type,
                  action: data.action,
                  color: data.color,
                  icon: data.icon,
                ),
              ),
            );
          },
          child: Container(
            height: size(50),
            width: size(50),
            decoration: decorationBox(),
            child: Icon(
              Icons.remove_red_eye,
              size: size(20),
              color: PalletColor().palletApp(AppStyle.success),
            ),
          ),
        ),

        Bounceable(
          onTap: () => showGWDialog(
            title: 'Delete',
            message: 'Continue deleting history?',
            onRight: () => controller.deleteRecent(data!.id!),
          ),
          child: Container(
            height: size(50),
            width: size(50),
            decoration: decorationBox(),
            child: Icon(
              Icons.delete,
              size: size(20),
              color: PalletColor().palletApp(AppStyle.danger),
            ),
          ),
        ),
      ],
    ),
  );
}
