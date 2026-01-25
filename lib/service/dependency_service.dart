import 'package:get/state_manager.dart';
import 'package:myqrcode/service/database_service.dart';
import 'package:myqrcode/service/permission_service.dart';
import 'package:myqrcode/service/pick_image_service.dart';
import 'package:myqrcode/service/preference_service.dart';
import 'package:myqrcode/service/save_image_service.dart';

class DependencyService extends GetxController {
  @override
  void onInit() async {
    await initDB();
    super.onInit();
  }

  final db = DatabaseService();
  final pref = PreferenceService();
  final pickedImage = PickImageService();
  final permission = PermissionService();
  final saveImage = SaveImageService();

  Future initDB() async {
    await db.databaseMain();
  }
}
