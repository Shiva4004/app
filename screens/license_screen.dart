import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/license_service.dart';
import '../models/license.dart';
import '../widgets/custom_app_bar.dart';
import '../constants.dart';

class LicenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'License Information'),
      body: FutureBuilder<License>(
        future:
            Provider.of<LicenseService>(context, listen: false).getLicense(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No license information found.'));
          } else {
            final license = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('License Key: ${license.key}'),
                  SizedBox(height: 16.0),
                  Text('Expiration Date: ${license.expirationDate.toLocal()}'),
                  SizedBox(height: 16.0),
                  Text('Max Users: ${license.maxUsers}'),
                  SizedBox(height: 16.0),
                  Text(
                    'Status: ${license.isValid ? "Valid" : "Expired"}',
                    style: TextStyle(
                      color: license.isValid ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  if (!license.isValid)
                    ElevatedButton(
                      child: Text('Renew License'),
                      onPressed: () => _showRenewLicenseDialog(context),
                    ),
                  if (license.isValid && _isCloseToExpiration(license))
                    ElevatedButton(
                      child: Text('Extend License'),
                      onPressed: () => _showExtendLicenseDialog(context),
                    ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  bool _isCloseToExpiration(License license) {
    final daysUntilExpiration =
        license.expirationDate.difference(DateTime.now()).inDays;
    return daysUntilExpiration <= Constants.LICENSE_EXPIRY_WARNING_DAYS;
  }

  void _showRenewLicenseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Renew License'),
        content: Text('Would you like to renew your license?'),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: Text('Renew'),
            onPressed: () async {
              final licenseService =
                  Provider.of<LicenseService>(context, listen: false);
              await licenseService.renewLicense();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _showExtendLicenseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Extend License'),
        content: Text('Would you like to extend your license?'),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: Text('Extend'),
            onPressed: () async {
              final licenseService =
                  Provider.of<LicenseService>(context, listen: false);
              await licenseService.extendLicense();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
