import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/colors.dart';
import '../../../../../../core/theme/text_styles.dart';

class PartnerHeaderWidget extends StatelessWidget {
  const PartnerHeaderWidget({
    super.key,
    required this.partnerName,
    required this.location,
    required this.partnerForYears,
    required this.profileImageUrl,
    required this.deliveryCount,
  });

  final String partnerName;
  final String location;
  final String partnerForYears;
  final String profileImageUrl;
  final int deliveryCount;

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
                partnerName,
                style: kTextStyleGilroy300.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                location,
                style: kTextStyleGilroy300.copyWith(
                  fontSize: 14.sp,
                  color: kColorGrey,
                ),
              ),
              Text(
                '$deliveryCount Deliveries • Partner for $partnerForYears years',
                style: kTextStyleGilroy300.copyWith(
                  fontSize: 14.sp,
                  color: kColorGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
