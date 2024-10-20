import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<Map<String, dynamic>> loadJson() async {
  // Load the JSON file from the assets
  String jsonString = await rootBundle.loadString('assets/langage/fr.json');

  // Decode the JSON data
  Map<String, dynamic> jsonData = jsonDecode(jsonString);

  return jsonData;
}