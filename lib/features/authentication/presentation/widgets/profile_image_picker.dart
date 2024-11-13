import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/_core.dart';
import '/config/_config.dart';

class ProfileImagePickerWidget extends StatelessWidget {
  const ProfileImagePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<ImageCubit, ImageState>(
          builder: (context, state) {
            if (state is ImageInitial) {
              return Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: context.theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  size: 60,
                ),
              );
            } else if (state is ImageSelected) {
              return Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: context.theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    state.image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else if (state is ImageError) {
              return Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: context.theme.colorScheme.error,
                    width: 2,
                  ),
                ),
                alignment: Alignment.center,
                child: TextWidget(
                  state.message,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              );
            }
            return const SizedBox();
          },
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () => showImagePickerOptions(context),
            padding: EdgeInsets.zero,
            icon: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.onPrimaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt,
                size: 18,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
