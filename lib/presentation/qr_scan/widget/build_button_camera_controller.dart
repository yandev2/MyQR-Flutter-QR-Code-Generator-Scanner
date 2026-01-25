import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';

import '../../../core/design/box_decoration_design.dart';
import '../../../core/design/responsif_design.dart';

Widget buildButtonCameraController(String title, IconData icon, RxBool value, VoidCallback action) {
  return Bounceable(
    onTap: action,
    child: Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: size(10), vertical: size(5)),
        decoration: decorationBox2(),
        child: Row(
          spacing: size(5),
          children: [
            Icon(icon, size: size(20), color: value.isFalse ? Colors.black : Colors.amber),
            Text(
              title,
              textScaler: TextScaler.linear(scale()),
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
      ),
    ),
  );
}
