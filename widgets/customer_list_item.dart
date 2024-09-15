import 'package:flutter/material.dart';
import '../models/customer.dart';

class CustomerListItem extends StatelessWidget {
  final Customer customer;

  CustomerListItem({required this.customer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(customer.name),
      subtitle: Text(customer.email),
      trailing: Icon(Icons.chevron_right),
      onTap: () => _showCustomerDetails(context),
    );
  }

  void _showCustomerDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(customer.name),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Email: ${customer.email}'),
            Text('Phone: ${customer.phone}'),
            Text('Address: ${customer.address}'),
          ],
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
