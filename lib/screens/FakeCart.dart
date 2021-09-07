import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FakeCart extends StatefulWidget {
  const FakeCart({Key? key}) : super(key: key);

  @override
  _FakeCartState createState() => _FakeCartState();
}

class _FakeCartState extends State<FakeCart> {
  List items = [];
  @override
  void initState() {
    super.initState();
    if (Get.parameters["count"] != null) {
      for (var i = 0; i < int.parse(Get.parameters["count"] ?? "0"); i++) {
        items.add("Product $i");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Items are ${items.length}"),
      ),
      body: Container(
          child: items.length == 0
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Cart Is empty"),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Please Change the item count in url")
                  ],
                ))
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = items[index];

                    return ListTile(
                        leading: Icon(Icons.shopping_bag),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                items.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete)),
                        title: Text(item));
                  })),
    );
  }
}
