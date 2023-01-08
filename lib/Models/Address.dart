class Address {
  String? addressTitle;
  String? phone;
  String? streetName;
  String? building;
  String? floor;
  String? apartment;
  String? landmark;

  Address({
    required this.addressTitle,
    required this.phone,
    required this.streetName,
    required this.building,
    required this.floor,
    required this.apartment,
    required this.landmark,
  });
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        addressTitle: json["AddressTitle"] ?? "",
        phone: json["Phone"] ?? "",
        streetName: json["StreetName"] ?? "",
        apartment: json["Apartment"] ?? "",
        building: json["Building"],
        floor: json["Floor"],
        landmark: json["landmark"],
        );
  }
}
