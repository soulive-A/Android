class GetModelFitness {
  int? code;
  String? message;
  Data? data;
  bool? success;

  GetModelFitness({this.code, this.message, this.data, this.success});

  GetModelFitness.fromJson(Map<String, dynamic> json) {
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
  String? scoreUrl;
  String? aiComment;
  List<String>? modelImageKeywordList;
  List<String>? brandImageKeywordList;
  List<String>? productImageKeywordList;

  Data(
      {this.scoreUrl,
        this.aiComment,
        this.modelImageKeywordList,
        this.brandImageKeywordList,
        this.productImageKeywordList});

  Data.fromJson(Map<String, dynamic> json) {
    scoreUrl = json['scoreUrl'];
    aiComment = json['aiComment'];
    modelImageKeywordList = json['modelImageKeywordList'].cast<String>();
    brandImageKeywordList = json['brandImageKeywordList'].cast<String>();
    productImageKeywordList = json['productImageKeywordList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scoreUrl'] = this.scoreUrl;
    data['aiComment'] = this.aiComment;
    data['modelImageKeywordList'] = this.modelImageKeywordList;
    data['brandImageKeywordList'] = this.brandImageKeywordList;
    data['productImageKeywordList'] = this.productImageKeywordList;
    return data;
  }
}