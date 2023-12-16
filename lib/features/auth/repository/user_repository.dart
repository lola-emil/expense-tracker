import "package:dio/dio.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";

final Dio dio = Dio();
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future<void> signIn(String username, String password) async {
  Response response = await dio.post("http://localhost:5000/auth/login",
      data: {"username": username, "password": password});

  String token = response.data["data"]["token"];
  String userId = response.data["data"]["user_id"];

  await secureStorage.write(key: "USER_ID", value: userId);
  await secureStorage.write(key: "TOKEN", value: token);
}

Future<bool> isLoggedIn() async {
  String? token = await secureStorage.read(key: "TOKEN");
  String? userId = await secureStorage.read(key: "USER_ID");

  if (token != null && userId != null) {
    return true;
  }

  return false;
}


Future<void> logOut() async {
  await secureStorage.delete(key: "TOKEN");
  await secureStorage.delete(key: "USER_ID");
}