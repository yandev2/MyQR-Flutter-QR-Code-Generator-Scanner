import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myqrcode/core/design/responsif_design.dart';

import '../enum/app_style.dart';

class AlertStyle {
  final Color bgLight;
  final Color bgDark;
  final Color iconColor;
  final IconData icon;

  const AlertStyle({
    required this.bgLight,
    required this.bgDark,
    required this.iconColor,
    required this.icon,
  });

  static AlertStyle of(AppStyle type) {
    switch (type) {
      case AppStyle.success:
        return AlertStyle(
          bgLight: Color(0xFFF1FBF5),
          bgDark: Color(0xFF1E2A23),
          iconColor: Colors.lightGreen,
          icon: Icons.check_circle,
        );
      case AppStyle.warning:
        return AlertStyle(
          bgLight: Color(0xFFFFF7ED),
          bgDark: Color(0xFF2B2415),
          iconColor: Colors.amber,
          icon: Icons.warning_rounded,
        );
      case AppStyle.danger:
        return AlertStyle(
          bgLight: Color(0xFFFFF1F2),
          bgDark: Color(0xFF2A1E1F),
          iconColor: Colors.red,
          icon: Icons.cancel,
        );
      case AppStyle.primary:
        return AlertStyle(
          bgLight: Color(0xFFF1F5FF),
          bgDark: Color(0xFF1E2433),
          iconColor: Color.fromARGB(255, 68, 35, 253),
          icon: Icons.info,
        );

      case AppStyle.custom:
        return AlertStyle(
          bgLight: Color(0xFFF1F5FF),
          bgDark: Color(0xFF1E2433),
          iconColor: Color.fromARGB(255, 68, 35, 253),
          icon: Icons.info,
        );
    }
  }
}

void showAlert({
  required String title,
  required String message,
  AppStyle type = AppStyle.primary,
  String? actionText,
  VoidCallback? onAction,
}) {
  final style = AlertStyle.of(type);

  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.TOP,
    backgroundColor: style.bgLight,
    margin: const EdgeInsets.all(16),
    borderRadius: 12,
    boxShadows: [
      // ignore: deprecated_member_use
      BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 8)),
    ],
    padding: const EdgeInsets.all(16),
    titleText: Row(
      children: [
        Icon(style.icon, color: style.iconColor, size: size(20)),
        SizedBox(width: size(8)),
        Expanded(
          child: Text(
            title,
            textScaler: TextScaler.linear(ScreenUtil().scaleWidth),
            style: TextTheme.of(Get.context as BuildContext).titleMedium,
          ),
        ),
      ],
    ),
    messageText: Padding(
      padding: EdgeInsets.only(left: 28, top: 6).w,
      child: Text(
        message,
        textScaler: TextScaler.linear(ScreenUtil().scaleWidth),
        style: TextTheme.of(Get.context as BuildContext).bodyMedium,
      ),
    ),
    mainButton: actionText != null
        ? TextButton(
            onPressed: () {
              Get.back();
              onAction?.call();
            },
            child: Text(
              actionText,
              style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.w600),
            ),
          )
        : null,
    duration: const Duration(seconds: 4),
  );
}
