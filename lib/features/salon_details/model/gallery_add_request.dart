// To parse this JSON data, do
//
//     final GalleryAddRequest = GalleryAddRequestFromJson(jsonString);

import 'dart:convert';

GalleryAddRequest GalleryAddRequestFromJson(String str) =>
    GalleryAddRequest.fromJson(json.decode(str));

String GalleryAddRequestToJson(GalleryAddRequest data) =>
    json.encode(data.toJson());

enum GalleryItemType { images, videos }

class GalleryAddRequest {
  final List<String>? files;

  GalleryAddRequest({
    this.files,
  });

  factory GalleryAddRequest.fromJson(Map<String, dynamic> json) =>
      GalleryAddRequest(
        files: json["files"] == null
            ? []
            : List<String>.from(json["files"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x)),
      };
}
