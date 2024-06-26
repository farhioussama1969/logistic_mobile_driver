import 'package:loogisti/app/data/models/media_model.dart';

class BannerModel {
  int? id;
  String? name;
  String? link;
  String? type;
  MediaModel? image;

  BannerModel({this.id, this.name, this.link, this.type, this.image});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    type = json['type'];
    image = json['image'] != null ? MediaModel.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['link'] = link;
    data['type'] = type;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}
