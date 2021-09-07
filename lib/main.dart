import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/screens/ApiTest.dart';
import 'package:getx/screens/FakeCart.dart';
import 'package:getx/screens/Other%20Functions.dart';
import 'package:getx/screens/cartItems.dart';
import 'package:getx/screens/first.dart';
import 'package:getx/screens/new.dart';
import 'package:getx/screens/second.dart';

import 'controllers/locale.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: First(),
      getPages: [
        GetPage(name: "/", page: () => First(), transition: Transition.fade),
        GetPage(name: "/second", page: () => Second()),
        GetPage(name: "/other", page: () => Others()),
        GetPage(name: "/new", page: () => NewPage()),
        GetPage(name: "/getAddress", page: () => ApiCall()),
        GetPage(
            name: "/cart",
            page: () => CartItems(),
            transition: Transition.zoom),
        GetPage(
            name: "/testCart",
            page: () => FakeCart(),
            transition: Transition.fadeIn),
      ],
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
    );
  }
}
