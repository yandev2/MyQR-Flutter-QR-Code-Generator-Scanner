import 'package:image_picker/image_picker.dart';

class PickImageService {
  Future<String?> pickImage() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1080,
      maxHeight: 1080,
      imageQuality: 50,
    );
    if (picker!.path.isEmpty) {
      return null;
    } else {
      return picker.path;
    }
  }
}
