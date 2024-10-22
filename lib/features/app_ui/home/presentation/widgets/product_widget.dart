import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/features/app_ui/home/presentation/widgets/product_card_widget.dart';
import 'section_title_widget.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: title, onSeeAll: () {}),
        Container(
          height: 300.h,
          // padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(
                    width: index == 0 ? 24.w : 0,
                  ),
                  const ProductCardWidget(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
