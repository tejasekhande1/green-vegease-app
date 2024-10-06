import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/constants.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class AppBarWidget extends StatelessWidget {
  final bool isBack;
  final String title1;

  const AppBarWidget({
    super.key,
    required this.title1,
    this.isBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: kColorWhite,
      automaticallyImplyLeading: !isBack,
      flexibleSpace: Column(
        children: [
          // SizedBox(
          //   height: 20.h,
          // ),
          const Spacer(),
          Row(
            children: [
              isBack
                  ? Row(
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            // AutoRouter.of(context).popForced();
                          },
                          child: SizedBox(
                            // width: 24.w,
                            child: SvgPicture.asset(
                              Constants.kBackArrowIc,
                              width: 30.h,
                              height: 30.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                      ],
                    )
                  : SizedBox(
                      width: 60.w,
                    ),
              Text(
                title1,
                style: kTextStyleGilroy600.copyWith(fontSize: 20.sp),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          )
        ],
      ),
    );
  }
}
