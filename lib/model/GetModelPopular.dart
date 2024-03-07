class GetModelPopular {
  int? code;
  String? message;
  Data? data;
  bool? success;

  GetModelPopular({this.code, this.message, this.data, this.success});

  GetModelPopular.fromJson(Map<String, dynamic> json) {
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
  int? modelPopularityId;
  int? modelId;
  String? scoreUrl;
  String? aiComment;
  List<String>? genders;
  List<String>? ages;
  String? snsUrl;
  String? searchUrl;
  String? brandScoreUrl;
  List<ModelScheduledWorks>? modelScheduledWorks;

  Data(
      {this.modelPopularityId,
        this.modelId,
        this.scoreUrl,
        this.aiComment,
        this.genders,
        this.ages,
        this.snsUrl,
        this.searchUrl,
        this.brandScoreUrl,
        this.modelScheduledWorks});

  Data.fromJson(Map<String, dynamic> json) {
    modelPopularityId = json['modelPopularityId'];
    modelId = json['modelId'];
    scoreUrl = json['scoreUrl'];
    aiComment = json['aiComment'];
    genders = json['genders'].cast<String>();
    ages = json['ages'].cast<String>();
    snsUrl = json['snsUrl'];
    searchUrl = json['searchUrl'];
    brandScoreUrl = json['brandScoreUrl'];
    if (json['modelScheduledWorks'] != null) {
      modelScheduledWorks = <ModelScheduledWorks>[];
      json['modelScheduledWorks'].forEach((v) {
        modelScheduledWorks!.add(new ModelScheduledWorks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modelPopularityId'] = this.modelPopularityId;
    data['modelId'] = this.modelId;
    data['scoreUrl'] = this.scoreUrl;
    data['aiComment'] = this.aiComment;
    data['genders'] = this.genders;
    data['ages'] = this.ages;
    data['snsUrl'] = this.snsUrl;
    data['searchUrl'] = this.searchUrl;
    data['brandScoreUrl'] = this.brandScoreUrl;
    if (this.modelScheduledWorks != null) {
      data['modelScheduledWorks'] =
          this.modelScheduledWorks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelScheduledWorks {
  String? imageUrl;
  int? year;
  String? category;
  String? title;
  bool? isMainActor;
  String? genre;

  ModelScheduledWorks(
      {this.imageUrl,
        this.year,
        this.category,
        this.title,
        this.isMainActor,
        this.genre});

  ModelScheduledWorks.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    year = json['year'];
    category = json['category'];
    title = json['title'];
    isMainActor = json['isMainActor'];
    genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['year'] = this.year;
    data['category'] = this.category;
    data['title'] = this.title;
    data['isMainActor'] = this.isMainActor;
    data['genre'] = this.genre;
    return data;
  }
}