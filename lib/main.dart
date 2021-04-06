import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:toko_online/bloc/product_bloc.dart';
import 'package:toko_online/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ProductBloc()..add(FetchProduct()),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
