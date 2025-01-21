import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';

class ImagePickerState extends ChangeNotifier {
  ImagePickerState() {
    _init();
  }

  final _imagePicker = ImagePicker();

  String? profileImagePath;
  File? _file;

  File? get file => _file;

  Future<void> _init() async {

    var rng = Random();
    final directory = await getApplicationSupportDirectory();
    final filePath = '${directory.path}/${rng.nextInt(100)}/profileScreen.png';
    _file = File(filePath);

    notifyListeners();
  }

//Método para adicionar foto da galeria
  Future<void> getImageFromGallery() async {
    final imageSelected =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (imageSelected == null) {
      return;
    }

    final path = imageSelected.path;
    final bytes = await File(path).readAsBytes();
    print('bytes:' +bytes.toString());
    final directory = await getApplicationDocumentsDirectory();

    var rng = Random();
    final pathProfileScreen = '${directory.path}/images/${rng.nextInt(100)}.png';

    final finalDirectory = File(
      pathProfileScreen,
    );
    print('finalDirectory: ' + finalDirectory.toString());
    if (finalDirectory.existsSync()) {

      await finalDirectory.create(recursive: true);
    }

    await finalDirectory.writeAsBytes(bytes);

    _file = finalDirectory;
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
