import 'package:get/get.dart';

import '../controllers/user_state.dart';

class UserBind extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UserState>(()=> UserState());
  }

}