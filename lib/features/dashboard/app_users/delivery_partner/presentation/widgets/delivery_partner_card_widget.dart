import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/colors.dart';

import '../../../../../../core/routes/app_router.dart';
import '../../../../../../core/theme/text_styles.dart';

class DeliveryPartnerCardWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String profilePicture;
  final String status;

  const DeliveryPartnerCardWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.profilePicture,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(const DeliveryPartnerDetailPageRoute());                      //--------> Navigate to Detail Page
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: kColorWhite.withOpacity(0.8), 
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: kColorBlack.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 3),                                                         //----------------> Shadow position
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
                backgroundColor: kColorGrey,
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
                            color: kColorGrey,
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
