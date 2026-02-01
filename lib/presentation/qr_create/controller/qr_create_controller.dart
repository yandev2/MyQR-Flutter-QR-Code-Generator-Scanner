import 'package:flutter/cupertino.dart';
import 'package:flutter_native_contact_picker_plus/flutter_native_contact_picker_plus.dart';
import 'package:flutter_native_contact_picker_plus/model/contact_model.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:myqrcode/core/color/pallet_color.dart';
import 'package:myqrcode/core/enum/barcode_type.dart';
import 'package:myqrcode/core/model/recent_model.dart';
import 'package:myqrcode/core/widget/qr_show_widget.dart';
import 'package:myqrcode/service/dependency_service.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCreateController extends GetxController {
  final menuCreateQr = [
    QrType.url,
    QrType.text,
    QrType.wifi,
    QrType.geo,
    QrType.contactInfo,
    QrType.calendarEvent,
    QrType.custom,
  ].obs;

  final dep = Get.find<DependencyService>();
  final contactPicker = FlutterContactPickerPlus();

  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  final textController4 = TextEditingController();
  final textController5 = TextEditingController();

  final qrValue = ''.obs;
  final contacts = <Contact?>[].obs;
  final image = ''.obs;
  final qrType = QrType.custom.obs;
  final checkBoxValue = false.obs;
  final dropdownSelect = 'WPA/WPA2'.obs;
  final dropdownItem = ['WPA/WPA2', 'WEP', 'No Password'];

  @override
  void onClose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    textController4.dispose();
    textController5.dispose();
    super.onClose();
  }

  void clearValue() {
    contacts.clear();
    image.value = '';
    qrValue.value = '';
    checkBoxValue.value = false;
    qrType.value = QrType.custom;
    dropdownSelect.value = 'WPA/WPA2';

    textController1.clear();
    textController2.clear();
    textController3.clear();
    textController4.clear();
    textController5.clear();
  }

  Future priviewQr() async {
    switch (qrType.value) {
      case QrType.url:
        textController1.text.replaceAll('https://', '');
        qrValue.value = 'https://${textController1.text}';
        break;
      case QrType.text:
        qrValue.value = textController1.text;
        break;
      case QrType.wifi:
        qrValue.value =
            'WIFI:T:${dropdownSelect.value};S:${textController1.text};P:${textController2.text};H:${checkBoxValue.value};';
        break;
      case QrType.geo:
        qrValue.value =
            'geo:${textController1.text},${textController2.text}?q=${textController3.text}';
        break;
      case QrType.contactInfo:
        qrValue.value =
            'MECARD:N:${textController1.text};TEL:${textController2.text};${textController3.text};';
        break;
      case QrType.calendarEvent:
        qrValue.value =
            'BEGIN:VEVENT\nSUMMARY:${textController1.text}\nDTSTART:${textController2.text}\nDTEND:${textController3.text}\nLOCATION:${textController4.text}\nDESCRIPTION:${textController5.text}\nEND:VEVENT';
        break;
      case QrType.custom:
        qrValue.value = textController2.text;
        break;
    }
    final qr = await saveToRecent();
    Get.dialog(QrShowWidget(data: qr));
  }

  Future<RecentModel> saveToRecent() async {
    final data = RecentModel(
      data: qrValue.value,
      title: 'Here your QR ${qrType.value.name}',
      type: qrType.value.name,
      action: 'generate',
      color: PalletColor().palletColorBarcode(qrType.value).toARGB32().toString(),
      icon: qrType.value == QrType.custom && image.value != ''
          ? await dep.saveImage.filePathToUint8List(image.value)
          : await dep.saveImage.assetToUint8List("assets/image/${qrType.value.name}.png"),
    );
    await dep.db.addRecent(data);
    return data;
  }

  Future contackEmail() async {
    final subject = Uri.encodeComponent('Collaborate');
    final body = Uri.encodeComponent('Hello,\n\nI would like to collaborate with you.');
    final Uri email = Uri.parse('mailto:ryanhappyjalay2461@gmail.com?subject=$subject&body=$body');
    if (!await launchUrl(email)) {}
  }
}
