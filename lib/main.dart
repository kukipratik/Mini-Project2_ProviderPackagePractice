import 'package:flutter/material.dart';
import 'package:pod_cast/provider/products.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primarySwatch: Colors.purple,
      fontFamily: 'Lato',
    );
    return ChangeNotifierProvider(
      //This method will be useful if we want to create the instance ourselves with provider...
      //unlike ChangeNotifierProvider.value...
      create: (context) => Products(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: theme.copyWith(
            colorScheme: theme.colorScheme
                .copyWith(secondary: const Color.fromARGB(255, 235, 20, 5)),
          ),
          home: const ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          }),
    );
  }
}
