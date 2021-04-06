part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {}

class FetchProduct extends ProductEvent {
  @override
  List<Object> get props => [];
}

class FailedFetchProduct extends ProductEvent {
  @override
  List<Object> get props => [];
}
