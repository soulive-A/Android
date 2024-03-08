import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soulive/model/GetModelone.dart';
import 'package:http/http.dart' as http;

class RecommendModel with ChangeNotifier{
  final baseUrl = dotenv.env['BASE_URL'];
  GetModelone? _modelone;
  GetModelone? get modelone => _modelone;

  Future<void> fetchRecommendModel(int productId) async{
    final url = Uri.parse('$baseUrl/api/product/${productId}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _modelone = GetModelone.fromJson(jsonResponse);
      notifyListeners();
    }
  }

}