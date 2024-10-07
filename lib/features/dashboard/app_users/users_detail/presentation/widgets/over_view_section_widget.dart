import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/text_styles.dart';
import 'over_view_detail_widget.dart';

class OverviewSectionWidget extends StatelessWidget {
  final String address;
  final String email;
  final String phone;

  const OverviewSectionWidget({
    super.key,
    required this.address,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overview",
          style: kTextStyleGilroy300.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        OverviewDetailWidget(title: "Address", detail: address),
        OverviewDetailWidget(title: "Email Address", detail: email),
        OverviewDetailWidget(title: "Phone", detail: phone),
        SizedBox(height: 20.h),
        TextButton(
          onPressed: () {},
          child: Text(
            "Delete Customer",
            style: kTextStyleGilroy300.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
