import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myqrcode/core/design/responsif_design.dart';
import 'package:myqrcode/core/enum/app_style.dart';

class GWDialogStyle {
  final Color bg;
  final Color iconBg;
  final Color iconColor;
  final Color titleColor;
  final Color actionColor;
  final IconData icon;
  final EdgeInsets padding;

  const GWDialogStyle({
    required this.bg,
    required this.iconBg,
    required this.iconColor,
    required this.titleColor,
    required this.actionColor,
    required this.icon,
    required this.padding,
  });

  static GWDialogStyle of(AppStyle style, bool dark) {
    switch (style) {
      case AppStyle.primary:
        return GWDialogStyle(
          bg: dark ? const Color(0xFF1E2433) : Colors.white,
          iconBg: const Color(0xFFE0E7FF),
          iconColor: Color.fromARGB(255, 68, 35, 253),
          titleColor: dark ? Colors.white : Colors.black,
          actionColor: Color.fromARGB(255, 68, 35, 253),
          icon: Icons.info,
          padding: const EdgeInsets.all(20),
        );
      case AppStyle.success:
        return GWDialogStyle(
          bg: dark ? const Color(0xFF1F2A23) : Colors.white,
          iconBg: const Color(0xFFDCFCE7),
          iconColor: Colors.lightGreen,
          titleColor: dark ? Colors.white : Colors.black,
          actionColor: Colors.lightGreen,
          icon: Icons.check_circle,
          padding: const EdgeInsets.all(20),
        );
      case AppStyle.warning:
        return GWDialogStyle(
          bg: dark ? const Color(0xFF2A1E1F) : Colors.white,
          iconBg: const Color(0xFFFEE2E2),
          iconColor: Colors.amber,
          titleColor: dark ? Colors.white : Colors.black,
          actionColor: Colors.amber,
          icon: Icons.error,
          padding: const EdgeInsets.all(20),
        );
      case AppStyle.danger:
        return GWDialogStyle(
          bg: dark ? const Color(0xFF1E293B) : Colors.white,
          iconBg: Colors.grey.shade200,
          iconColor: Colors.red,
          titleColor: dark ? Colors.white : Colors.black,
          actionColor: Colors.red,
          icon: Icons.info_outline,
          padding: const EdgeInsets.all(16),
        );

      case AppStyle.custom:
        throw UnimplementedError();
    }
  }
}

void showGWDialog({
  required String title,
  required String message,
  AppStyle style = AppStyle.primary,
  String leftText = 'Back',
  String rightText = 'Okay!',
  VoidCallback? onLeft,
  VoidCallback? onRight,
}) {
  final dark = Get.isDarkMode;
  final styles = GWDialogStyle.of(style, dark);

  Get.dialog(
    Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: size((Get.width * 0.85).toInt()),
          padding: styles.padding,
          decoration: BoxDecoration(
            color: styles.bg,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.15),
                blurRadius: 25,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size(36),
                    height: size(36),
                    decoration: BoxDecoration(color: styles.iconBg, shape: BoxShape.circle),
                    child: Icon(styles.icon, color: styles.iconColor, size: size(20)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      textScaler: TextScaler.linear(scale()),
                      style: TextStyle(
                        fontSize: size(16),
                        fontWeight: FontWeight.w600,
                        color: styles.titleColor,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: size(12)),

              /// Message
              Text(
                message,
                textScaler: TextScaler.linear(scale()),
                style: TextStyle(
                  fontSize: size(12),
                  height: 1.5,
                  color: dark ? Colors.white70 : Colors.black87,
                ),
              ),

              SizedBox(height: size(24)),

              /// Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                      onLeft?.call();
                    },
                    child: Text(
                      leftText,
                      textScaler: TextScaler.linear(scale()),
                      style: TextStyle(color: styles.actionColor),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: styles.actionColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Get.back();
                      onRight?.call();
                    },
                    child: Text(rightText, textScaler: TextScaler.linear(scale())),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
