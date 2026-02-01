import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import '../../../core/design/responsif_design.dart';
import '../controller/home_controller.dart';

Obx buildWidgetNavigationbar(HomeController controller) {
  return Obx(
    () => CircleNavBar(
      activeIndex: controller.indexMenu.value,
      onTap: (index) => controller.changeMenu(index),
      color: Color(0xFFF5F7FF),
      shadowColor: const Color.fromARGB(141, 255, 255, 255),
      elevation: 2,
      height: size(60),
      circleColor: Theme.of(Get.context as BuildContext).primaryColor,
      circleWidth: size(60),
      padding: EdgeInsets.symmetric(horizontal: size(10), vertical: size(10)),
      cornerRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 188, 218, 255)],
      ),
      activeIcons: [
        Icon(
          Icons.qr_code_2,
          size: size(30),
          color: Theme.of(Get.context as BuildContext).primaryColor,
        ),
        Icon(
          Icons.dashboard,
          size: size(30),
          color: Theme.of(Get.context as BuildContext).primaryColor,
        ),
        Icon(
          Icons.history,
          size: size(30),
          color: Theme.of(Get.context as BuildContext).primaryColor,
        ),
      ],
      inactiveIcons: [
        Column(
          children: [
            Icon(Icons.qr_code_2, size: size(20), color: Colors.grey),
            Text(
              'Scan',
              textScaler: TextScaler.linear(scale()),
              style: TextStyle(fontSize: size(10), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            Icon(Icons.dashboard, size: size(20), color: Colors.grey),
            Text(
              'Generate',
              textScaler: TextScaler.linear(scale()),
              style: TextStyle(fontSize: size(10), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            Icon(Icons.history, size: size(20), color: Colors.grey),
            Text(
              'Recent',
              textScaler: TextScaler.linear(scale()),
              style: TextStyle(fontSize: size(10), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}
