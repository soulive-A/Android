class GetModelIntroduce {
  int? code;
  String? message;
  Data? data;
  bool? success;

  GetModelIntroduce({this.code, this.message, this.data, this.success});

  GetModelIntroduce.fromJson(Map<String, dynamic> json) {
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
  List<String>? modelImageKeywords;
  List<ModelRecentWorks>? modelRecentWorks;
  List<ModelRecentAdvertisements>? modelRecentAdvertisements;

  Data(
      {this.modelImageKeywords,
        this.modelRecentWorks,
        this.modelRecentAdvertisements});

  Data.fromJson(Map<String, dynamic> json) {
    modelImageKeywords = json['modelImageKeywords'].cast<String>();
    if (json['modelRecentWorks'] != null) {
      modelRecentWorks = <ModelRecentWorks>[];
      json['modelRecentWorks'].forEach((v) {
        modelRecentWorks!.add(new ModelRecentWorks.fromJson(v));
      });
    }
    if (json['modelRecentAdvertisements'] != null) {
      modelRecentAdvertisements = <ModelRecentAdvertisements>[];
      json['modelRecentAdvertisements'].forEach((v) {
        modelRecentAdvertisements!
            .add(new ModelRecentAdvertisements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modelImageKeywords'] = this.modelImageKeywords;
    if (this.modelRecentWorks != null) {
      data['modelRecentWorks'] =
          this.modelRecentWorks!.map((v) => v.toJson()).toList();
    }
    if (this.modelRecentAdvertisements != null) {
      data['modelRecentAdvertisements'] =
          this.modelRecentAdvertisements!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelRecentWorks {
  String? imageUrl;
  int? year;
  String? category;
  String? title;
  String? genre;
  String? role;

  ModelRecentWorks(
      {this.imageUrl,
        this.year,
        this.category,
        this.title,
        this.genre,
        this.role});

  ModelRecentWorks.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    year = json['year'];
    category = json['category'];
    title = json['title'];
    genre = json['genre'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['year'] = this.year;
    data['category'] = this.category;
    data['title'] = this.title;
    data['genre'] = this.genre;
    data['role'] = this.role;
    return data;
  }
}

class ModelRecentAdvertisements {
  String? imageUrl;
  int? year;
  String? brand;

  ModelRecentAdvertisements({this.imageUrl, this.year, this.brand});

  ModelRecentAdvertisements.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    year = json['year'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['year'] = this.year;
    data['brand'] = this.brand;
    return data;
  }
}