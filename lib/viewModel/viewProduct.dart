import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:soulive/model/productModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soulive/model/productModel.dart';

class productApi{
  final baseUrl = dotenv.env['BASE_URL'];

  //모든 광고 상품 조회
  ProductModel? _getAllProduct;
  ProductModel? get modelIntroduce => _getAllProduct;



  //모든 광고 상품 조회
  Future<List<ProductModel>?> getProduct() async {
    final url = Uri.parse('$baseUrl/api/product');
    try {
      List<ProductModel> allProduct = [];
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print('성공');
        final parsedProducts = jsonDecode(response.body);
        for (var product in parsedProducts) {
          final instance = ProductModel.fromJson(product);
        }
        return allProduct;
      }

    } catch (e) {
      print('Get 요청 실패 - $e');
      return null;
    }
  }

  //광고 상품 생성
  Future<http.Response> postProduct(ProductModel product) async {
    final url = Uri.parse('$baseUrl/api/product');

    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(product.toJson()));
      if (response.statusCode == 200) {
        print('성공');
      }

      return response;
    } catch (e) {
      print('Post 요청 실패 - $e');
      return http.Response('Error: $e', 500);
    }
  }
//특정 광고 상품 조회
}
