class Constants {
  static const String appName = 'POS & CRM';
  static const String apiBaseUrl = 'https://api.myposcrm.com';
  static const String currencySymbol = '\$';

  // Database
  static const String dbName = 'my_pos_crm.db';
  static const int dbVersion = 1;

  // Tables
  static const String userTable = 'users';
  static const String productTable = 'products';
  static const String customerTable = 'customers';
  static const String orderTable = 'orders';
  static const String licenseTable = 'licenses';

  // Shared Preferences Keys
  static const String tokenKey = 'auth_token';
  static const String userIdKey = 'user_id';

  // Error Messages
  static const String genericError = 'An error occurred. Please try again.';
  static const String networkError =
      'Network error. Please check your connection.';
  static const String authError = 'Authentication failed. Please log in again.';
}
