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
          padding: EdgeInsets.only(left: 20.0.w),
          child: Text(
            productcardname,
            style: kTextStyleGilroy600.copyWith(
                fontSize: 24.sp, color: const Color.fromRGBO(24, 23, 37, 1)),
          ),
        ),
        SizedBox(
          height: 248.51.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) =>
                ProductCard(productInfo: products[index]),
          ),
        )
      ],
    );
  }
}
