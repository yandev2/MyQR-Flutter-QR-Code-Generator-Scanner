import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myqrcode/presentation/qr_recent/controller/qr_recent_controller.dart';
import 'package:myqrcode/presentation/qr_recent/widget/build_header.dart';
import '../widget/build_footer.dart';
import '../widget/build_list_recent.dart';

class QrRecentPage extends StatelessWidget {
  const QrRecentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QrRecentController>();

    return Scaffold(
      body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        onRefresh: () => controller.onRefresh(),
        child: CustomScrollView(
          controller: controller.scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(flexibleSpace: buildHeader(context, controller)),
            buildListRecent(controller),
            buildFooter(controller, context),
          ],
        ),
      ),
    );
  }
}
