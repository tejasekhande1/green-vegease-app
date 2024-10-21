import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/constants/constants.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
import 'package:green_vegease/features/app_ui/home/presentation/widgets/product_widget.dart';
import 'package:green_vegease/features/app_ui/home/presentation/widgets/search_bar_widget.dart';

import '../widgets/banner_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 35.h,
                        width: 35.h,
                        child: SvgPicture.asset(
                          Constants.kColoredCarrotIc,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0.h),
                            child: SizedBox(
                                height: 24.h,
                                width: 24.h,
                                child: SvgPicture.asset(
                                    fit: BoxFit.contain,
                                    Constants.kLocationIc)),
                          ),
                          Text('Dhaka, Banassre',
                              style: kTextStyleGilroy600.copyWith(
                                  fontSize: 18.sp, color: kColorLocBlack)),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SearchBarWidget(),
              const BannerWidget(),
              const ProductWidget(
                title: "Exclusive Offer",
              ),
              const ProductWidget(
                title: "Best Selling",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// BannerWidget

