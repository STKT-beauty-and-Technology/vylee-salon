// To parse this JSON data, do
//
//     final registrationRequest = registrationRequestFromJson(jsonString);

import 'dart:convert';


RegistrationRequest registrationRequestFromJson(String str) =>
    RegistrationRequest.fromJson(json.decode(str));

String registrationRequestToJson(RegistrationRequest data) =>
    json.encode(data.toJson());

class RegistrationRequest {
  final String? fullName;
  final String? salonName;
  final String? vendorEmail;
  final String? mobileNumber;
  final String? vendorAddress;
  final String? vendorCountry;
  final String? vendorState;
  final int? pincode;
  final String? vensorCity;
  final String? password;

  RegistrationRequest({
    this.fullName,
    this.salonName,
    this.vendorEmail,
    this.mobileNumber,
    this.vendorAddress,
    this.vendorCountry,
    this.vendorState,
    this.pincode,
    this.vensorCity,
    this.password,
  });

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      RegistrationRequest(
        fullName: json["fullName"],
        salonName: json["salonName"],
        vendorEmail: json["vendorEmail"],
        mobileNumber: json["mobileNumber"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "salonName": salonName,
        "vendorEmail": vendorEmail,
        "mobileNumber": mobileNumber,
        "password": password,
      };
}
