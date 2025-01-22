import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserBind extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UserController>(()=> UserController());
  }

}