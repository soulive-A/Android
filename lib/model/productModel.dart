//광고 상품 관련 모델
import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final String company;
  final String brand;
  final List<String> brandImage;
  final String product;
  final String characteristic;
  final List<String> productImage;
  final List<String> gender;
  final List<String> age;
  final List<String> range;

  ProductModel({
    required this.company,
    required this.brand,
    required this.brandImage,
    required this.product,
    required this.characteristic,
    required this.productImage,
    required this.gender,
    required this.age,
    required this.range,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    company: json["company"],
    brand: json["brand"],
    brandImage: List<String>.from(json["brandImage"].map((x) => x)),
    product: json["product"],
    characteristic: json["characteristic"],
    productImage: List<String>.from(json["productImage"].map((x) => x)),
    gender: List<String>.from(json["gender"].map((x) => x)),
    age: List<String>.from(json["age"].map((x) => x)),
    range: List<String>.from(json["range"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "company": company,
    "brand": brand,
    "brandImage": List<dynamic>.from(brandImage.map((x) => x)),
    "product": product,
    "characteristic": characteristic,
    "productImage": List<dynamic>.from(productImage.map((x) => x)),
    "gender": List<dynamic>.from(gender.map((x) => x)),
    "age": List<dynamic>.from(age.map((x) => x)),
    "range": List<dynamic>.from(range.map((x) => x)),
  };
}
