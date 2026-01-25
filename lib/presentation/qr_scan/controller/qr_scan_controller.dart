import 'dart:async';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myqrcode/core/enum/barcode_type.dart';
import 'package:myqrcode/core/widget/qr_show_widget.dart';
import 'package:myqrcode/service/dependency_service.dart';

import '../../../core/color/pallet_color.dart';
import '../../../core/enum/app_style.dart';
import '../../../core/model/recent_model.dart';
import '../../../core/widget/alert_widget.dart';

class QrScanController extends GetxController {
  final dep = Get.find<DependencyService>();

  MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    returnImage: true,
    torchEnabled: false,
    autoZoom: false,
  );

  Timer? _hideTimer;

  final zoom = 0.0.obs;
  final flashOn = false.obs;
  final isFront = false.obs;
  final isBarcodeDetected = false.obs;

  final image = Rx<Uint8List?>(null);
  final data = ''.obs;

  void onBarcodeDetected() {
    isBarcodeDetected.value = true;
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(milliseconds: 800), () {
      isBarcodeDetected.value = false;
    });
  }

  @override
  void onClose() async {
    _hideTimer?.cancel();
    await controller.stop();
    await controller.dispose();
    super.onClose();
  }

  Future scanForImageFile() async {
    final image = await dep.pickedImage.pickImage();
    if (image == null) {
      showAlert(
        title: 'Ups',
        message: 'an error occurred while taking the picture',
        type: AppStyle.danger,
      );
    } else {
      final result = await controller.analyzeImage(image);
      if (result != null && result.barcodes.isNotEmpty) {
        if (Get.isDialogOpen == true) return;
        await priviewQr(result);
      } else {
        showAlert(title: 'Ups', message: 'QR code cannot be read', type: AppStyle.danger);
      }
    }
  }

  Future priviewQr(BarcodeCapture barcode) async {
    await controller.stop();
    final result = await saveToRecent(
      RecentModel(
        data: barcode.barcodes.last.rawValue,
        title: 'Result Scan QR ${barcode.barcodes.last.type.name}',
        type: barcode.barcodes.last.type.name,
        color: PalletColor()
            .palletColorBarcode(QrType.values.byName(barcode.barcodes.last.type.name))
            .toARGB32()
            .toString(),
        action: 'scan',
        icon: QrType.values.contains(QrType.values.byName(barcode.barcodes.last.type.name))
            ? await dep.saveImage.assetToUint8List(
                'assets/image/${barcode.barcodes.last.type.name}.png',
              )
            : await dep.saveImage.assetToUint8List('assets/image/custom.png'),
      ),
    );

    result != null
        ? Get.dialog(QrShowWidget(data: result)).then((_) async {
            await controller.start();
          })
        : null;
  }

  Future<RecentModel?> saveToRecent(RecentModel qr) async {
    final data = RecentModel(
      data: qr.data,
      title: 'Here your QR ',
      type: qr.type,
      action: 'scan',
      color: PalletColor().palletColorBarcode(QrType.values.byName(qr.type!)).toARGB32().toString(),
      icon: qr.icon,
    );
    await dep.db.addRecent(data);
    return data;
  }
}
