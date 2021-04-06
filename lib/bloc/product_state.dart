part of 'product_bloc.dart';

abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductFetched extends ProductState {
  final List<ProductModel> products;

  ProductFetched({this.products});
  @override
  List<Object> get props => [products];
}

class ProductFetchFailed extends ProductState {
  final String message;

  ProductFetchFailed({this.message});
  @override
  List<Object> get props => [message];
}
