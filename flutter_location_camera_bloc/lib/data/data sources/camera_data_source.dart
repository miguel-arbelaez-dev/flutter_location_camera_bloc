import 'package:image_picker/image_picker.dart';

abstract class CameraDataSource {
  Future<String> takePhoto();
}

class CameraDataSourceImpl implements CameraDataSource {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<String> takePhoto() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) throw Exception('No image selected');
    return image.path;
  }
}
