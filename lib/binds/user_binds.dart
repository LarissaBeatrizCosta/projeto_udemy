import 'package:get/get.dart';

import '../providers/user_state.dart';

class UserBind extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UserState>(()=> UserState());
  }

}