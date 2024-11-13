// Function to show options for image source selection
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/_config.dart';

Future<void> showImagePickerOptions(BuildContext context) async {
  showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      title: const TextWidget('Choose an option'),
      actions: [
        CupertinoActionSheetAction(
          child: const Text('Photo Gallery'),
          onPressed: () {
            // Close the options modal
            Navigator.of(context).pop();
            // Get image from gallery using Cubit
            context.read<ImageCubit>().getImageFromGallery();
          },
        ),
        CupertinoActionSheetAction(
          child: const TextWidget('Camera'),
          onPressed: () {
            // Close the options modal
            Navigator.of(context).pop();
            // Get image from camera using Cubit
            context.read<ImageCubit>().getImageFromCamera();
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: TextWidget(
          'Cancel',
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ),
  );
}
