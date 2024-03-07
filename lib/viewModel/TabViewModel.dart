//모델분석 결과를 위한 viewmodel

import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:soulive/model/GetCheckModel.dart';

import '../model/GetModelIntroduce.dart';
import '../model/GetModelPopular.dart';

class TabViewModel with ChangeNotifier{
  final baseUrl = dotenv.env['BASE_URL'];

  int _selectedTab = 0;
  int get selectedTab => _selectedTab;

  GetCheckModel? _currentModel;
  GetCheckModel? get currentModel => _currentModel;

  //모델소개
  GetModelIntroduce? _modelIntroduce;
  GetModelIntroduce? get modelIntroduce => _modelIntroduce;

  //모델화제성
  GetModelPopular? _modelPopular;
  GetModelPopular? get modelPopular => _modelPopular;


  void selectTab(int index){
    _selectedTab = index;
    notifyListeners();
  }

  Future<void> fetchCheckModel(String modelName, int productId) async{
    final url = Uri.parse('$baseUrl/api/model').replace(queryParameters: {
      'modelName': modelName,
      'productId' : productId.toString()
    });
    print('urlurl: ${url}');
    final response = await http.get(url);
    print('urlurl: ${url}dd');
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      _currentModel = GetCheckModel.fromJson(jsonResponse);
      notifyListeners();
      print('apisuccess: ${response.body}');
    }else{
      print('API unSuccess: ${response.body}');
    }
  }

  Future<void> fetchModelIntroduce(String modelName) async{
    final url = Uri.parse('$baseUrl/api/model/introduction?modelName=$modelName');
    final response = await http.get(url);
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      _modelIntroduce = GetModelIntroduce.fromJson(jsonResponse);
      notifyListeners();
    }else{
      print('API introduce: ${response.body}');
    }
  }

  Future<void> fetchModelPopular(String modelName) async{
    final url = Uri.parse('$baseUrl/api/model/popularity?name=$modelName');
    final response = await http.get(url);
    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);
      _modelPopular = GetModelPopular.fromJson(jsonResponse);
      notifyListeners();
    }else{
      print('API introduce: ${response.body}');
    }
  }

}