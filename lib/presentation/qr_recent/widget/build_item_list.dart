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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${data?.data}',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
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

        SizedBox(height: size(10)),
        Row(
          spacing: size(5),
          children: [
            Expanded(
              flex: 2,
              child: Bounceable(
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
                  padding: EdgeInsets.symmetric(vertical: size(10)),
                  decoration: decorationBox(),
                  child: Row(
                    spacing: size(5),
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: size(20),
                        color: PalletColor().palletApp(AppStyle.success),
                      ),
                      Text(
                        'View',
                        textScaler: TextScaler.linear(scale()),
                        style: TextTheme.of(context).bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Bounceable(
                onTap: () => showGWDialog(
                  title: 'Delete',
                  message: 'Continue deleting history?',
                  onRight: () => controller.deleteRecent(data!.id!),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: size(10)),
                  decoration: decorationBox(),
                  child: Row(
                    spacing: size(5),
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        size: size(20),
                        color: PalletColor().palletApp(AppStyle.danger),
                      ),
                      Text(
                        'Delete',
                        textScaler: TextScaler.linear(scale()),
                        style: TextTheme.of(context).bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
