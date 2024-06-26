class UserModel {
  String? email;
  String? fullname;
  String? photo;
  String? role;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? phoneNumber;
  String? gender;

  UserModel({this.email, this.fullname, this.photo, this.role, this.updatedAt, this.createdAt, this.id, this.phoneNumber, this.gender});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullname = json['fullname'];
    photo = json['photo'];
    role = json['role'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    phoneNumber = json['phone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['phone'] = this.phoneNumber;
    data['gender'] = this.gender;
    return data;
  }
}
