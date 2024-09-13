// To parse this JSON data, do
//
//     final GalleryAddRequest = GalleryAddRequestFromJson(jsonString);

import 'dart:convert';

import 'package:dio/dio.dart';

enum GalleryItemType { images, videos }

class GalleryAddRequest {
  final List<String> files;
  final int vendorId;

  GalleryAddRequest({
    required this.files,
    required this.vendorId,
  });

  FormData toImagesFormData() {
    final formData = FormData();
    formData.files.addAll(List.generate(files.length, (index) {
      return MapEntry('files', MultipartFile.fromFileSync(files[index]));
    }));
    formData.fields.add(MapEntry("vendorId", vendorId.toString()));

    return formData;
  }

  FormData toVideosFormData() {
    final formData = FormData();
    formData.files.addAll(List.generate(files.length, (index) {
      return MapEntry('files', MultipartFile.fromFileSync(files[index]));
    }));
    formData.fields.add(MapEntry("vendorId", vendorId.toString()));
    formData.fields.add(const MapEntry("names", "vylle"));

    return formData;
  }
}
