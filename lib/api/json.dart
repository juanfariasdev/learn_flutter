import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, dynamic>> getItem(String path) async {
  final String response = await rootBundle.loadString(path);
  final data = await json.decode(response);
  return data;
}

Future<List<dynamic>> getItems(String path) async {
  final String response = await rootBundle.loadString(path);
  final data = await json.decode(response);
  return data;
}
