import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/sumController.dart';

class CartItems extends StatelessWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<NewController>(
            init: NewController(),
            builder: (data) => Text('Cart Items ${data.list.length}')),
      ),
      body: Container(
        child: GetX<NewController>(
            init: NewController(),
            builder: (data) => data.list.length == 0
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Cart Is empty"),
                      ElevatedButton(
                          onPressed: () {
                            Get.toNamed("/new");
                          },
                          child: Text("Add Items"))
                    ],
                  ))
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = data.list[index];

                      return ListTile(
                          leading: Icon(Icons.shopping_bag),
                          trailing: IconButton(
                              onPressed: () {
                                Get.find<NewController>().list.removeAt(index);
                                datacount.write(
                                    "cart", Get.find<NewController>().list);
                                print(datacount.read("cart"));
                              },
                              icon: Icon(Icons.delete)),
                          title: Text(item));
                    })),
      ),
    );
  }
}
