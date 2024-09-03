import 'package:shared_preferences/shared_preferences.dart';

//for JSON Web  Token
class JwtProvider {
  static saveJwt(String jwt) async {
    final SharedPreferences prefInstance = await getPref();
    await prefInstance.setString('jwt-user', jwt);
  }

  static getJwt() async {
    final SharedPreferences prefInstance = await getPref();
    // ignore: await_only_futures
    String? jwt = await prefInstance.getString('jwt-user');
    return jwt ?? '';
  }

  static removeJwt() async {
    final SharedPreferences prefInstance = await getPref();
    await prefInstance.setString('jwt-user', '');
  }
}

getPref() {
  return SharedPreferences.getInstance().then((value) => value);
}
