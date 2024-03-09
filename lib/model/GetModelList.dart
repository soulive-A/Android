class GetAllModel {
  int? code;
  String? message;
  Data? data;
  bool? success;

  GetAllModel({this.code, this.message, this.data, this.success});

  GetAllModel.fromJson(Map<String, dynamic> json) {
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
  List<Format>? actors;
  List<Format>? singers;
  List<Format>? youtuber;

  Data({this.actors, this.singers, this.youtuber});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['actors'] != null) {
      actors = <Format>[];
      json['actors'].forEach((v) {
        actors!.add(new Format.fromJson(v));
      });
    }
    if (json['singers'] != null) {
      singers = <Format>[];
      json['singers'].forEach((v) {
        singers!.add(new Format.fromJson(v));
      });
    }
    if (json['youtuber'] != null) {
      youtuber = <Format>[];
      json['youtuber'].forEach((v) {
        youtuber!.add(new Format.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.actors != null) {
      data['actors'] = this.actors!.map((v) => v.toJson()).toList();
    }
    if (this.singers != null) {
      data['singers'] = this.singers!.map((v) => v.toJson()).toList();
    }
    if (this.youtuber != null) {
      data['youtuber'] = this.youtuber!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Format {
  String? imageUrl;
  String? name;
  String? job;

  Format({this.imageUrl, this.name, this.job});

  Format.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    name = json['name'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['job'] = this.job;
    return data;
  }
}