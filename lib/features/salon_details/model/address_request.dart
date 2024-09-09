// To parse this JSON data, do
//
//     final addressRequest = addressRequestFromJson(jsonString);

import 'dart:convert';

AddressRequest addressRequestFromJson(String str) =>
    AddressRequest.fromJson(json.decode(str));

String addressRequestToJson(AddressRequest data) => json.encode(data.toJson());

class AddressRequest {
  final String? fullName;
  final String? salonName;
  final String? vendorEmail;
  final int? mobileNumber;
  final String? vendorAddress;
  final String? vendorCountry;
  final String? vendorState;
  final int? pincode;
  final String? vensorCity;

  AddressRequest({
    this.fullName,
    this.salonName,
    this.vendorEmail,
    this.mobileNumber,
    this.vendorAddress,
    this.vendorCountry,
    this.vendorState,
    this.pincode,
    this.vensorCity,
  });

  factory AddressRequest.fromJson(Map<String, dynamic> json) => AddressRequest(
        vendorAddress: json["vendorAddress"],
        vendorCountry: json["vendorCountry"],
        vendorState: json["vendorState"],
        pincode: json["pincode"],
        vensorCity: json["vensorCity"],
      );

  Map<String, dynamic> toJson() => {
        "vendorAddress": vendorAddress,
        "vendorCountry": vendorCountry,
        "vendorState": vendorState,
        "pincode": pincode,
        "vensorCity": vensorCity,
      };
}
