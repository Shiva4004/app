import 'package:flutter/material.dart';
import '../models/order.dart';
import 'package:intl/intl.dart';

class OrderListItem extends StatelessWidget {
  final Order order;

  OrderListItem({required this.order});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Order #${order.id}'),
      subtitle:
          Text('${DateFormat.yMd().format(order.orderDate)} - ${order.status}'),
      trailing: Text('\$${order.total.toStringAsFixed(2)}'),
      onTap: () => _showOrderDetails(context),
    );
  }

  void _showOrderDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Order #${order.id}'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Customer: ${order.customer.name}'),
              Text('Date: ${DateFormat.yMd().format(order.orderDate)}'),
              Text('Status: ${order.status}'),
              Divider(),
              ...order.items.map((item) => ListTile(
                    title: Text(item.product.name),
                    subtitle: Text('Quantity: ${item.quantity}'),
                    trailing: Text(
                        '\$${(item.product.price * item.quantity).toStringAsFixed(2)}'),
                  )),
              Divider(),
              Text('Total: \$${order.total.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
