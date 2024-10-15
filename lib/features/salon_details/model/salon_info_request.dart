import 'package:dio/dio.dart';

class SalonInfoRequest {
  int? vendorId;
  String? whatsappNumber;
  String? description;
  String file;
  String? websiteName;
  SalonInfoRequest(
      {this.vendorId,
      this.whatsappNumber,
      this.description,
      this.websiteName,
      required this.file});

  FormData toFormData() {
    return FormData.fromMap({'file': MultipartFile.fromFileSync(file)});
  }
}
