import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/pos_screen.dart';
import 'screens/crm_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/settings_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => LoginScreen(),
  '/dashboard': (context) => DashboardScreen(),
  '/pos': (context) => POSScreen(),
  '/crm': (context) => CRMScreen(),
  '/inventory': (context) => InventoryScreen(),
  '/reports': (context) => ReportsScreen(),
  '/settings': (context) => SettingsScreen(),
};
