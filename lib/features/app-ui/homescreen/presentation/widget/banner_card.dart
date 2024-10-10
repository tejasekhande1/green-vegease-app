import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
import 'package:green_vegease/features/app-ui/homescreen/presentation/widget/product_card.dart';

class BannerCard extends StatelessWidget {
  final List<Map<dynamic, String>> products;

  final String productcardname;
  const BannerCard(
      {super.key, required this.products, required this.productcardname});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.only(left: 23.5.w),
          child: Text(
            productcardname,
            style: kTextStyleGilroy600.copyWith(
                fontSize: 24.sp, color: const Color.fromRGBO(24, 23, 37, 1)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 23.5.w, right: 23.5.w),
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
        )
      ],
    );
  }
}
