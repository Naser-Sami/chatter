import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

part 'image_picker_state.dart';

// ImageCubit for handling image selection
class ImageCubit extends Cubit<ImageState> {
  final ImagePicker _picker = ImagePicker();

  ImageCubit() : super(ImageInitial());

  Future<void> getImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(ImageSelected(File(pickedFile.path)));
      } else {
        emit(ImageError('No image selected.'));
      }
    } catch (e) {
      emit(ImageError('Failed to pick image: $e'));
    }
  }

  Future<void> getImageFromCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        emit(ImageSelected(File(pickedFile.path)));
      } else {
        emit(ImageError('No image selected.'));
      }
    } catch (e) {
      emit(ImageError('Failed to pick image: $e'));
    }
  }
}
