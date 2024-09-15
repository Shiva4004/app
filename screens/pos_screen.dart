import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/product_card.dart';
import '../widgets/order_summary.dart';
import '../models/product.dart';
import '../models/order.dart';

class POSScreen extends StatefulWidget {
  @override
  _POSScreenState createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
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

  List<OrderItem> _currentOrder = [];

  void _addToOrder(Product product) {
    setState(() {
      var existingItem = _currentOrder.firstWhere(
        (item) => item.product.id == product.id,
        orElse: () =>
            OrderItem(product: product, quantity: 0, price: product.price),
      );

      if (existingItem.quantity == 0) {
        _currentOrder.add(existingItem);
      }

      existingItem.quantity++;
    });
  }

  void _removeFromOrder(OrderItem item) {
    setState(() {
      item.quantity--;
      if (item.quantity == 0) {
        _currentOrder.remove(item);
      }
    });
  }

  void _clearOrder() {
    setState(() {
      _currentOrder.clear();
    });
  }

  void _completeOrder() {
    // TODO: Implement order completion logic
    print('Order completed');
    _clearOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Point of Sale'),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildProductGrid(),
          ),
          Expanded(
            flex: 1,
            child: OrderSummary(
              orderItems: _currentOrder,
              onRemoveItem: _removeFromOrder,
              onClearOrder: _clearOrder,
              onCompleteOrder: _completeOrder,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: _products[index],
          onTap: () => _addToOrder(_products[index]),
        );
      },
    );
  }
}
