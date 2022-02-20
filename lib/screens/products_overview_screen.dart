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
    // print("build again");
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (ItemValue value) {
              if (value == ItemValue.favorite && _isFavorite == false) {
                setState(() {
                  _isFavorite = true;
                });
              } else if (value == ItemValue.showAll && _isFavorite == true) {
                setState(() {
                  _isFavorite = false;
                });
              }

              // print(_isFavorite);
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
