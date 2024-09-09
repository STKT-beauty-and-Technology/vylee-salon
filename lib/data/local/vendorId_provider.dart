import 'package:shared_preferences/shared_preferences.dart';
import 'package:vylee_partner/utilities/string.dart';

//for Vendor Id
class VendorIdProvider {
  static saveVendorId(int vendorId) async {
    final SharedPreferences prefInstance = await getPref();
    await prefInstance.setInt(Constant.vendorId, vendorId);
  }

  static getVendorId() async {
    final SharedPreferences prefInstance = await getPref();
    // ignore: await_only_futures
    int? vendorId = await prefInstance.getInt(Constant.vendorId);
    return vendorId ?? '';
  }

  static removeVendorId() async {
    final SharedPreferences prefInstance = await getPref();
    await prefInstance.remove(Constant.vendorId);
  }
}

getPref() {
  return SharedPreferences.getInstance().then((value) => value);
}
