import 'dart:ffi';

class SalonInfoRequest {
  Int? vendorId;
  String? whatsappNumber;
  String?description;
  String?websiteName;
  SalonInfoRequest({this.vendorId, this.whatsappNumber , this.description , this.websiteName});
}