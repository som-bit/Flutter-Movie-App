import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.Url);
  final String Url;

  Future loadCurrentMovies() async {
    http.Response response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      print('Working Perfectly');
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
