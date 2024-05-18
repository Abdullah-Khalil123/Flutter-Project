import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUri = 'http://192.168.18.24/api/';

  static addSignUp(Map SignUp_data) async {
    var url = Uri.parse(baseUri + 'addSignUp');

    try {
      final res = await http.post(url, body: SignUp_data);

      if (res.statusCode == 200) {
        debugPrint('Successfull');
        var data = jsonDecode(res.body.toString());
        print(data);
        return true;
      } else {
        debugPrint('Failed!!');
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Login(Map LoginData) async {
    var url = Uri.parse(baseUri + 'login');

    try {
      final res = await http.post(url, body: LoginData);

      if (res.statusCode == 200) {
        debugPrint('Successfull');
        var data = jsonDecode(res.body.toString());
        print(data);
        return true;
      } else {
        debugPrint('Failed!!');
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
