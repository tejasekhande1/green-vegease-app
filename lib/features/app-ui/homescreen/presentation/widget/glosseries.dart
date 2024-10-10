import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/constants/constants.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
import 'package:green_vegease/features/app-ui/homescreen/presentation/widget/product_card.dart';

class Glosseries extends StatelessWidget {
  final List<Map<dynamic, String>> products;
  const Glosseries({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.only(left: 23.5.w, bottom: 25),
          child: Text(
            'Glosseries',
            style: kTextStyleGilroy600.copyWith(
                fontSize: 24.sp, color: const Color.fromRGBO(24, 23, 37, 1)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 13.5.w, left: 23.5.w),
          height: 125.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(bottom: 25.h),
              height: 105.h,
              width: 248.19.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color.fromRGBO(248, 164, 76, 0.15),
              ),
              child: Row(
                children: [
                  SizedBox(width: 17.w),
                  Image.asset(
                    Constants.kPulsesIc,
                    height: 71.9.h,
                    width: 71.9.h,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    'Pulses',
                    style: kTextStyleGilroy600.copyWith(
                        fontSize: 20.sp,
                        color: const Color.fromRGBO(62, 66, 63, 1)),
                  ),
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 23.5.w,
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 23.5.w, left: 23.5.w),
          height: 248.51.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) =>
                ProductCard(productInfo: products[index]),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 23.5.w,
              );
            },
          ),
        ),
        SizedBox(height: 5.h)
      ],
    );
  }
}
