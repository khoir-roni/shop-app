import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
            ),
          ],
        ),
      ),
    );
  }
}
