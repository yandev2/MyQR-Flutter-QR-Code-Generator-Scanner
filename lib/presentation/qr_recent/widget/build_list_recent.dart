import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../core/design/responsif_design.dart';
import '../controller/qr_recent_controller.dart';
import 'build_item_list.dart';

SliverPadding buildListRecent(QrRecentController controller) {
  return SliverPadding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: size(15)),
    sliver: Obx(
      () => SliverList.builder(
        itemCount: controller.data.length,
        itemBuilder: (context, index) {
          final data = controller.data[index];
          return buildItemList(data, context, controller);
        },
      ),
    ),
  );
}
