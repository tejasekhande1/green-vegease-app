import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/constants/constants.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kColorLiteGrey,
      ),
      child: Row(
        children: [
          SizedBox(
              height: 17.h,
              width: 17.h,
              child:
                  SvgPicture.asset(fit: BoxFit.contain, Constants.kExploreIc)),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: TextFormField(
              controller: search,
              cursorHeight: 25.h,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 20.h),
                hintText: 'Search Store',
                hintStyle: kTextStyleGilroy600.copyWith(fontSize: 14.sp),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
