import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/shoping_list_controller.dart';
import 'package:get/get.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  var idTextController = TextEditingController();

  var nameTextController = TextEditingController();

  var priceTextController = TextEditingController();

  final shoppingListController = Get.find<ShoppingListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: Column(
        children: [
          TextField(
            controller: idTextController,
            decoration: const InputDecoration(
              hintText: "Enter id",
            ),
          ),
          TextField(
            controller: nameTextController,
            decoration: const InputDecoration(
              hintText: "Enter name",
            ),
          ),
          TextField(
            controller: priceTextController,
            decoration: const InputDecoration(
              hintText: "Enter price",
            ),
          ),
          ElevatedButton(
              onPressed: () {
                shoppingListController.addProduct(
                  int.parse(idTextController.text.toString()),
                  nameTextController.text.toString(),
                  double.parse(priceTextController.text.toString()),
                );
                Get.snackbar("successfully added","");
              },
              child: const Text("Save")),
               Expanded(
              child: Obx(()=>ListView.builder(
                  itemCount: shoppingListController.products.length,
                  itemBuilder: ((context, index) =>  ListTile(
                          title:  Text(
                                "product ${shoppingListController.products[index].pName}"),
                          
                        )
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
