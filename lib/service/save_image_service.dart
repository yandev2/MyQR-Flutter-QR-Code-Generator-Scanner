import 'dart:io';

import 'package:flutter/services.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';

class SaveImageService {
  Future<Uint8List> filePathToUint8List(String path) async {
    final file = File(path);
    return await file.readAsBytes();
  }

  Future<Uint8List> assetToUint8List(String path) async {
    final byteData = await rootBundle.load(path);
    return byteData.buffer.asUint8List();
  }

  Future<String?> saveImages(Uint8List data) async {
    try {
      final tempDir = Directory.systemTemp;
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
      final tempFile = File('${tempDir.path}/$fileName');

      await tempFile.writeAsBytes(data);

      final success = await GallerySaver.saveImage(tempFile.path, albumName: "MyQR", toDcim: true);
      return success == true ? 'successfully saved barcode to gallery' : null;
    } catch (e) {
      return null;
    }
  }
}
