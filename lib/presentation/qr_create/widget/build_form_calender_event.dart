import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/color/pallet_color.dart';
import '../../../core/design/responsif_design.dart';
import '../controller/qr_create_controller.dart';

Widget buildFormCalenderEvent(BuildContext context, QrCreateController controller) {
  return Column(
    children: [
      SizedBox(height: size(10)),
      TextField(
        maxLines: 1,
        controller: controller.textController1,
        keyboardType: TextInputType.text,
        style: TextTheme.of(context).bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter your event name here',
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
      Row(
        spacing: size(15),
        children: [
          Expanded(
            child: TextField(
              maxLines: 1,
              readOnly: true,
              controller: controller.textController2,
              keyboardType: TextInputType.text,
              style: TextTheme.of(context).bodyLarge,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Enter start date',
                hintStyle: TextTheme.of(context).bodyMedium,
                prefixIcon: Container(
                  padding: EdgeInsets.all(size(13)),
                  height: size(10),
                  child: Icon(
                    Icons.calendar_month,
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
              onTap: () async {
                final date = await showDatePicker(
                  context: Get.context as BuildContext,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                  initialDate: DateTime.now(),
                );
                controller.textController2.text =
                    date
                        ?.toIso8601String()
                        .replaceAll('-', '')
                        .replaceAll('.', '')
                        .replaceAll(':', '') ??
                    '';
              },
            ),
          ),
          Expanded(
            child: TextField(
              maxLines: 1,
              readOnly: true,
              controller: controller.textController3,
              keyboardType: TextInputType.text,
              style: TextTheme.of(context).bodyLarge,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Enter end date',
                hintStyle: TextTheme.of(context).bodyMedium,
                prefixIcon: Container(
                  padding: EdgeInsets.all(size(13)),
                  height: size(10),
                  child: Icon(
                    Icons.calendar_month,
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
              onTap: () async {
                final date = await showDatePicker(
                  context: Get.context as BuildContext,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                  initialDate: DateTime.now(),
                );
                controller.textController3.text =
                    date
                        ?.toIso8601String()
                        .replaceAll('-', '')
                        .replaceAll('.', '')
                        .replaceAll(':', '') ??
                    '';
              },
            ),
          ),
        ],
      ),

      SizedBox(height: size(10)),
      TextField(
        maxLines: 3,
        controller: controller.textController4,
        keyboardType: TextInputType.streetAddress,
        style: TextTheme.of(context).bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter your location here',
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

      SizedBox(height: size(10)),
      TextField(
        maxLines: 3,
        controller: controller.textController5,
        keyboardType: TextInputType.streetAddress,
        style: TextTheme.of(context).bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter your description event here',
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
