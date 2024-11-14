// Function to show options for image source selection
import 'package:chatter/core/utils/_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/_config.dart';

Future<void> showImagePickerOptions(BuildContext context) async {
  if (TDeviceUtils.isAndroid()) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: [
          ListTile(
            title: _photoGalleryText(context),
            onTap: () => _onPhotoGallery(context),
            leading: const Icon(Icons.photo_library),
          ),
          ListTile(
            title: _cameraText(context),
            onTap: () => _onCamera(context),
            leading: const Icon(Icons.camera_alt),
          ),
          ListTile(
            title: _cancelText(context),
            onTap: () => _onCancel(context),
            leading: const Icon(Icons.cancel_outlined),
          ),
        ],
      ),
    );
  }

  return showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      title: const TextWidget('Choose an option'),
      actions: [
        CupertinoActionSheetAction(
          child: _photoGalleryText(context),
          onPressed: () => _onPhotoGallery(context),
        ),
        CupertinoActionSheetAction(
          child: _cameraText(context),
          onPressed: () => _onCamera(context),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: _cancelText(context),
        onPressed: () => _onCancel(context),
      ),
    ),
  );
}

// Photo Gallery Text UI
TextWidget _photoGalleryText(BuildContext context) => const TextWidget('Photo Gallery');

// Function to handle Photo Gallery Functionality
void _onPhotoGallery(BuildContext context) {
  // Close the options modal
  Navigator.of(context).pop();
  // Get image from gallery using Cubit
  context.read<ImageCubit>().getImageFromGallery();
}

// Camera Text UI
TextWidget _cameraText(BuildContext context) => const TextWidget('Camera');

// Function to handle Camera Functionality
void _onCamera(BuildContext context) {
  // Close the options modal
  Navigator.of(context).pop();
  // Get image from camera using Cubit
  context.read<ImageCubit>().getImageFromCamera();
}

// Cancel Text UI
TextWidget _cancelText(BuildContext context) => TextWidget(
      'Cancel',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
    );

// Function to handle cancel action
void _onCancel(BuildContext context) => Navigator.of(context).pop();
