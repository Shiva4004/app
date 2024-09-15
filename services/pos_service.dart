import 'package:pos_crm_system/models/product.dart';
import 'package:pos_crm_system/services/database_service.dart';

class POSService {
  static Future<List<Product>> getProducts() async {
    final conn = await DatabaseService.getConnection();
    final results = await conn.query('SELECT * FROM products');
    await conn.close();

    return results.map((row) => Product.fromJson(row.fields)).toList();
  }

  // Add more POS-related methods here, such as:
  // - addProduct
  // - updateProduct
  // - deleteProduct
  // - processTransaction
}
