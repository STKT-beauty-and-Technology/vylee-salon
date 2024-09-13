import 'dart:ffi';

class SalonInfoRequest {
  Int? vendorId;
  Int? whatsappNumber;
  String? description;
  String? websiteName;

  SalonInfoRequest(
      {this.vendorId, this.whatsappNumber, this.description, this.websiteName});

  factory SalonInfoRequest.fromJson(Map<String, dynamic> json) =>
      SalonInfoRequest(
        vendorId: json["vendorId"],
        whatsappNumber: json["whatsappNumber"],
        description: json["description"],
        websiteName: json["websiteName"],
      );

  Map<String, dynamic> toJson() => {
        "vendorId": vendorId,
        "whatsappNumber": whatsappNumber,
        "description": description,
        "websiteName": websiteName,

      };
}
