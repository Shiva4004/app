import 'package:flutter/foundation.dart';
import '../models/license.dart';
import 'api_service.dart';

class LicenseService with ChangeNotifier {
  License? _currentLicense;

  License? get currentLicense => _currentLicense;

  Future<License> getLicense() async {
    try {
      _currentLicense = await ApiService.getLicense();
      notifyListeners();
      return _currentLicense!;
    } catch (e) {
      print('Error fetching license: $e');
      throw e;
    }
  }

  Future<void> renewLicense() async {
    try {
      _currentLicense = await ApiService.renewLicense();
      notifyListeners();
    } catch (e) {
      print('Error renewing license: $e');
      throw e;
    }
  }

  Future<void> extendLicense() async {
    try {
      _currentLicense = await ApiService.extendLicense();
      notifyListeners();
    } catch (e) {
      print('Error extending license: $e');
      throw e;
    }
  }
}
