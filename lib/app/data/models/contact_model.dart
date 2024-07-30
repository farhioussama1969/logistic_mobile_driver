class ContactModel {
  String? value;
  String? type;
  String? photo;
  ContactModel({
    this.value,
    this.type,
    this.photo,
  });

  ContactModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    type = json['type'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['type'] = this.type;
    data['photo'] = this.photo;
    return data;
  }
}
