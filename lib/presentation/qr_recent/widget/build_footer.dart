import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/design/responsif_design.dart';
import '../controller/qr_recent_controller.dart';

Obx buildFooter(QrRecentController controller, BuildContext context) {
  return Obx(
    () => SliverList.list(
      children: [
        if (controller.isLoading.isTrue && controller.data.length > 1)
          Container(
            padding: EdgeInsets.all(size(20)),
            child: Center(child: CircularProgressIndicator()),
          ),

        if (controller.hasMore.isFalse)
          Container(
            padding: EdgeInsets.all(size(20)),
            child: Center(
              child: Text(
                'all history has been displayed',
                textScaler: TextScaler.linear(scale()),
                style: TextTheme.of(context).bodySmall,
              ),
            ),
          ),
        SizedBox(height: size(60)),
      ],
    ),
  );
}
