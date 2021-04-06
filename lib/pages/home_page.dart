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
        child: Column(
          children: [
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductFetched) {
                        List<ProductModel> products = state.products;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            print(products[index].imageUrl);
                            return Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 12,
                                    offset: Offset(4, 4),
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              products[index].imageUrl),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Text(
                                    products[index].nama,
                                  ),
                                  Text(
                                    products[index].harga.toString(),
                                  ),
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
                ],
              ),
            ),
          ],
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
