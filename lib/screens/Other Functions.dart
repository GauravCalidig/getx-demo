import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screens/first.dart';

class Others extends StatelessWidget {
  Others({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "Test",
                    "Test Snackbar",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: Text('Show Snackbar'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Test',
                    middleText: 'Test Dialog',
                  );
                },
                child: Text('Show Dialog'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  !Get.isDarkMode
                      ? Get.changeTheme(ThemeData.dark())
                      : Get.changeTheme(ThemeData.light());
                },
                child: Text('Change theme'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print(Get.locale);
                  if (Get.locale == Locale('en', 'US'))
                    Get.updateLocale(Locale('hi', 'IN'));
                  else
                    Get.updateLocale(Locale('en', 'US'));
                },
                child: Text('Change Language'.tr),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => First());
                },
                child: Text('Go Home'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(() => First());
                },
                child: Text('Pop All And push Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
