import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/data/local/vendorId_provider.dart';
import 'package:vylee_partner/features/salon_details/model/gallery_add_request.dart';
import 'package:vylee_partner/features/salon_details/view_model/cubits/gallery_state.dart';
import 'package:vylee_partner/model/repositories/gallery_repository.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitialState());
  final _galleryRepository = GalleryRepository();
  final logger = Logger();

  Future<void> addFiles(
      GalleryAddRequest images, GalleryAddRequest videos) async {
    emit(GalleryLoadingState());
    try {
      if (images.files.isNotEmpty) {
        final imageRes = await _galleryRepository.addGalleryItems(
            images, GalleryItemType.images);

        if (imageRes.success == false) {
          emit(GalleryFailureState("Image Upload error: ${imageRes.message}"));
          return;
        }
      }
      if (videos.files.isNotEmpty) {
        final videoRes = await _galleryRepository.addGalleryItems(
            videos, GalleryItemType.videos);
        if (videoRes.success == false) {
          emit(GalleryFailureState("Video Upload error: ${videoRes.message}"));
          return;
        }
      }

      emit(GallerySuccessState());
    } catch (e) {
      emit(GalleryFailureState(e.toString()));
    }
  }

  uploadFiles() async {
    final int id = await VendorIdProvider.getVendorId();
    await addFiles(
      GalleryAddRequest(
          files: (state as GalleryItemsPickedState).imagePaths, vendorId: id),
      GalleryAddRequest(
          files: (state as GalleryItemsPickedState).videoPaths, vendorId: id),
    );
  }

  convertToBase64(GalleryItemType type, File file) {
    List<int> imageBytes = file.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  pickGalleryItem(GalleryItemType type, File file) {
    List<String> imagePaths = state is GalleryItemsPickedState
        ? (state as GalleryItemsPickedState).imagePaths
        : [];

    List<String> videoPaths = state is GalleryItemsPickedState
        ? (state as GalleryItemsPickedState).videoPaths
        : [];

    switch (type) {
      case GalleryItemType.images:
        imagePaths.add(file.path);
        emit(GalleryItemsPickedState(
            imagePaths: imagePaths, videoPaths: videoPaths));
      case GalleryItemType.videos:
        videoPaths.add(file.path);
        emit(GalleryItemsPickedState(
            imagePaths: imagePaths, videoPaths: videoPaths));
        break;
      default:
    }
  }

  removeGalleryItem(GalleryItemType type, String filePath) {
    List<String> imagePaths = (state as GalleryItemsPickedState).imagePaths;
    List<String> videoPaths = (state as GalleryItemsPickedState).videoPaths;

    switch (type) {
      case GalleryItemType.images:
        final index = imagePaths.indexOf(filePath);
        imagePaths.removeAt(index);
        emit(GalleryItemsPickedState(
            imagePaths: imagePaths, videoPaths: videoPaths));
      case GalleryItemType.videos:
        final index = videoPaths.indexOf(filePath);
        videoPaths.removeAt(index);
        emit(GalleryItemsPickedState(
            imagePaths: imagePaths, videoPaths: videoPaths));
        break;
      default:
    }
  }
}
