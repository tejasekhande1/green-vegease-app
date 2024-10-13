import 'package:flutter/material.dart';

class BackgroundImgWidget extends StatelessWidget {
  const BackgroundImgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        "assets/images/login_background.png",
        fit: BoxFit.fill, // Ensures the image covers the screen
      ),
    );
  }
}