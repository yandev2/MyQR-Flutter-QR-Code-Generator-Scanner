import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import '../../../core/color/pallet_color.dart';
import '../../../core/design/box_decoration_design.dart';
import '../../../core/design/responsif_design.dart';
import '../../../core/enum/app_style.dart';
import '../../../core/widget/alert_widget.dart';
import '../controller/qr_create_controller.dart';

Widget buildFormCustom(BuildContext context, QrCreateController controller) {
  void getImage() async {
    if (controller.image.value == '') {
      final image = await controller.dep.pickedImage.pickImage();
      if (image == null) {
        showAlert(
          title: 'Ups',
          message: 'terjadi kesalahan saat mengambil foto',
          type: AppStyle.danger,
        );
      } else {
        controller.image.value = image;
      }
    } else {
      controller.image.value = '';
    }
  }

  return Column(
    children: [
      Row(
        spacing: size(15),
        children: [
          Container(
            height: size(100),
            width: size(100),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 238, 246, 255), Color.fromARGB(255, 199, 224, 255)],
              ),
            ),
            child: Obx(
              () => controller.image.value == ''
                  ? SizedBox()
                  : Image.file(File(controller.image.value), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: size(100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Bounceable(
                  onTap: () => getImage(),
                  child: Obx(
                    () => Container(
                      padding: EdgeInsets.symmetric(horizontal: size(10), vertical: size(8)),
                      decoration: decorationBox().copyWith(
                        borderRadius: BorderRadius.circular(10),
                        gradient: PalletColor().palletGradientBarcode(controller.qrType.value),
                      ),
                      child: Row(
                        spacing: size(8),
                        children: [
                          Icon(
                            controller.image.value == ''
                                ? Icons.add_a_photo_outlined
                                : Icons.delete_outline,
                            size: size(20),
                            color: Colors.black,
                          ),
                          Text(
                            controller.image.value == '' ? 'Add custom icon' : 'Delete custom icon',
                            textScaler: TextScaler.linear(scale()),
                            style: TextTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      SizedBox(height: size(10)),
      TextField(
        maxLines: 1,
        controller: controller.textController1,
        keyboardType: TextInputType.text,
        style: TextTheme.of(context).bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter your title here',
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
        maxLines: 3,
        controller: controller.textController2,
        keyboardType: TextInputType.text,
        style: TextTheme.of(context).bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter your value here',
          hintStyle: TextTheme.of(context).bodyMedium,
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
    ],
  );
}
