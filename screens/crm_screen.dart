import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/customer_card.dart';
import '../models/customer.dart';

class CRMScreen extends StatefulWidget {
  const CRMScreen({super.key});

  @override
  _CRMScreenState createState() => _CRMScreenState();
}

class _CRMScreenState extends State<CRMScreen> {
  final List<Customer> _customers = [
    Customer(
        id: 1,
        name: 'John Doe',
        email: 'john@example.com',
        phone: '123-456-7890',
        address: '123 Main St'),
    Customer(
        id: 2,
        name: 'Jane Smith',
        email: 'jane@example.com',
        phone: '234-567-8901',
        address: '456 Elm St'),
    Customer(
        id: 3,
        name: 'Bob Johnson',
        email: 'bob@example.com',
        phone: '345-678-9012',
        address: '789 Oak St'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Customer Relationship Management'),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _buildCustomerList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewCustomer,
        tooltip: 'Add New Customer',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search customers...',
          prefixIcon: const Icon(Icons.search),
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

  Widget _buildCustomerList() {
    return ListView.builder(
      itemCount: _customers.length,
      itemBuilder: (context, index) {
        return CustomerCard(
          customer: _customers[index],
          onTap: () => _viewCustomerDetails(_customers[index]),
        );
      },
    );
  }

  void _addNewCustomer() {
    // TODO: Implement add new customer functionality
    print('Add new customer');
  }

  void _viewCustomerDetails(Customer customer) {
    // TODO: Implement view customer details functionality
    print('View details for ${customer.name}');
  }
}
