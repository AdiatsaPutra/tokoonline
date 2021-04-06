import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toko_online/bloc/product_bloc.dart';
import 'package:toko_online/controllers/product_controller.dart';
import 'package:toko_online/models/product_models.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = ProductController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductFetched) {
              List<ProductModel> products = state.products;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width / 2,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(products[index].imageUrl),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Text(
                                products[index].nama,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                products[index].harga.toString(),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (state is ProductFetchFailed) {
              return Text(state.message);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final ProductModel product;

  const ProductDetail({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: (product.imageUrl == null)
                      ? NetworkImage(
                          'https://www.acacia-wood.com/themes/jtherczeg-multi//assets/images/acacia/empty-img.png')
                      : NetworkImage(product.imageUrl),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              children: [
                Text(product.nama),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                ),
                Text(product.harga.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
