part of 'image_picker_cubit.dart';

// State for ImageCubit
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageSelected extends ImageState {
  final File image;
  ImageSelected(this.image);
}

class ImageError extends ImageState {
  final String message;
  ImageError(this.message);
}
