import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '/core/_core.dart';

part 'image_picker_state.dart';

// ImageCubit for handling image selection
class ImageCubit extends Cubit<ImageState> {
  final ImagePicker _picker = ImagePicker();

  ImageCubit() : super(ImageInitial());

  Future<void> getImageFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // Crop the image
        final croppedImage = await cropImage(pickedFile: pickedFile);

        if (croppedImage != null) {
          emit(ImageSelected(File(croppedImage.path)));
        } else {
          emit(ImageSelected(File(pickedFile.path)));
        }
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
        // Crop the image
        final croppedImage = await cropImage(pickedFile: pickedFile);

        if (croppedImage != null) {
          emit(ImageSelected(File(croppedImage.path)));
        } else {
          emit(ImageSelected(File(pickedFile.path)));
        }
      } else {
        emit(ImageError('No image selected.'));
      }
    } catch (e) {
      emit(ImageError('Failed to pick image: $e'));
    }
  }

  Future<CroppedFile?> cropImage({required XFile? pickedFile}) async {
    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            // toolbarColor: Colors.deepOrange,
            // toolbarWidgetColor: Colors.white,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
            ],
          ),
          IOSUiSettings(
            title: 'Cropper',
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
            ],
          ),
          WebUiSettings(
            context: NavigationService.navigatorKey.currentContext!,
          ),
        ],
      );

      return croppedFile;
    }

    return null;
  }
}
