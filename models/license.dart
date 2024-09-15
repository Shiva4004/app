class License {
  final int id;
  final String key;
  final DateTime expirationDate;
  final String status;
  final int maxUsers;

  License({
    required this.id,
    required this.key,
    required this.expirationDate,
    required this.status,
    required this.maxUsers,
  });

  factory License.fromJson(Map<String, dynamic> json) {
    return License(
      id: json['id'],
      key: json['key'],
      expirationDate: DateTime.parse(json['expiration_date']),
      status: json['status'],
      maxUsers: json['max_users'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'expiration_date': expirationDate.toIso8601String(),
      'status': status,
      'max_users': maxUsers,
    };
  }

  bool get isValid =>
      status == 'active' && expirationDate.isAfter(DateTime.now());
}
