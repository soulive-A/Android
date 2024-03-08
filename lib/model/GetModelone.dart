class GetModelone {
  int? code;
  String? message;
  Data? data;
  bool? success;

  GetModelone({this.code, this.message, this.data, this.success});

  GetModelone.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int? userId;
  int? productId;
  String? company;
  String? brand;
  List<String>? brandImages;
  String? product;
  String? characteristic;
  List<String>? productImages;
  List<String>? genders;
  List<String>? ages;
  List<String>? ranges;

  Data(
      {this.userId,
        this.productId,
        this.company,
        this.brand,
        this.brandImages,
        this.product,
        this.characteristic,
        this.productImages,
        this.genders,
        this.ages,
        this.ranges});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    productId = json['productId'];
    company = json['company'];
    brand = json['brand'];
    brandImages = json['brandImages'].cast<String>();
    product = json['product'];
    characteristic = json['characteristic'];
    productImages = json['productImages'].cast<String>();
    genders = json['genders'].cast<String>();
    ages = json['ages'].cast<String>();
    ranges = json['ranges'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['productId'] = this.productId;
    data['company'] = this.company;
    data['brand'] = this.brand;
    data['brandImages'] = this.brandImages;
    data['product'] = this.product;
    data['characteristic'] = this.characteristic;
    data['productImages'] = this.productImages;
    data['genders'] = this.genders;
    data['ages'] = this.ages;
    data['ranges'] = this.ranges;
    return data;
  }
}