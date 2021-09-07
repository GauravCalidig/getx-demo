import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final datacount = GetStorage();

class SumController extends GetxController {
  final count1 = 0.obs;
  final count2 = 0.obs;

  int get sum => count1.value + count2.value;

  increment() => count1.value++;

  increment2() => count2.value++;

  /// Once the controller has entered memory, onInit will be called.
  /// It is preferable to use onInit instead of class constructors or initState method.
  /// Use onInit to trigger initial events like API searches, listeners registration
  /// or Workers registration.
  /// Workers are event handlers, they do not modify the final result,
  /// but it allows you to listen to an event and trigger customized actions.
  /// Here is an outline of how you can use them:
  @override
  onInit() {
    /// Called every time the variable $_ is changed
    ever(count1, (_) => print("$_ has been changed"));

    /// Called first time the variable $_ is changed
    once(count1, (_) => print("$_ was changed once"));

    /// Called once there has been no action on observable for 1 second
    debounce(count1, (_) => print("debouce$_"), time: Duration(seconds: 1));

    /// Only reads the observable every 1 second
    interval(count1, (_) => print("interval $_"), time: Duration(seconds: 1));
  }
}

class NewController extends GetxController {
  final count = 0.obs;
  final list = [].obs;

  addText(text) {
    list.add(text);
    datacount.write("cart", list);
    print(datacount.read("cart"));
  }

  increment(text) {
    count.value++;
    addText("Product $count");
    if (!Get.isSnackbarOpen!)
      Get.snackbar("Product $count", "Added to cart",
          snackPosition: SnackPosition.TOP, onTap: (e) {
        Get.toNamed("/cart");
      });
  }

  @override
  onInit() {
    super.onInit();

    /// Called every time the variable $_ is changed
    ever(count, (_) => print("$_ has been changed"));

    /// Called first time the variable $_ is changed
    once(count, (_) => print("$_ was changed once"));

    /// Called once there has been no action on observable for 1 second
    debounce(count, (_) {}, time: Duration(seconds: 1));

    /// Only reads the observable every 1 second
    interval(count, (_) => print("interval $_"), time: Duration(seconds: 1));
  }
}
