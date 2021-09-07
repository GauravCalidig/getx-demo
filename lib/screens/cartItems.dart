import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/sumController.dart';

class CartItems extends StatelessWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items ${Get.parameters["count"]}'),
      ),
      body: Container(
        child: GetX<NewController>(
            init: NewController(),
            builder: (data) => ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.list.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = data.list[index];
                  return ListTile(
                      leading: Icon(Icons.shopping_bag), title: item);
                })),
      ),
    );
  }
}
