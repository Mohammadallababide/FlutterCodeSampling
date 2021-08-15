import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:p2_mobile/models/User.dart';

class ServerApi {
  ServerApi._() {
    getLocalToken();
  }
  late String language;
  static late String accessToken;
  static final ServerApi apiClient = ServerApi._();
  static final http.Client _httpClient = http.Client();

  static const BaseUrl = "https://symphonia-app.herokuapp.com";
  Map<String, String> getHeaders() {
    return {
      "Authorization": accessToken,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<void> getLocalToken() async {
    // accessToken = await SharedPref.pref.getToken();
    // todo add a valied token to accessToken until sharedPref be ready to store the token and gave it
    accessToken = '';
    language = "ar";
    print(accessToken);
  }

  //Auth
  Future<User?> singIn(
      {required String email, required String password}) async {
    Map<String, String> body = Map<String, String>();
    body = {'email': email, 'password': password};
    try {
      final uri = Uri.parse(BaseUrl + '/auth/login');
      final bodReq = jsonEncode(body);
      final response = await _httpClient.post(
        uri,
        body: bodReq,
        headers: getHeaders(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = jsonDecode(response.body);
        return User.fromJson(json['data']['user']);
      }
    } on SocketException {
      //this in case internet problems
      return Future.error("check your internet connection");
    } on http.ClientException {
      //this in case internet problems
      return Future.error("check your internet connection");
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }

  Future<User?> singUp({
    required String email,
    required String password,
    required String address,
    required String phone,
    required String name,
    required String imageUrl,
  }) async {
    Map<String, String> body = Map<String, String>();
    body = {
      'email': email,
      'password': password,
      'address': address,
      'phone': phone,
      'imageUrl': imageUrl,
      'name': name,
    };
    try {
      final uri = Uri.parse(BaseUrl + '/auth/signup');
      final bodReq = jsonEncode(body);
      final response = await _httpClient.post(
        uri,
        body: bodReq,
        headers: getHeaders(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = jsonDecode(response.body);
        return User.fromJson(json['data']['user']);
      }
    } on SocketException {
      //this in case internet problems
      return Future.error("check your internet connection");
    } on http.ClientException {
      //this in case internet problems
      return Future.error("check your internet connection");
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
