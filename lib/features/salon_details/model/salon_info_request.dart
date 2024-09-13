import 'package:dio/dio.dart';

class SalonInfoRequest {
  int? vendorId;
  String? whatsappNumber;
  String? description;
  String filePath;
  String? websiteName;
  SalonInfoRequest(
      {this.vendorId,
      this.whatsappNumber,
      this.description,
      this.websiteName,
      required this.filePath});

  FormData toFormData() {
    return FormData.fromMap({'file': MultipartFile.fromFileSync(filePath)});
  }
}
