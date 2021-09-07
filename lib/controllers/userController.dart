import 'package:get/get.dart';
import 'package:getx/models/user.dart';

class UserController extends GetxController {
  final user = User().obs;

  updateUser(int count) {
    //Which is better??

    //Option #1
    user().name = "gaurav";
    user().count = count;

    //Option #2
    user.update((value) {
      value?.name = 'gaurav';
      value?.count = count;
    });
  }
}
