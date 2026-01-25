import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myqrcode/core/design/box_decoration_design.dart';
import 'package:myqrcode/core/design/responsif_design.dart';
import 'package:myqrcode/core/enum/barcode_type.dart';
import 'package:myqrcode/core/model/recent_model.dart';
import 'package:myqrcode/core/widget/alert_widget.dart';
import 'package:myqrcode/service/dependency_service.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import '../enum/app_style.dart';

class QrShowWidget extends StatefulWidget {
  const QrShowWidget({super.key, required this.data});

  final RecentModel data;
  @override
  State<QrShowWidget> createState() => _QrShowWidgetState();
}

class _QrShowWidgetState extends State<QrShowWidget> {
  RxBool isLoading = false.obs;
  final captureController = WidgetsToImageController();
  final dep = Get.find<DependencyService>();

  Future onCopys() async {
    isLoading.value = true;
    await Clipboard.setData(ClipboardData(text: widget.data.data!));
    isLoading.value = false;
    showAlert(
      title: 'Okay',
      message: '"${widget.data.data}" succesfully coppyed',
      type: AppStyle.success,
    );
  }

  Future onShares() async {
    try {
      isLoading.value = true;
      Uint8List? bytes = await captureController.capture(
        options: const CaptureOptions(
          format: ImageFormat.png,
          pixelRatio: 3.0,
          quality: 95,
          waitForAnimations: true,
          delayMs: 100,
        ),
      );
      isLoading.value = false;
      await Future.delayed(Duration(milliseconds: 500));
      final params = ShareParams(
        files: [XFile.fromData(bytes!)],
        fileNameOverrides: ['${widget.data.type}.png'],
        text: 'MyQr ${widget.data.type} Shared',
        subject: 'MyQr ${widget.data.type} Shared',
      );
      SharePlus.instance.share(params);
    } catch (e) {
      showAlert(
        title: 'Ups',
        message: 'oops, an error occurred while shared the barcode',
        type: AppStyle.danger,
      );
    }
  }

  Future onSaves() async {
    isLoading.value = true;
    Uint8List? bytes = await captureController.capture(
      options: const CaptureOptions(
        format: ImageFormat.png,
        pixelRatio: 3.0,
        quality: 95,
        waitForAnimations: true,
        delayMs: 100,
      ),
    );
    isLoading.value = false;

    if (bytes != null) {
      final result = await dep.saveImage.saveImages(bytes);
      if (result != null) {
        showAlert(
          title: 'Okay',
          message: 'barcode successfully saved to gallery',
          type: AppStyle.success,
        );
      } else {
        showAlert(
          title: 'Ups',
          message: 'oops, an error occurred while saving the barcode',
          type: AppStyle.danger,
        );
      }
    }
  }

  Future onLaunch() async {
    if (!await launchUrl(Uri.parse(widget.data.data!))) {
      showAlert(title: 'Ups', message: '${widget.data} invalid url', type: AppStyle.danger);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WidgetsToImage(
          controller: captureController,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20).w,
            padding: EdgeInsets.symmetric(horizontal: 10).w,
            width: Get.width,
            decoration: decorationBox3(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () => isLoading.isFalse ? Get.back() : null,
                    icon: Obx(
                      () => isLoading.isFalse
                          ? Icon(Icons.close, size: size(20), color: Theme.of(context).primaryColor)
                          : SizedBox(
                              height: size(12),
                              width: size(12),
                              child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                    ),
                  ),
                ),

                SizedBox(height: size(10)),
                Center(
                  child: Column(
                    children: [
                      Text(
                        '${widget.data.title}',
                        textAlign: TextAlign.center,
                        textScaler: TextScaler.linear(scale()),
                        style: TextTheme.of(context).titleMedium,
                      ),

                      SizedBox(height: size(10)),
                      Container(
                        width: size(200),
                        height: size(200),
                        padding: EdgeInsets.all(10).w,
                        decoration: decorationBox(),
                        child: PrettyQrView.data(
                          data: widget.data.data!,
                          errorCorrectLevel: QrErrorCorrectLevel.H,
                          decoration: PrettyQrDecoration(
                            image: PrettyQrDecorationImage(
                              colorFilter: ColorFilter.mode(
                                Color(int.parse(widget.data.color!)),
                                BlendMode.srcIn,
                              ),
                              image: MemoryImage(widget.data.icon!),
                            ),
                            shape: PrettyQrShape.custom(
                              const PrettyQrSquaresSymbol(color: Colors.black),
                              finderPattern: PrettyQrSmoothSymbol(
                                color: Color(int.parse(widget.data.color!)),
                              ),
                              alignmentPatterns: const PrettyQrDotsSymbol(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size(10)),
                      Container(
                        padding: EdgeInsets.all(10).w,
                        decoration: decorationBox3(),
                        child: SelectableText(
                          '${widget.data.data}',
                          textAlign: TextAlign.center,
                          textScaler: TextScaler.linear(scale()),
                          style: TextTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size(15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildButton(context, Icons.share, 'Share', onShares),
                    buildButton(context, Icons.save, 'Save', onSaves),
                    buildButton(context, Icons.copy, 'Copy', onCopys),
                  ],
                ),
                SizedBox(height: size(15)),
                if (QrType.values.byName(widget.data.type!) == QrType.url)
                  buildButtonUrl(context, Icons.web, 'Open Url', onLaunch),
                SizedBox(height: size(15)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, IconData icon, String title, VoidCallback action) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Bounceable(
          onTap: action,
          child: Container(
            height: size(50),
            width: size(50),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 238, 246, 255), Color.fromARGB(255, 199, 224, 255)],
              ),
            ),
            child: Icon(icon, size: size(20), color: Theme.of(context).primaryColor),
          ),
        ),
        Text(
          title,
          textScaler: TextScaler.linear(scale()),
          textAlign: TextAlign.start,
          style: TextTheme.of(context).bodySmall,
        ),
      ],
    );
  }

  Widget buildButtonUrl(BuildContext context, IconData icon, String title, VoidCallback action) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Bounceable(
          onTap: action,
          child: Container(
            height: size(50),
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 238, 246, 255), Color.fromARGB(255, 199, 224, 255)],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: size(10),
              children: [
                Icon(icon, size: size(25), color: Theme.of(context).primaryColor),
                Text(
                  title,
                  textScaler: TextScaler.linear(scale()),
                  textAlign: TextAlign.start,
                  style: TextTheme.of(context).bodySmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
