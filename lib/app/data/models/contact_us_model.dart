import 'package:loogisti/app/data/models/contact_model.dart';

class ContactUsModel {
  List<ContactModel>? numberContact;
  List<ContactModel>? socialContact;
  List<ContactModel>? socialLink;
  String? contactContent;

  ContactUsModel({this.numberContact, this.socialContact, this.socialLink, this.contactContent});

  ContactUsModel.fromJson(Map<String, dynamic> json) {
    if (json['contacts']['number contact'] != null) {
      numberContact = <ContactModel>[];
      json['contacts']['number contact'].forEach((v) {
        numberContact!.add(new ContactModel.fromJson(v));
      });
    }
    if (json['contacts']['social contact'] != null) {
      socialContact = <ContactModel>[];
      json['contacts']['social contact'].forEach((v) {
        socialContact!.add(new ContactModel.fromJson(v));
      });
    }
    if (json['contacts']['social link'] != null) {
      socialLink = <ContactModel>[];
      json['contacts']['social link'].forEach((v) {
        socialLink!.add(new ContactModel.fromJson(v));
      });
    }
    contactContent = json['contact']['content'];
  }
}
