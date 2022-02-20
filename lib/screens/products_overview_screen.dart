import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum ItemValue {
  favorite,
  showAll,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (ItemValue value) {
              if (value == ItemValue.favorite) {
                setState(() {
                  _isFavorite = true;
                });
              } else {
                setState(() {
                  _isFavorite = false;
                });
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                child: Text('Favorites.'),
                value: ItemValue.favorite,
              ),
              PopupMenuItem(
                child: Text('Show All.'),
                value: ItemValue.showAll,
              )
            ],
          )
        ],
      ),
      body: ProductsGrid(isFavorite: _isFavorite),
    );
  }
}
