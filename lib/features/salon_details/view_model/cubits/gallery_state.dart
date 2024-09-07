abstract class GalleryState {}

class GalleryInitialState extends GalleryState {}

class GalleryLoadingState extends GalleryState {}

class GalleryFailureState extends GalleryState {
  final String error;
  GalleryFailureState(this.error);
}

//items picked
class GalleryItemsPickedState extends GalleryState {
  List<String> images;
  List<String> imagePaths;
  List<String> videos;
  List<String> videoPaths;

  GalleryItemsPickedState(
      {required this.images,
      required this.videos,
      required this.imagePaths,
      required this.videoPaths});
}

//items uploaded
class GallerySuccessState extends GalleryState {}
