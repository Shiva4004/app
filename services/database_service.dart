import 'package:flutter/foundation.dart';
import '../models/customer.dart';
import '../models/product.dart';
import '../models/order.dart';
import 'api_service.dart';

class DatabaseService with ChangeNotifier {
  Future<List<Customer>> getCustomers() async {
    try {
      return await ApiService.getCustomers();
    } catch (e) {
      print('Error fetching customers: $e');
      return [];
    }
  }

  Future<void> addCustomer(Customer customer) async {
    try {
      await ApiService.addCustomer(customer);
      notifyListeners();
    } catch (e) {
      print('Error adding customer: $e');
    }
  }

  Future<List<Product>> getProducts() async {
    try {
      return await ApiService.getProducts();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      await ApiService.addProduct(product);
      notifyListeners();
    } catch (e) {
      print('Error adding product: $e');
    }
  }

  Future<List<Order>> getOrders() async {
    try {
      return await ApiService.getOrders();
    } catch (e) {
      print('Error fetching orders: $e');
      return [];
    }
  }

  Future<void> addOrder(Order order) async {
    try {
      await ApiService.addOrder(order);
      notifyListeners();
    } catch (e) {
      print('Error adding order: $e');
    }
  }
}
