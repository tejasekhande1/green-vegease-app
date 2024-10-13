import 'package:flutter/material.dart';
import 'package:green_vegease/core/theme/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
        color: kColorTransparent,
        height: height,
        width: width,
        child: const Center(child: CircularProgressIndicator()));
  }
}
