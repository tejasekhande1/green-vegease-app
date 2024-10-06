import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/text_styles.dart';
import 'over_view_detail_widget.dart';

class OverViewSectionWidget extends StatelessWidget {
  const OverViewSectionWidget({
    super.key,
    required this.address,
    required this.email,
    required this.phone,
  });

  final String address;
  final String email;
  final String phone;

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
        OverViewDetailWidget(title: "Address", detail: address),
        OverViewDetailWidget(title: "Email Address", detail: email),
        OverViewDetailWidget(title: "Phone", detail: phone),
        SizedBox(height: 20.h),
        TextButton(
          onPressed: () {},
          child: Text(
            "Delete Partner",
            style: kTextStyleGilroy300.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
