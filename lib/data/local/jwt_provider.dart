import 'package:shared_preferences/shared_preferences.dart';
import 'package:vylee_partner/utilities/string.dart';

//for JSON Web  Token
class JwtProvider {
  static saveJwt(String jwt) async {
    final SharedPreferences prefInstance = await getPref();
    await prefInstance.setString(Constant.tokenName, jwt);
  }

  static getJwt() async {
    final SharedPreferences prefInstance = await getPref();
    // ignore: await_only_futures
    String? jwt = await prefInstance.getString(Constant.tokenName);
    return jwt ?? '';
  }

  static removeJwt() async {
    final SharedPreferences prefInstance = await getPref();
    await prefInstance.setString(Constant.tokenName, '');
  }
}

getPref() {
  return SharedPreferences.getInstance().then((value) => value);
}
