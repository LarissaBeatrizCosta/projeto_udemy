import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  Rx<String> userToken = ''.obs;

  set setUserToken(String? value) {
    if (value != null) {
      userToken.value = value;
      saveLocalUser(value);
    }
  }
}

Future<void> saveLocalUser(String value) async {
  GetStorage box = GetStorage();
  box.write('userToken', value);
  await box.save();
}

Future<String?> loadLocalUse() async {
  GetStorage box = GetStorage();
  final String? value = box.read('userToken');
  if (value != null) {
    return value;
  }
  return null;
}
