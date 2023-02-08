import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/count_controller.dart';
import 'package:get/get.dart';




class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countController = Get.find<CountController>();
    return SafeArea(
      child: Container(
        color: Colors.amber,
        child: Column(
          children: [
            Text(countController.count.toString()),
               ElevatedButton(onPressed: (){
                    countController.increment();
              }, child: Text("increase")),
              ElevatedButton(onPressed: (){
                    Get.back();
              }, child: Text("Go Back ")),
          ],
        ),
      ),
    );
  }
}
