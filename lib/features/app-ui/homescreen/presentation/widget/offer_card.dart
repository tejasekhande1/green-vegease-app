import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/constants/constants.dart';
import 'package:green_vegease/core/theme/text_styles.dart';

class OfferCard extends StatelessWidget {
  final String cardBgImage;
  final String cardimage;
  final String cardtitle;
  final String cardoffer;
  final String cardouterimage;
  const OfferCard({
    super.key,
    required this.cardouterimage,
    required this.cardBgImage,
    required this.cardimage,
    required this.cardtitle,
    required this.cardoffer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.5.w),
      child: SizedBox(
        width: 368.2.w,
        height: 114.99.h,
        child: Stack(children: [
          Image.asset(
            cardBgImage,
            width: 368.2.w,
            height: 114.99.h,
            fit: BoxFit.cover,
          ),
          Image.asset(
            cardouterimage,
            width: 368.2.w,
            height: 114.99.h,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              SizedBox(width: 7.w),
              Image.asset(
                cardimage,
                height: 105.12.h,
                width: 122.36.w,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 19.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cardtitle,
                    style: kTextStyleAclonica400.copyWith(fontSize: 20.sp),
                  ),
                  Text(
                    cardoffer,
                    style: kTextStyleAsap500.copyWith(
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(83, 177, 117, 1),
                    ),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
