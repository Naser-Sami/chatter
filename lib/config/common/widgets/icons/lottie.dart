import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAssetWidget extends StatelessWidget {
  const LottieAssetWidget({
    super.key,
    this.width,
    this.height,
    required this.name,
  });

  final String name;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Lottie.asset('assets/lottie/$name.json'),
    );
  }
}
