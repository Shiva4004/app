import 'dart:convert';

class DatabaseConfig {
  final String server;
  final String database;
  // We don't need username and password for Windows Authentication

  DatabaseConfig({
    required this.server,
    required this.database,
  });

  Map<String, dynamic> toJson() => {
        'server': server,
        'database': database,
      };

  factory DatabaseConfig.fromJson(Map<String, dynamic> json) => DatabaseConfig(
        server: json['server'],
        database: json['database'],
      );

  String toString() {
    return 'DatabaseConfig(server: $server, database: $database)';
  }
}
