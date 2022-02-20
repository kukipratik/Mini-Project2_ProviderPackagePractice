import 'package:flutter/material.dart';
import 'package:pod_cast/provider/product.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    // print("\n${product.title}=>${product.isFavorite}");
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, value, child) {
              // print("${value.title}=>${value.isFavorite}");
              return IconButton(
                icon: value.isFavorite
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
                // color: Theme.of(context).colorScheme.secondary,
                color: Colors.red,
                onPressed: () {
                  value.toogleFavorite();
                },
              );
            },
          ),
          title: Text(
            product.title!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
