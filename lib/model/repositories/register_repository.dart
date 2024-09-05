import 'package:vylee_partner/data/remote/remote_data_provider.dart';

class RegisterRepository {
  Future<bool> registerVendor(
      {required String fullName,
      required String salonName,
      required int phoneNumber,
      String email = ""}) async {
    final response = await DataProvider.postData("new/registration", {
      "fullName": fullName,
      "salonName": salonName,
      "vendorEmail": email,
      "mobileNumber": phoneNumber,
    });

    print("Registration status code: ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    print(response.body);
    return false;
  }
}
