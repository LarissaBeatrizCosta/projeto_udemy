import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerState extends ChangeNotifier {
  ImagePickerState() {
    _init();
  }

  // Instância do Image Picker
  final _imagePicker = ImagePicker();

  // Arquivo do Path da Imagem de Perfil
  File? _file;

  File? get file => _file;

  // Caminho fixo para a imagem de perfil
  Future<String> _getProfileImagePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/profile_image.png';
  }

  // Método que inicia a tela chamando o path da imagem
  Future<void> _init() async {
    final filePath = await _getProfileImagePath();

    // Atualiza o valor da variável apenas se o arquivo existir
    final file = File(filePath);
    _file = file;

    notifyListeners();
  }

  // Método para adicionar foto da galeria
  Future<void> getImageFromGallery() async {
    final imageSelected =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (imageSelected == null) {
      return;
    }

    await saveImage(imageSelected);
  }

  // Método para adicionar foto da câmera
  Future<void> getImageFromCamera() async {
    final imageSelected =
        await _imagePicker.pickImage(source: ImageSource.camera);

    if (imageSelected == null) {
      return;
    }

    await saveImage(imageSelected);
  }

  // Salva a imagem no local fixo
  Future<void> saveImage(XFile image) async {
    final path = image.path;
    final bytes = await File(path).readAsBytes();

    final filePath = await _getProfileImagePath();
    final finalDirectory = File(filePath);

    if (!finalDirectory.parent.existsSync()) {
      await finalDirectory.parent.create(recursive: true);
    }

    await finalDirectory.writeAsBytes(bytes);

    _file = finalDirectory;

    // Log para depuração
    print("Imagem salva em: $_file");

    notifyListeners();
  }

}
