import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 173.w,
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.only(right: 15.w, top: 20, bottom: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: kColorCardBorderGrey),
          boxShadow: const [
            BoxShadow(
                color: kColorCardShadow, blurRadius: 12, offset: Offset(0, 6))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 65.h,
              width: 103.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage(Constants.kProductImg),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Organic Bananas',
            style: kTextStyleGilroy700.copyWith(
                fontSize: 16.sp, color: kColorBlack),
          ),
          SizedBox(height: 5.h),
          Text(
            '7pcs, Priceg',
            style: kTextStyleGilroy500.copyWith(
                fontSize: 14.sp, color: kColorGrey),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$4.99',
                style: kTextStyleGilroy600.copyWith(
                    fontSize: 18.sp, color: kColorBlack),
              ),
              Container(
                height: 46.h,
                width: 46.h,
                padding: EdgeInsets.all(14.h), // Add padding to give it space
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: kColorPrimary,
                ),
                child: SizedBox(
                  height: 17.h,
                  width: 17.h,
                  child: SvgPicture.asset(
                    color: kColorWhite,
                    Constants.kPlusIc,
                    // Set a fixed width for the icon
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
