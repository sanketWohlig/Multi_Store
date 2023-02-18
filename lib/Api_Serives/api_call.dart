import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiCall {
  final url = "https://dev-api.askus.news";

  Future setToken(token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('auth-token', token);
    pref.setBool('isLoggedIn', true);
  }

  Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('auth-token');
    return token ?? '';
  }

  logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  Future<bool> isLogIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final check = pref.getBool('isLoggedIn');
    return check ?? false;
  }

  Future<Map<String, String>> headerWithAuth() async {
    final token = await getToken();
    print('token $token');
    return {
      "Content-Type": "application/json",
      "Authorization":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZWI0ZmMzMWU0ZTdjNTQ0NGQ2M2ZjNSIsImVtYWlsIjoiU2Fua2V0Z2FkYUBnbWFpbC5jb20iLCJpYXQiOjE2NzYzNjU3NjMsImV4cCI6MTY3Njc5Nzc2M30.ymruBipbld19krFlcgeW5fUaoD76D8-5CadYfzZ11ew",
      "Accept": "application/json",
    };
  }

  Map<String, String>? header() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  postWithAuth(String path, Object body) async {
    final header = await headerWithAuth();
    return await http.post(
      Uri.parse(url + path),
      headers: header,
      body: body,
    );
  }

  postWithAuthWithoutBody(String path) async {
    final header = await headerWithAuth();
    return await http.post(
      Uri.parse(url + path),
      headers: header,
    );
  }

  postWithOutAuth(String path, Object body) async {
    return await http.post(
      Uri.parse(url + path),
      headers: header(),
      body: body,
    );
  }

  getWithAuth(String path) async {
    final header = await headerWithAuth();
    return await http.get(
      Uri.parse(url + path),
      headers: header,
    );
  }

  getWithOutAuth(String path) async {
    return await http.get(
      Uri.parse(url + path),
      headers: header(),
    );
  }
}

final apicall = ApiCall();
