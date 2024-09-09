import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
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
      final imageRes = await _galleryRepository.addGalleryItems(
          images, GalleryItemType.images);
      final videoRes = await _galleryRepository.addGalleryItems(
          videos, GalleryItemType.videos);
      if (imageRes.success == true && videoRes.success == true) {
        emit(GallerySuccessState());
      } else if (imageRes.success == false) {
        emit(GalleryFailureState("Image Upload error: ${imageRes.message}"));
      } else if (imageRes.success == false) {
        emit(GalleryFailureState("Video Upload error: ${videoRes.message}"));
      }
    } catch (e) {
      emit(GalleryFailureState(e.toString()));
    }
  }

  uploadFiles() async {
    await addFiles(
      GalleryAddRequest(files: (state as GalleryItemsPickedState).images),
      GalleryAddRequest(files: (state as GalleryItemsPickedState).videos),
    );
  }

  convertToBase64(GalleryItemType type, File file) {
    List<int> imageBytes = file.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  pickGalleryItem(GalleryItemType type, File file) {
    List<String> images = state is GalleryItemsPickedState
        ? (state as GalleryItemsPickedState).images
        : [];
    List<String> imagePaths = state is GalleryItemsPickedState
        ? (state as GalleryItemsPickedState).imagePaths
        : [];
    List<String> videos = state is GalleryItemsPickedState
        ? (state as GalleryItemsPickedState).videos
        : [];
    List<String> videoPaths = state is GalleryItemsPickedState
        ? (state as GalleryItemsPickedState).videoPaths
        : [];

    List<int> fileBytes = file.readAsBytesSync();
    switch (type) {
      case GalleryItemType.images:
        images.add(base64Encode(fileBytes));
        imagePaths.add(file.path);
        emit(GalleryItemsPickedState(
            images: images,
            videos: videos,
            imagePaths: imagePaths,
            videoPaths: videoPaths));
      case GalleryItemType.videos:
        videos.add(base64Encode(fileBytes));
        videoPaths.add(file.path);
        emit(GalleryItemsPickedState(
            images: images,
            videos: videos,
            imagePaths: imagePaths,
            videoPaths: videoPaths));
        break;
      default:
    }
  }

  removeGalleryItem(GalleryItemType type, String filePath) {
    List<String> images = (state as GalleryItemsPickedState).images;
    List<String> imagePaths = (state as GalleryItemsPickedState).imagePaths;
    List<String> videos = (state as GalleryItemsPickedState).videos;
    List<String> videoPaths = (state as GalleryItemsPickedState).videoPaths;

    switch (type) {
      case GalleryItemType.images:
        final index = imagePaths.indexOf(filePath);
        imagePaths.removeAt(index);
        images.removeAt(index);
        emit(GalleryItemsPickedState(
            images: images,
            videos: videos,
            imagePaths: imagePaths,
            videoPaths: videoPaths));
      case GalleryItemType.videos:
        final index = videoPaths.indexOf(filePath);
        videoPaths.removeAt(index);
        videos.removeAt(index);
        emit(GalleryItemsPickedState(
            images: images,
            videos: videos,
            imagePaths: imagePaths,
            videoPaths: videoPaths));
        break;
      default:
    }
  }
}