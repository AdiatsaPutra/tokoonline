import 'package:toko_online/models/product_models.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getProducts();
}
