import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

final scanSize = 250.0 * ScreenUtil().scaleWidth;
Rect buildScanWindow(Size previewSize) {
  return Rect.fromCenter(
    center: Offset(125 * ScreenUtil().scaleWidth, 125 * ScreenUtil().scaleWidth),
    width: scanSize,
    height: scanSize,
  );
}
