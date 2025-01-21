import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerState extends ChangeNotifier {
  ImagePickerState() {
    _init();
  }

  final _imagePicker = ImagePicker();

  String? profileImagePath;
  File? _file;

  File? get file => _file;

  Future<void> _init() async {
    final directory = await getApplicationSupportDirectory();
    final filePath = '${directory.path}/profileScreen.png';
    _file = File(filePath);

    notifyListeners();
  }

//Método para adicionar foto da galeria
  Future<void> getImageFromGallery() async {
    File? profileImagePath;
    final imageSelected =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (imageSelected == null) {
      return;
    }

    final path = imageSelected.path;
    final bytes = await File(path).readAsBytes();

    final directory = await getApplicationDocumentsDirectory();
    final pathProfileScreen = '${directory.path}/images/profileScreen.png';

    final finalDirectory = File(
      pathProfileScreen,
    );

    if (finalDirectory.existsSync()) {
      await finalDirectory.create();
    }

    profileImagePath = finalDirectory;
    await finalDirectory.writeAsBytes(bytes);
    notifyListeners();
  }

  ///Método para adicionar foto da câmera
  Future<void> getImageFromCamera() async {
    final imageSelected =
        await _imagePicker.pickImage(source: ImageSource.camera);

    if (imageSelected != null) {
      final directory = await getApplicationSupportDirectory();
      final pathProfileScreen = '${directory.path}/profileScreen.png';

      final File newImage =
          await File(imageSelected.path).copy(pathProfileScreen);

      profileImagePath = newImage.path;
      notifyListeners();
    }
  }
}
