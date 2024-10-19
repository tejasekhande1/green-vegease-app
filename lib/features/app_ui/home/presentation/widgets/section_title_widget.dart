import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/constants/constants.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
import 'package:green_vegease/features/app_ui/home/presentation/widgets/product_widget.dart';
import 'package:green_vegease/features/app_ui/home/presentation/widgets/search_bar_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        height: 30.h,
                        width: 26.w,
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
              BannerWidget(),
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
class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24.0.w, left: 24.w, bottom: 20.h),
      height: 115.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/banner_img.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

// SectionTitle widget
class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const SectionTitle({super.key, required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kTextStyleGilroy600.copyWith(fontSize: 24.sp, height: 1),
          ),
          Text(
            'See all',
            style: kTextStyleGilroy600.copyWith(
                height: 1, fontSize: 16.sp, color: kColorPrimary),
          ),
        ],
      ),
    );
  }
}
