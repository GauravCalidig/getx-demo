import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../api.dart';

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  _ApiCallState createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  String lat = "30.704649";
  String long = "76.717873";
  String address = "";
  bool loading = false;

  @override
  void initState() {
    super.initState();
    if (Get.parameters["lat"] != null && Get.parameters["long"] != null) {
      setState(() {
        lat = Get.parameters["lat"] ?? "30.704649";
        long = Get.parameters["long"] ?? "30.704649";
      });
      getAddress(Get.parameters["lat"] ?? "30.704649",
          Get.parameters["long"] ?? "30.704649");
    }
  }

  getAddress(lat, long) async {
    setState(() {
      loading = true;
    });
    try {
      var resp = await ApiProvider().getAddress(lat, long);
      print(resp.body);
      print(resp.hasError);

      if (resp.body["address"] != null) {
        setState(() {
          address = resp.body["display_name"];
        });
      } else {
        Get.snackbar("Error", resp.body["error"].toString());
        address = "";
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Address"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: lat,
              decoration: InputDecoration(labelText: "Enter latitude"),
              onChanged: (e) {
                setState(() {
                  lat = e;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter longitude"),
              initialValue: long,
              onChanged: (e) {
                setState(() {
                  long = e;
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            Text(address),
            SizedBox(
              height: 40,
            ),
            loading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      getAddress(lat, long);
                    },
                    child: Text("Check Address")),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
