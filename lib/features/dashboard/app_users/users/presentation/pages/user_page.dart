import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/common/widgets/app_bar_widget.dart';
import '../widgets/user_card_widget.dart';

class User {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String profilePicture;

  User({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.profilePicture,
  });
}

@RoutePage()
class UserPage extends StatelessWidget {
  UserPage({super.key});

  // Hardcoded list of users
  final List<User> users = [
    User(
      firstName: "John",
      lastName: "Doe",
      mobileNumber: "+1234567890",
      profilePicture:
          "https://img.freepik.com/premium-photo/stylish-man-flat-vector-profile-picture-ai-generated_606187-310.jpg",
    ),
    User(
      firstName: "Jane",
      lastName: "Smith",
      mobileNumber: "+0987654321",
      profilePicture:
          "https://img.freepik.com/premium-photo/stylish-man-flat-vector-profile-picture-ai-generated_606187-310.jpg",
    ),
    User(
      firstName: "Mike",
      lastName: "Johnson",
      mobileNumber: "+1111111111",
      profilePicture:
          "https://img.freepik.com/premium-photo/stylish-man-flat-vector-profile-picture-ai-generated_606187-310.jpg",
    ),
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(360.w, 50.h),
          child: const AppBarWidget(
            title1: "Users",
            isBack: true,
          )),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return UserCardWidget(
            firstName: user.firstName,
            lastName: user.lastName,
            mobileNumber: user.mobileNumber,
            profilePicture: user.profilePicture,
          );
        },
      ),
    );
  }
}

