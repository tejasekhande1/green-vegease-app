import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/features/dashboard/app_users/delivery_partner_requests/presentation/widgets/request_card_widget.dart';
import '../../../../../../core/common/widgets/app_bar_widget.dart';

class User {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String profilePicture;
  final String status;

  User({
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.profilePicture,
    required this.status,
  });
}

@RoutePage()
class DeliveryRequestPage extends StatelessWidget {
  DeliveryRequestPage({super.key});

  // Hardcoded list of users
  final List<User> users = [
    User(
      firstName: "John",
      lastName: "Doe",
      mobileNumber: "+1234567890",
      profilePicture:
          "https://img.freepik.com/premium-vector/silver-membership-icon-default-avatar-profile-icon-membership-icon-social-media-user-image-vector-illustration_561158-4195.jpg",
      status: "PENDING",
    ),
    User(
      firstName: "Jane",
      lastName: "Smith",
      mobileNumber: "+0987654321",
      profilePicture:
          "https://img.freepik.com/premium-vector/silver-membership-icon-default-avatar-profile-icon-membership-icon-social-media-user-image-vector-illustration_561158-4195.jpg",
      status: "PENDING",
    ),
    User(
      firstName: "Mike",
      lastName: "Johnson",
      mobileNumber: "+1111111111",
      profilePicture:
          "https://img.freepik.com/premium-vector/silver-membership-icon-default-avatar-profile-icon-membership-icon-social-media-user-image-vector-illustration_561158-4195.jpg",
      status: "PENDING",
    ),
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(360.w, 50.h),
          child: const AppBarWidget(
            title1: "Delivery Partner Requests",
            isBack: true,
          )),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return RequestCardWidget(                                                //-------------> Delivery partner request  card
            firstName: user.firstName,
            lastName: user.lastName,
            mobileNumber: user.mobileNumber,
            profilePicture: user.profilePicture,
            status: user.status,
          );
        },
      ),
    );
  }
}

