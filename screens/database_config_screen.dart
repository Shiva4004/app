import 'package:flutter/material.dart';
import 'package:pos_crm_system/models/database_config.dart';
import 'package:pos_crm_system/services/database_service.dart';
import 'package:pos_crm_system/screens/login_screen.dart';

class DatabaseConfigScreen extends StatefulWidget {
  const DatabaseConfigScreen({Key? key}) : super(key: key);

  @override
  DatabaseConfigScreenState createState() => DatabaseConfigScreenState();
}

class DatabaseConfigScreenState extends State<DatabaseConfigScreen> {
  final _formKey = GlobalKey<FormState>();
  String _host = '';
  int _port = 3306;
  String _databaseName = '';
  String _username = '';
  String _password = '';

  void _saveConfig() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      DatabaseConfig config = DatabaseConfig(
        host: _host,
        port: _port,
        databaseName: _databaseName,
        username: _username,
        password: _password,
      );

      bool isConnected = await DatabaseService.testConnection(config);
      if (isConnected) {
        await DatabaseService.saveConfig(config);
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to connect to the database')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Database Configuration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Host'),
                onSaved: (value) => _host = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the host' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Port'),
                keyboardType: TextInputType.number,
                initialValue: '3306',
                onSaved: (value) => _port = int.parse(value!),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the port' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Database Name'),
                onSaved: (value) => _databaseName = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the database name' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
                onSaved: (value) => _username = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the username' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) => _password = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the password' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveConfig,
                child: const Text('Save and Connect'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
