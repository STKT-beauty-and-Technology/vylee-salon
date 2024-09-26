import 'dart:convert';

GetBankDetailsResponse GetBankDetailsResponseFromJson(String str) =>
    GetBankDetailsResponse.fromJson(json.decode(str));

String GetBankDetailsResponseToJson(GetBankDetailsResponse data) =>
    json.encode(data.toJson());

class GetBankDetailsResponse {
  int? id;
  int? vendorId;
  String? accountHolderName;
  int? bankAccountNumber;
  String? bankName;
  String? ifscCode;
  String? emailAddress;
  int? mobileNumber;
  String? address;

  GetBankDetailsResponse({
    this.id,
    this.vendorId,
    this.accountHolderName,
    this.bankAccountNumber,
    this.bankName,
    this.ifscCode,
    this.emailAddress,
    this.mobileNumber,
    this.address,
  });

  factory GetBankDetailsResponse.fromDioResponse(
          Map<String, dynamic> response) =>
      GetBankDetailsResponse(
        id: response['id'],
        vendorId: response['vendorId'],
        accountHolderName: response['accountHolderName'],
        bankAccountNumber: response['bankAccountNumber'],
        bankName: response['bankName'],
        ifscCode: response['ifscCode'],
        emailAddress: response['emailAddress'],
        mobileNumber: response['mobileNumber'],
        address: response['address'],
      );
  GetBankDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = json['vendorId'];
    accountHolderName = json['accountHolderName'];
    bankAccountNumber = json['bankAccountNumber'];
    bankName = json['bankName'];
    ifscCode = json['ifscCode'];
    emailAddress = json['emailAddress'];
    mobileNumber = json['mobileNumber'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendorId'] = this.vendorId;
    data['accountHolderName'] = this.accountHolderName;
    data['bankAccountNumber'] = this.bankAccountNumber;
    data['bankName'] = this.bankName;
    data['ifscCode'] = this.ifscCode;
    data['emailAddress'] = this.emailAddress;
    data['mobileNumber'] = this.mobileNumber;
    data['address'] = this.address;
    return data;
  }
}
