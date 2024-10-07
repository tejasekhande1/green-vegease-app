import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
import '../../../../../../core/routes/app_router.dart';

class UserCardWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String profilePicture;

  const UserCardWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.profilePicture,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(const UserDetailPageRoute());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(profilePicture),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$firstName $lastName",
                  style: kTextStyleGilroy500.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  mobileNumber,
                  style: kTextStyleGilroy300.copyWith(
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
