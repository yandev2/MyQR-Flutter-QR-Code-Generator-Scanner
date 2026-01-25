import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myqrcode/core/design/responsif_design.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key, required this.action, this.icon});

  final IconData? icon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: action,
      child: Container(
        height: size(45),
        width: size(45),
        padding: icon != null ? null : EdgeInsets.only(left: size(5)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 238, 246, 255), Color.fromARGB(255, 199, 224, 255)],
          ),
        ),
        child: Icon(
          icon ?? Icons.arrow_back_ios,
          size: 20 * ScreenUtil().scaleWidth,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
