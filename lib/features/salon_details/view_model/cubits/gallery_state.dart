abstract class GalleryState {}

class GalleryInitialState extends GalleryState {}

class GalleryLoadingState extends GalleryState {}

class GalleryFailureState extends GalleryState {
  final String error;
  GalleryFailureState(this.error);
}

//items picked
class GalleryItemsPickedState extends GalleryState {
  List<String> imagePaths;
  List<String> videoPaths;

  GalleryItemsPickedState(
      {
      required this.imagePaths,
      required this.videoPaths});
}

//items uploaded
class GallerySuccessState extends GalleryState {}
