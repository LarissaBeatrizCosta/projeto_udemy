import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerState extends ChangeNotifier {
  final _imagePicker = ImagePicker();

  String? profileImagePath;

  ///Método para adicionar foto da galeria
  Future<void> getImageFromGallery() async {
    final imageSelected =
    await _imagePicker.pickImage(source: ImageSource.gallery);

    if (imageSelected != null) {
      final directory = await getApplicationSupportDirectory();
      final pathProfileScreen = '${directory.path}/profileScreen.png';

      final File newImage = await File(imageSelected.path).copy(
          pathProfileScreen);

      profileImagePath = newImage.path;
      notifyListeners();
    }
  }

  ///Método para adicionar foto da câmera
  Future<void> getImageFromCamera() async {
    final imageSelected =
    await _imagePicker.pickImage(source: ImageSource.camera);

    if (imageSelected != null) {
      final directory = await getApplicationSupportDirectory();
      final pathProfileScreen = '${directory.path}/profileScreen.png';

      final File newImage = await File(imageSelected.path).copy(
          pathProfileScreen);

      profileImagePath = newImage.path;
      notifyListeners();
    }
  }
}
