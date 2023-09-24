import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//import 'package:rest_api_app/Constants/url.dart';
import 'package:http/http.dart' as http;

import '../secreens/home_page.dart';
import '../utils/routes.dart';

//import 'package:rest_api_app/Provider/Database/db_provider.dart';
//import 'package:rest_api_app/Screens/Authentication/login.dart';
//import 'package:rest_api_app/Screens/TaskPage/home_page.dart';
//import 'package:rest_api_app/Utils/routers.dart';

class AuthenticationProvider extends ChangeNotifier {
  ///Base Url
  final requestBaseUrl = "https://weburl.com:3000/";

  ///Setter
  bool _isLoading = false;
  String _resMessage = '';

  //Getter
  bool get isLoading => _isLoading;

  String get resMessage => _resMessage;

  //Login
  void loginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = "$requestBaseUrl/token";

    final body = {"email": email, "password": password};
    print(body);

    try {
      http.Response req = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(body));

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);

        print(res);
        _isLoading = false;
        _resMessage = "Login successfull!";
        PageNavigator(ctx: context).nextPageOnly(page: const HomePage());
        final token = res['access'];
        print(token);
        notifyListeners();
      } else {
        final res = json.decode(req.body);

        _resMessage = res['message'];

        print(res);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available`";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      // _resMessage = "Please try again`";
      notifyListeners();

      print(":::: $e");
    }
  }

  void clear() {
    _resMessage = "";
    // _isLoading = false;
    notifyListeners();
  }
}
