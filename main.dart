import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'services/auth_service.dart';
import 'services/database_service.dart';
import 'services/license_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authService = AuthService();
  final databaseService = DatabaseService();
  await databaseService.init();
  final licenseService = LicenseService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => authService),
        Provider(create: (_) => databaseService),
        Provider(create: (_) => licenseService),
      ],
      child: MyApp(),
    ),
  );
}
