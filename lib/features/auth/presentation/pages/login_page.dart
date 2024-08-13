import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          "assets//images/login_background.svg", // Path to your SVG file
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover, // Ensures the SVG covers the entire container
        ),
      ],
    ));
  }
}
