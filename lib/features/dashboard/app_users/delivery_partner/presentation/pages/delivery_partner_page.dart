import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/theme/text_styles.dart';

import '../../../../../../core/common/widgets/app_bar_widget.dart';
import '../../../../../../core/routes/app_router.dart';
import '../widgets/delivery_partner_approve_widget.dart';

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
class DeliveryPartnerPage extends StatelessWidget {
  DeliveryPartnerPage({super.key});

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
            title1: "Delivery Partner",
            isBack: true,
          )),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return UserProfileCard(
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

class UserProfileCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String profilePicture;
  final String status;

  const UserProfileCard({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.profilePicture,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(const DeliveryPartnerDetailPageRoute());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8), // White with some transparency
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(profilePicture),
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$firstName $lastName",
                      style: kTextStyleGilroy400.copyWith(
                        fontSize: 20.sp,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          mobileNumber,
                          style: kTextStyleGilroy400.copyWith(
                            fontSize: 16.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
