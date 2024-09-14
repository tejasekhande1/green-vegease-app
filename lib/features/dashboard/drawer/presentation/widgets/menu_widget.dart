import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget(
      {super.key,
      required this.page,
      required this.menuName,
      required this.icon});
  final String icon;
  final String page;
  final String menuName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 30.w),
      decoration: BoxDecoration(
          color: page == menuName ? Colors.white : kColorPrimary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), bottomLeft: Radius.circular(25))),
      child: Row(
        children: [
          SizedBox(
            width: 5.w,
          ),
          SizedBox(
            height: 24.h,
            width: 24.h,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.fill,
              color: page == menuName ? kColorPrimary : kColorWhite,
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          Text(
            menuName,
            style: kTextStyleGilroy500.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: page == menuName ? kColorPrimary : kColorWhite),
          )
        ],
      ),
    );
  }
}
