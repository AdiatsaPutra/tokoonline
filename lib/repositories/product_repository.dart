import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toko_online/models/product_models.dart';
import 'package:toko_online/repositories/product_repository_interface.dart';

class ProductRepository implements IProductRepository {
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      var response =
          await http.get(Uri.parse('http://10.0.2.2:8000/api/products'));
      var json = jsonDecode(response.body);
      List result = json['data'];
      return result.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }
  }
}
