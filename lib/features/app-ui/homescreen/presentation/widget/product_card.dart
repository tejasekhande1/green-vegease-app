import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/text_styles.dart';

class ProductCard extends StatelessWidget {
  final Map productInfo;
  const ProductCard({super.key, required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0.w),
      child: GestureDetector(
        child: Container(
          height: 248.51.h,
          width: 173.32.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: const Color.fromRGBO(226, 226, 226, 1),
            ),
            boxShadow: const [
              BoxShadow(
                offset: Offset(6, 12),
                color: Color.fromRGBO(0, 0, 0, 0),
              )
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 36.21.h),
              Image.asset(
                productInfo['ProductImage'],
                height: 79.43,
                width: 99.89,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 4.8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productInfo['ProductName'],
                    style: kTextStyleGilroy700.copyWith(
                      fontSize: 16.sp,
                      color: const Color.fromRGBO(24, 23, 37, 1),
                    ),
                  ),
                  Text(
                    productInfo['ProductQuantity'],
                    style: kTextStyleGilroy500.copyWith(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(124, 124, 124, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22.96.h),
              Padding(
                padding: EdgeInsets.only(left: 15.06.w, right: 15.06.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\u{20B9}${productInfo['ProductPrice']}',
                      style: kTextStyleGilroy600.copyWith(fontSize: 18.sp),
                    ),
                    Container(
                      height: 45.67.h,
                      width: 45.67.w,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(83, 177, 117, 1),
                        borderRadius: BorderRadius.circular(17.sp),
                      ),
                      child: Icon(
                        Icons.add,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        size: 30.sp,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
