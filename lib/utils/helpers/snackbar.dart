import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarHelp extends ChangeNotifier {
  Future<void> sucess(String msg) async {
    Get.snackbar(
      'Sucesso',
      msg,
      colorText: Colors.white,
      backgroundColor: Colors.greenAccent.withValues(),
    );
  }

  void error(String msg) {
    Get.snackbar(
      'Erro',
      msg,
      colorText: Colors.white,
      backgroundColor: Colors.redAccent.withValues(),
    );
  }
}
