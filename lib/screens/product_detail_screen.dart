import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product.dart';
import '../provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // getting id with help of route!
    final Product product =
        Provider.of<Products>(context, listen: false).getItemById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title!),
      ),
    );
  }
}
