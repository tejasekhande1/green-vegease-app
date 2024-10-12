import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/colors.dart';
import '../../../../../../core/theme/text_styles.dart';

class UserHeaderWidget extends StatelessWidget {
  final String customerName;
  final String location;
  final String customerForYears;
  final String profileImageUrl;
  final int orderCount;

  const UserHeaderWidget({
    super.key,
    required this.customerName,
    required this.location,
    required this.customerForYears,
    required this.profileImageUrl,
    required this.orderCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 35.w,
          backgroundImage: NetworkImage(profileImageUrl),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                customerName,
                style: kTextStyleGilroy300.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                location,
                style: kTextStyleGilroy300.copyWith(
                  fontSize: 14.sp,
                  color: kColorGrey
                ),
              ),
              Text(
                '$orderCount Orders • Customer for $customerForYears years',
                style: kTextStyleGilroy300.copyWith(
                  fontSize: 14.sp,
                  color: kColorGrey
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
