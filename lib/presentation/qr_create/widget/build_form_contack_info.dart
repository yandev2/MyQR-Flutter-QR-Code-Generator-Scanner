import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_native_contact_picker_plus/model/contact_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/color/pallet_color.dart';
import '../../../core/design/responsif_design.dart';
import '../controller/qr_create_controller.dart';

Widget buildFormContackInfo(BuildContext context, QrCreateController controller) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Bounceable(
            onTap: () async {
              Contact? contact = await controller.contactPicker.selectContact();
              controller.textController1.text = contact?.fullName ?? '';
              controller.textController2.text = contact?.selectedPhoneNumber ?? '';
              controller.textController3.text = contact?.emailAddresses?.join('||') ?? '';
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20).w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white),
                gradient: PalletColor().palletGradientBarcode(controller.qrType.value),
              ),
              child: Row(
                spacing: size(10),
                children: [
                  Icon(Icons.contact_phone, size: size(20), color: Colors.white),
                  Text(
                    'Choose Contact In Phone',
                    textScaler: TextScaler.linear(scale()),
                    style: TextTheme.of(
                      context,
                    ).bodySmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
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
          hintText: 'Enter your ${controller.qrType.value.name} name here',
          hintStyle: TextTheme.of(context).bodyMedium,
          prefixIcon: Container(
            padding: EdgeInsets.all(size(13)),
            height: size(10),
            child: Icon(
              Icons.person,
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
        maxLines: 1,
        controller: controller.textController2,
        keyboardType: TextInputType.phone,
        style: TextTheme.of(context).bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter your ${controller.qrType.value.name} number here',
          hintStyle: TextTheme.of(context).bodyMedium,
          prefixIcon: Container(
            padding: EdgeInsets.all(size(13)),
            height: size(10),
            child: Icon(
              Icons.phone,
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
        maxLines: 1,
        controller: controller.textController3,
        keyboardType: TextInputType.emailAddress,
        style: TextTheme.of(context).bodyLarge,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Enter your ${controller.qrType.value.name} email here',
          hintStyle: TextTheme.of(context).bodyMedium,
          prefixIcon: Container(
            padding: EdgeInsets.all(size(13)),
            height: size(10),
            child: Icon(
              Icons.mail,
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
    ],
  );
}
