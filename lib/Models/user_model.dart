
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwa2y/Models/Address.dart';

class UserModel {
  String? username, phone,type, countrycode, profileImageLink, createdAt,updatedAt,gender,birthday,email;
double lat,long;
List<Address>? addresses;

  UserModel({
  required this.lat,
   required  this.long,
     this.username,
     this.phone,
     this.type,
     this.countrycode,
     this.profileImageLink,
     this.gender,
     this.birthday,
     this.email,

     this.createdAt,
     this.updatedAt,
     this.addresses,
  });
  factory UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    return UserModel(
      username: documentSnapshot.data()!["username"]??"",
      phone: documentSnapshot.data()!["phone"]??"",
      createdAt: documentSnapshot.data()!["createdAt"]??"",
      profileImageLink: documentSnapshot.data()!["profileImageLink"]??"",
      updatedAt: documentSnapshot.data()!["updatedAt"]??"",
      lat: documentSnapshot.data()!["lat"]??0.0,
      long: documentSnapshot.data()!["long"]??0.0,
      countrycode: documentSnapshot.data()!["countryCode"]??"",
      type: documentSnapshot.data()!["type"]??"",
      addresses: documentSnapshot.data()!["address"]!=null?documentSnapshot.get("address").map<Address>((m)=>Address.fromJson(m)).toList():<Address>[],
      birthday: documentSnapshot.data()!["birthday"]??"",
      gender: documentSnapshot.data()!["gender"]??"",
      email: documentSnapshot.data()!["email"]??"",
          );
  }

  Map<String, dynamic> userModelToJson() => {
        "username": username,
        "phone": phone,
        "countryCode": countrycode,
        "type": type,
        "profileImageLink": profileImageLink,
        "lat": lat,
        "long": long,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "address":addresses,
      };
}
