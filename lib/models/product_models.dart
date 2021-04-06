import 'package:toko_online/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductModel extends Product {
  ProductModel(
      {@required id,
      @required nama,
      @required description,
      @required harga,
      @required imageUrl})
      : super(
            id: id,
            nama: nama,
            description: description,
            harga: harga,
            imageUrl: imageUrl);
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'],
      nama: json['nama'],
      description: json['description'],
      harga: json['harga'],
      imageUrl: json['image_url']);
}
