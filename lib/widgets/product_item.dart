import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem({
  //   this.id,
  //   this.title,
  //   this.imageUrl,
  // });
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    print('product rebuild ');
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        header: Text('\$'),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, product, _) => IconButton(
              color: Theme.of(context).accentColor,
              onPressed: () => product.toggleFavoriteStatus(),
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).accentColor,
              ),
            ),
            child: Text('Never Change!'),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            onPressed: null,
          ),
        ),
      ),
    );
  }
}
