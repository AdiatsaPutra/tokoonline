import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final int id;
  final String nama;
  final String description;
  final int harga;
  final String imageUrl;

  Product(
      {@required this.id,
      @required this.nama,
      @required this.description,
      @required this.harga,
      @required this.imageUrl});

  @override
  List<Object> get props => [
        nama,
        description,
        harga,
        imageUrl,
      ];
}
