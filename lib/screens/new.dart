import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx/controllers/sumController.dart';

class NewPage extends StatelessWidget {
  NewPage({Key? key}) : super(key: key);

  final NewController newController = Get.put(NewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.parameters.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
                //Obx is very similar to GetX except 'lighter' so no parameters for init, dispose, etc
                () => ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Get.find<NewController>().list.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = Get.find<NewController>().list[index];
                      return ListTile(
                          leading: Icon(Icons.shopping_bag), title: Text(item));
                    })),
            Container(
              child: Obx(
                //Obx is very similar to GetX except 'lighter' so no parameters for init, dispose, etc
                () => Text('Tap Count: ${Get.find<NewController>().count}'),
              ),
            ),
            Text("debouncing count every 1 second")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.find<NewController>()
              .increment("count is ${Get.find<NewController>().count}");
        },
        icon: Icon(Icons.add),
        label: Text('Add To Cart'),
      ),
    );
  }
}
