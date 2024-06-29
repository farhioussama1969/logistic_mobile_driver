class UserModel {
  int? id;
  String? fullname;
  String? email;
  String? photo;
  String? address;
  String? phone;
  String? role;
  String? gender;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? typeCar;
  String? licenseExpiryDate;
  String? blackCard;
  String? registerNumber;
  String? nextInspectionDate;
  String? insuranceExpiryDate;

  UserModel(
      {this.id,
      this.fullname,
      this.email,
      this.photo,
      this.address,
      this.phone,
      this.role,
      this.gender,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.typeCar,
      this.licenseExpiryDate,
      this.blackCard,
      this.registerNumber,
      this.nextInspectionDate,
      this.insuranceExpiryDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    photo = json['photo'];
    address = json['address'];
    phone = json['phone'];
    role = json['role'];
    gender = json['gender'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeCar = json['type_car'];
    licenseExpiryDate = json['license_expiry_date'];
    blackCard = json['black_card'];
    registerNumber = json['register_number'];
    nextInspectionDate = json['next_inspection_date'];
    insuranceExpiryDate = json['insurance_expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['gender'] = this.gender;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type_car'] = this.typeCar;
    data['license_expiry_date'] = this.licenseExpiryDate;
    data['black_card'] = this.blackCard;
    data['register_number'] = this.registerNumber;
    data['next_inspection_date'] = this.nextInspectionDate;
    data['insurance_expiry_date'] = this.insuranceExpiryDate;
    return data;
  }
}
