import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool isFavorite;
  const ProductsGrid({
    Key? key,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final loadedProducts =
        isFavorite ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) {
        // print("loaded=> " + loadedProducts[i].title!);
        return ChangeNotifierProvider.value(
          value: loadedProducts[i], //This will be useful if...
          //...we have grid/listview and if we want to use the instance already created as value
          child: const ProductItem(),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
