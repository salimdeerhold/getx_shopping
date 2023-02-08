import 'package:flutter_getx/models/Product.dart';
import 'package:get/get.dart';


class ShoppingListController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    dynamic productList = [
      Product(pId: 01, pName: "Mobile", pPrice: 2000),
      Product(pId: 01, pName: "TV", pPrice: 50000),
      Product(pId: 01, pName: "Ear phone", pPrice: 300),
    ];
    products.value= productList;
  }

  addProduct(int id, String name, double price) {
    print("product added");
    products.add(Product(pId: id, pName: name, pPrice: price));
  }

  
}
