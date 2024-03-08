class GetModelNegative {
  int? code;
  String? message;
  Data? data;
  bool? success;

  GetModelNegative({this.code, this.message, this.data, this.success});

  GetModelNegative.fromJson(Map<String, dynamic> json) {
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
  int? crime;
  List<ModelNewsResponseList>? modelNewsResponseList;

  Data({this.scoreUrl, this.aiComment, this.crime, this.modelNewsResponseList});

  Data.fromJson(Map<String, dynamic> json) {
    scoreUrl = json['scoreUrl'];
    aiComment = json['aiComment'];
    crime = json['crime'];
    if (json['modelNewsResponseList'] != null) {
      modelNewsResponseList = <ModelNewsResponseList>[];
      json['modelNewsResponseList'].forEach((v) {
        modelNewsResponseList!.add(new ModelNewsResponseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scoreUrl'] = this.scoreUrl;
    data['aiComment'] = this.aiComment;
    data['crime'] = this.crime;
    if (this.modelNewsResponseList != null) {
      data['modelNewsResponseList'] =
          this.modelNewsResponseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelNewsResponseList {
  String? company;
  String? newsDate;
  String? title;
  String? newsUrl;

  ModelNewsResponseList(
      {this.company, this.newsDate, this.title, this.newsUrl});

  ModelNewsResponseList.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    newsDate = json['newsDate'];
    title = json['title'];
    newsUrl = json['newsUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['newsDate'] = this.newsDate;
    data['title'] = this.title;
    data['newsUrl'] = this.newsUrl;
    return data;
  }
}