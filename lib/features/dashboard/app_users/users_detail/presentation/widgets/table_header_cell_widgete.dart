import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/text_styles.dart';

class TableHeaderCellWidget extends StatelessWidget {
  const TableHeaderCellWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.h),
      child: Text(
        title,
        style: kTextStyleGilroy500.copyWith(fontSize: 16.sp),
      ),
    );
  }
}
