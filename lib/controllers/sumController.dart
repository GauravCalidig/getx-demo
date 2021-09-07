import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
    list.add(Text(text));
  }

  increment(text) {
    count.value++;
  }

  @override
  onInit() {
    super.onInit();

    /// Called every time the variable $_ is changed
    ever(count, (_) => print("$_ has been changed"));

    /// Called first time the variable $_ is changed
    once(count, (_) => print("$_ was changed once"));

    /// Called once there has been no action on observable for 1 second
    debounce(count, (_) {
      addText("Product $count");
      Get.snackbar("Product $count", "Added to cart");
    }, time: Duration(seconds: 1));

    /// Only reads the observable every 1 second
    interval(count, (_) => print("interval $_"), time: Duration(seconds: 1));
  }
}
