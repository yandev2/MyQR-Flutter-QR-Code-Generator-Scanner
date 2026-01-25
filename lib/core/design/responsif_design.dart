import 'package:flutter_screenutil/flutter_screenutil.dart';

double size(int size) {
  return size * ScreenUtil().scaleWidth;
}

double scale() {
  return ScreenUtil().scaleWidth;
}

double sizeHeight(int size) {
  return size * ScreenUtil().scaleHeight;
}
