import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/color/pallet_color.dart';
import '../../../core/design/responsif_design.dart';
import '../../../core/widget/checkbox_card_widget.dart';
import '../controller/qr_create_controller.dart';

Widget buildFormWifi(BuildContext context, QrCreateController controller) {
  return Column(
    children: [
      TextField(
        maxLines: null,
        controller: controller.textController1,
        keyboardType: TextInputType.text,
        style: TextTheme.of(context).bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter your ${controller.qrType.value.name} SSID here',
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
            borderSide: BorderSide(
              color: PalletColor().palletColorBarcode(controller.qrType.value),
            ),
          ),
          contentPadding: EdgeInsets.all(size(10)),
        ),
      ),

      SizedBox(height: size(10)),
      TextField(
        maxLines: null,
        controller: controller.textController2,
        keyboardType: TextInputType.text,
        style: TextTheme.of(context).bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter your ${controller.qrType.value.name} password here',
          hintStyle: TextTheme.of(context).bodyMedium,
          prefixIcon: Container(
            padding: EdgeInsets.all(size(13)),
            height: size(10),
            child: Icon(
              Icons.lock,
              color: PalletColor().palletColorBarcode(controller.qrType.value),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: PalletColor().palletColorBarcode(controller.qrType.value),
            ),
          ),
          contentPadding: EdgeInsets.all(size(10)),
        ),
      ),

      SizedBox(height: size(10)),
      Row(
        spacing: size(10),
        children: [
          Expanded(
            child: Obx(
              () => CheckboxCard(
                value: controller.checkBoxValue.value,
                borderRadius: 0,
                checkColor: PalletColor().palletColorBarcode(controller.qrType.value),
                onTap: () => controller.checkBoxValue.value = !controller.checkBoxValue.value,
                title: 'Hide',
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => DropdownButton<String>(
                borderRadius: BorderRadius.circular(10),
                padding: EdgeInsets.all(10).w,
                isExpanded: true,
                alignment: Alignment.centerLeft,
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                value: controller.dropdownSelect.value,
                items: controller.dropdownItem.map((item) {
                  return DropdownMenuItem<String>(value: item, child: Text(item));
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.dropdownSelect.value = value;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
