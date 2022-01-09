import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './edit_product_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import '../providers/products.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  Future<void> _refreshProduct(BuildContext context) async {
   await Provider.of<Products>(context, listen: false).fetchAndSetProduct();
  }

  @override
  Widget build(BuildContext context) {
    final productSData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product!'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProduct(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productSData.items.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                  id: productSData.items[i].id,
                  title: productSData.items[i].title,
                  imageUrl: productSData.items[i].imageUrl,
                ),
                const Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
