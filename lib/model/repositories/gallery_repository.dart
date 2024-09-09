import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/data/network/api_routes.dart';
import 'package:vylee_partner/data/network/api_service.dart';
import 'package:vylee_partner/features/salon_details/model/gallery_add_request.dart';
import 'package:vylee_partner/features/salon_details/model/gallery_add_response.dart';

class GalleryRepository {
  final ApiService apiService = ApiService();
  final logger = Logger();

  Future<GalleryAddResponse> addGalleryItems(
      GalleryAddRequest request, GalleryItemType item) async {
    try {
      final response = await apiService.sendRequest.post(
          item == GalleryItemType.images
              ? ApiRoutes.addGalleryImages
              : ApiRoutes.addGalleryVideos,
          data: request.toJson());

      return GalleryAddResponse.fromDioResponse(response);
    } on DioException catch (e) {
      logger.e(e);
      return GalleryAddResponse(
          message: "Connection to Server failed", success: false);
    } catch (e) {
      logger.e(e);
      return GalleryAddResponse(message: "Error ocurred in Registration $e");
    }
  }
}