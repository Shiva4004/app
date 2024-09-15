import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/user.dart';
import '../models/customer.dart';
import '../models/product.dart';
import '../models/order.dart';
import '../models/license.dart';

class ApiService {
  static final String baseUrl =
      dotenv.env['API_BASE_URL'] ?? 'http://localhost:3000';

  static Future<User> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<User> getUserById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get user');
    }
  }

  static Future<List<Customer>> getCustomers() async {
    final response = await http.get(Uri.parse('$baseUrl/customers'));

    if (response.statusCode == 200) {
      List<dynamic> customersJson = jsonDecode(response.body);
      return customersJson.map((json) => Customer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get customers');
    }
  }

  static Future<void> addCustomer(Customer customer) async {
    final response = await http.post(
      Uri.parse('$baseUrl/customers'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(customer.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add customer');
    }
  }

  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body);
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get products');
    }
  }

  static Future<void> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add product');
    }
  }

  static Future<List<Order>> getOrders() async {
    final response = await http.get(Uri.parse('$baseUrl/orders'));

    if (response.statusCode == 200) {
      List<dynamic> ordersJson = jsonDecode(response.body);
      return ordersJson.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get orders');
    }
  }

  static Future<void> addOrder(Order order) async {
    final response = await http.post(
      Uri.parse('$baseUrl/orders'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(order.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add order');
    }
  }

  static Future<License> getLicense() async {
    final response = await http.get(Uri.parse('$baseUrl/license'));

    if (response.statusCode == 200) {
      return License.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get license');
    }
  }

  static Future<License> renewLicense() async {
    final response = await http.post(Uri.parse('$baseUrl/license/renew'));

    if (response.statusCode == 200) {
      return License.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to renew license');
    }
  }

  static Future<License> extendLicense() async {
    final response = await http.post(Uri.parse('$baseUrl/license/extend'));

    if (response.statusCode == 200) {
      return License.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to extend license');
    }
  }
}
