
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String username,
      phone,
      type,
      countrycode,
      profileImageLink,
    
      createdAt,
      updatedAt,address;
      double lat,long;

  UserModel({
    required this.username,
    required this.phone,
    required this.type,
    required this.countrycode,
    required this.profileImageLink,
    required this.lat,
    required this.long,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
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
      address: documentSnapshot.data()!["address"]??"",
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
        "address":address,
      };
}
