class MediaModel {
  int? id;
  String? type;
  String? extension;
  String? url;

  MediaModel({this.id, this.type, this.extension, this.url});

  MediaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    extension = json['extension'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['type'] = type;
    data['extension'] = extension;
    data['url'] = url;
    return data;
  }
}
