import 'package:flutter/material.dart';

import '../../../core/color/pallet_color.dart';
import '../../../core/design/responsif_design.dart';
import '../../../core/enum/app_style.dart';

SliverAppBar buildHeader(BuildContext context) {
  return SliverAppBar(
    toolbarHeight: size(70),
    floating: true,
    flexibleSpace: Text.rich(
      textScaler: TextScaler.linear(scale()),
      TextSpan(
        children: [
          TextSpan(
            text: 'Choose\n',
            style: TextTheme.of(
              context,
            ).titleLarge?.copyWith(color: PalletColor().palletApp(AppStyle.primary), fontSize: 20),
          ),
          TextSpan(
            text: 'Generate you Qrcode\n',
            style: TextTheme.of(context).titleLarge?.copyWith(fontSize: 30),
          ),
          TextSpan(
            text: '  with AI mobile scanner technology',
            style: TextTheme.of(context).bodySmall?.copyWith(height: 0.8),
          ),
        ],
      ),
    ),
  );
}
