import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toko_online/controllers/product_controller.dart';
import 'package:toko_online/models/product_models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());
  ProductController productController = ProductController();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is FetchProduct) {
      List<ProductModel> products = await productController.fetchProduct();
      yield ProductFetched(products: products);
    } else if (event is FailedFetchProduct) {
      yield ProductFetchFailed(message: "Gagal");
    }
  }
}
