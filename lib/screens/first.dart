import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/controllers/countController.dart';
import 'package:getx/controllers/sumController.dart';
import 'package:getx/controllers/userController.dart';
import 'package:getx/screens/new.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  final datacount = GetStorage();
  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    var x = await datacount.read("cart");
    print(datacount.read("cart"));
    print(x.runtimeType);
    Get.find<NewController>().list.addAll(x);
  }

  final CountController countController = Get.put(CountController());

  final UserController userController = Get.put(UserController());

  final NewController newController = Get.put(NewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
        centerTitle: true,
        actions: [
          Obx(() => new Stack(
                children: <Widget>[
                  new IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Get.toNamed(
                            "/cart?count=${Get.find<NewController>().list.length}");
                      }),
                  new Positioned(
                    right: 11,
                    top: 11,
                    child: new Container(
                      padding: EdgeInsets.all(2),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        Get.find<NewController>().list.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountController>(
              // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
              // GetX/Obx is reactive (streams) while GetBuilder only rebuilds on update()
              builder: (s) => Text(
                'Current Count Value: ${s.count}',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GetX<UserController>(
              init:
                  UserController(), // can initialize inside GetX instead of .put
              builder: (_) => Text('Name: ${_.user.value.name}'),
            ),
            Obx(
              //Obx is very similar to GetX except 'lighter' so no parameters for init, dispose, etc
              () => Text(
                  'Stored Count: ${Get.find<UserController>().user.value.count}'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Update Name & Stored Count"),
              onPressed: () {
                getData();
                Get.find<UserController>().updateUser(Get.find<
                        CountController>()
                    .count); //using Get.find locates the controller that was created in 'init' in GetX
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Next Screen'),
              onPressed: () {
                Get.toNamed("/second");
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Named route with parameters'),
              onPressed: () {
                Get.toNamed(
                    "/new?name=${Get.find<UserController>().user().name}&count=${Get.find<CountController>().count}");
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Other Functions'),
              onPressed: () {
                Get.toNamed("/other");
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('testing State Management'),
              onPressed: () {
                Get.to(() => NewPage());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.find<CountController>().increment();
          }),
    );
  }
}
