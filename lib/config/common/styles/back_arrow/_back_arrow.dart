import 'package:flutter/material.dart';

import '/core/_core.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: TDeviceUtils.isIOS()
          ? const Icon(
              Icons.arrow_back_ios_new,
            )
          : const Icon(
              Icons.arrow_back,
            ),
    );
  }
}
