import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/count_controller.dart';
import 'package:flutter_getx/controller/shoping_list_controller.dart';
import 'package:flutter_getx/screens/add_product_page.dart';
import 'package:flutter_getx/screens/cart_page.dart';
import 'package:get/get.dart';

class ShoppingListPage extends StatelessWidget {
  ShoppingListPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingListController());
  final countController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        actions: [
          InkWell(
            child: const Padding(
                padding: EdgeInsets.all(4), child: Icon(Icons.add)),
            onTap: () => Get.to(AddProductPage()),
          ),
          InkWell(
            child: const Padding(
                padding: EdgeInsets.all(4), child: Icon(Icons.shopping_cart)),
            onTap: () => Get.to(const CartPage()),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text("Count Value ${countController.count}"),
            ),
            ElevatedButton(
                onPressed: () {
                  countController.increment();
                },
                child: const Text("Increment")),
            Expanded(
              child: ListView.builder(
                itemCount: shoppingController.products.length,
                itemBuilder: ((context, index) =>  ListTile(
                        title:  Text(
                              "product ${shoppingController.products[index].pName}"),
                        
                      )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





/*

Expanded(
          child: ListView.builder(
                itemCount: 5,
                itemBuilder: ((context, index) => ListTile(title: Text("product ${index}"),
                )))
        ),


*/