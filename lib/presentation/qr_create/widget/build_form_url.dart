import 'package:flutter/material.dart';
import '../../../core/color/pallet_color.dart';
import '../../../core/design/responsif_design.dart';
import '../controller/qr_create_controller.dart';

Widget buildFormUrl(BuildContext context, QrCreateController controller) {
  return TextField(
    maxLines: null,
    controller: controller.textController1,
    keyboardType: TextInputType.url,
    style: TextTheme.of(context).bodyLarge,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      hintText: 'Enter your ${controller.qrType.value.name} here',
      hintStyle: TextTheme.of(context).bodyMedium,
      prefixIcon: Container(
        padding: EdgeInsets.all(size(13)),
        height: size(10),
        child: Image.asset(
          'assets/image/${controller.qrType.value.name}.png',
          color: PalletColor().palletColorBarcode(controller.qrType.value),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: PalletColor().palletColorBarcode(controller.qrType.value)),
      ),
      contentPadding: EdgeInsets.all(size(10)),
    ),
  );
}
