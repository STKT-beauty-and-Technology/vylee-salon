import 'dart:io';

import 'package:logger/logger.dart';
import 'package:vylee_partner/data/local/vendorId_provider.dart';
import 'package:vylee_partner/data/network/api_routes.dart';
import 'package:vylee_partner/data/network/api_service.dart';

class ProfileRepository {
  final ApiService apiService = ApiService();
  final logger = Logger();

  Future<File?> getLogoImage() async {
    final vendorId = VendorIdProvider.getVendorId();

    final res = await ApiService()
        .sendRequest
        .get(ApiService.currentUrl + ApiRoutes.getLogo(vendorId));

    return null;
  }
}
