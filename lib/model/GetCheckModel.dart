import 'dart:ffi';

class GetCheckModel{
  int? code;
  String? message;
  Data? data;
  bool? success;

  GetCheckModel({this.code, this.message, this.data, this.success});

  GetCheckModel.fromJson(Map<String, dynamic> json) {
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
  int? modelId;
  String? imageUrl;
  String? modelName;
  String? birth;
  String? age;
  String? job;
  String? info;
  String? agency;
  double? aiRate;

  Data(
      {this.modelId,
        this.imageUrl,
        this.modelName,
        this.birth,
        this.age,
        this.job,
        this.info,
        this.agency,
        this.aiRate});

  Data.fromJson(Map<String, dynamic> json) {
    modelId = json['modelId'];
    imageUrl = json['imageUrl'];
    modelName = json['modelName'];
    birth = json['birth'];
    age = json['age'];
    job = json['job'];
    info = json['info'];
    agency = json['agency'];
    aiRate = json['aiRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modelId'] = this.modelId;
    data['imageUrl'] = this.imageUrl;
    data['modelName'] = this.modelName;
    data['birth'] = this.birth;
    data['age'] = this.age;
    data['job'] = this.job;
    data['info'] = this.info;
    data['agency'] = this.agency;
    data['aiRate'] = this.aiRate;
    return data;
  }
}