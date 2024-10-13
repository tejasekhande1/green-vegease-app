import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/text_styles.dart';

class OverviewDetailWidget extends StatelessWidget {
  final String title;
  final String detail;

  const OverviewDetailWidget({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: kTextStyleGilroy500.copyWith(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              detail,
              style: kTextStyleGilroy400.copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
