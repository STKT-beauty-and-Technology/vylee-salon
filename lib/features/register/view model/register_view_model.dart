import 'package:vylee_partner/model/repositories/register_repository.dart';

mixin RegisterViewModel {
  final registerRepository = RegisterRepository();
  Future<bool> registerVendor(
      {required String fullName,
      required String salonName,
      required int phoneNumber,
      String email = ""}) async {
    try {
      final isSuccess = await registerRepository.registerVendor(
          fullName: fullName, salonName: salonName, phoneNumber: phoneNumber);
      return isSuccess;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
