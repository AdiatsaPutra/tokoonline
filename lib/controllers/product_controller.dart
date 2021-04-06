import 'package:toko_online/models/product_models.dart';
import 'package:toko_online/repositories/product_repository.dart';
import 'package:toko_online/repositories/product_repository_interface.dart';

class ProductController {
  final IProductRepository productRepository = ProductRepository();

  Future<List<ProductModel>> fetchProduct() {
    return productRepository.getProducts();
  }
}
