import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soulive/model/GetModelone.dart';
import 'package:http/http.dart' as http;

import '../model/GetModelList.dart';
import '../model/GetModelrecent.dart';

class RecommendViewModel with ChangeNotifier{
  final baseUrl = dotenv.env['BASE_URL'];

  GetModelone? _modelone;
  GetModelone? get modelone => _modelone;

  //추천 모델
  GetAllModel? _allModel;
  GetAllModel? get allModel => _allModel;

  //최근 조회 모델
  GetModelrecent? _modelrecent;
  GetModelrecent? get modelrecent => _modelrecent;

  Future<void> fetchRecommendModel(int productId) async{
    final url = Uri.parse('$baseUrl/api/product/${productId}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _modelone = GetModelone.fromJson(jsonResponse);
      notifyListeners();
    }
  }

  Future<void> fetchAllModel() async{
    final url = Uri.parse('$baseUrl/api/model/recommendation');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _allModel = GetAllModel.fromJson(jsonResponse);
      notifyListeners();
    }
  }

  //최근 조회 모델
  Future<void> fetchRecentModel(int modelId) async{
    final url = Uri.parse('$baseUrl/api/model/recent/${modelId}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _modelrecent = GetModelrecent.fromJson(jsonResponse);
      notifyListeners();
    }
  }

}