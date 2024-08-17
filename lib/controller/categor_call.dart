

import 'dart:convert';


import 'package:product_show/database/category_list.dart';
import 'package:product_show/model/product_model.dart';

class ProductListService {
  static Future<List<Products>> productListService() async {
    try {
      AllProductModel allProductModel = AllProductModel.fromJson(
        jsonDecode(
          jsonEncode(ProductList.productList),
        ),
      );
      print(allProductModel);
      return allProductModel.products ?? [];
    } catch (e) {
      e.toString();
    }
    return [];
  }
}
