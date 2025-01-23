import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarHelp extends ChangeNotifier {
  Future<void> sucess(String msg) async {
    Get.snackbar(
      'Sucesso',
      msg,
      colorText: Colors.black,
      backgroundColor: Colors.lightGreen.withValues(),
    );
  }

  Future<void> error(String msg) async {
    Get.snackbar(
      'Erro',
      msg,
      colorText: Colors.black,
      backgroundColor: Colors.redAccent.withValues(),
    );
  }
}
