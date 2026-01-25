import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> requestContactPermission() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }
}
