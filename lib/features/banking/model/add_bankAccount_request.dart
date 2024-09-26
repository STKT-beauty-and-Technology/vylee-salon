import 'dart:convert';

AddBankAccountRequest addressRequestFromJson(String str) =>
    AddBankAccountRequest.fromJson(json.decode(str));

String addressRequestToJson(AddBankAccountRequest data) =>
    json.encode(data.toJson());

class AddBankAccountRequest {
  String? accountHolderName;
  int? bankAccountNumber;
  String? bankName;
  String? ifscCode;
  String? emailAddress;
  int? mobileNumber;
  String? address;

  AddBankAccountRequest(
      {this.accountHolderName,
      this.bankAccountNumber,
      this.bankName,
      this.ifscCode,
      this.emailAddress,
      this.mobileNumber,
      this.address});

  AddBankAccountRequest.fromJson(Map<String, dynamic> json) {
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
