class GetModelrecent {
  int? code;
  String? message;
  Data? data;
  bool? success;

  GetModelrecent({this.code, this.message, this.data, this.success});

  GetModelrecent.fromJson(Map<String, dynamic> json) {
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
  int? aiRate;
  String? job;

  Data({this.modelId, this.imageUrl, this.modelName, this.aiRate, this.job});

  Data.fromJson(Map<String, dynamic> json) {
    modelId = json['modelId'];
    imageUrl = json['imageUrl'];
    modelName = json['modelName'];
    aiRate = json['aiRate'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modelId'] = this.modelId;
    data['imageUrl'] = this.imageUrl;
    data['modelName'] = this.modelName;
    data['aiRate'] = this.aiRate;
    data['job'] = this.job;
    return data;
  }
}