import 'package:pos_crm_system/models/customer.dart';
import 'package:pos_crm_system/services/database_service.dart';

class CRMService {
  static Future<List<Customer>> getCustomers() async {
    final conn = await DatabaseService.getConnection();
    final results = await conn.query('SELECT * FROM customers');
    await conn.close();

    return results.map((row) => Customer.fromJson(row.fields)).toList();
  }

  // Add more CRM-related methods here
}
