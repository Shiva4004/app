import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../models/product.dart';

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<Product> _products = [
    Product(
        id: 1,
        name: 'Product 1',
        description: 'Description 1',
        price: 10.99,
        quantity: 100,
        category: 'Category 1',
        barcode: '123456'),
    Product(
        id: 2,
        name: 'Product 2',
        description: 'Description 2',
        price: 15.99,
        quantity: 50,
        category: 'Category 2',
        barcode: '234567'),
    Product(
        id: 3,
        name: 'Product 3',
        description: 'Description 3',
        price: 20.99,
        quantity: 75,
        category: 'Category 1',
        barcode: '345678'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Inventory Management'),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _buildProductList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewProduct,
        child: Icon(Icons.add),
        tooltip: 'Add New Product',
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: (value) {
          // TODO: Implement search functionality
        },
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text(
              '${product.category} - \$${product.price.toStringAsFixed(2)}'),
          trailing: Text('Qty: ${product.quantity}'),
          onTap: () => _viewProductDetails(product),
        );
      },
    );
  }

  void _addNewProduct() {
    // TODO: Implement add new product functionality
    print('Add new product');
  }

  void _viewProductDetails(Product product) {
    // TODO: Implement view product details functionality
    print('View details for ${product.name}');
  }
}
