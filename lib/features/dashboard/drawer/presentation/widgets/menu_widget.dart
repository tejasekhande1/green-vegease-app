import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget(
      {super.key,
      required this.page,
      required this.menuName,
      required this.icon,
      this.isExpanded = false,
      this.isArrow = false});

  final String icon;
  final String page;
  final String menuName;
  final bool isArrow;
  bool isExpanded;

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w),
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 30.w),
          decoration: BoxDecoration(
              color:
                  widget.page == widget.menuName ? Colors.white : kColorPrimary,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(25),
                  bottomLeft: widget.isExpanded
                      ? const Radius.circular(0)
                      : const Radius.circular(25))),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 5.w),
                  SizedBox(
                    height: 24.h,
                    width: 24.h,
                    child: SvgPicture.asset(
                      widget.icon,
                      fit: BoxFit.fill,
                      color: widget.page == widget.menuName
                          ? kColorPrimary
                          : kColorWhite,
                    ),
                  ),
                  SizedBox(width: 30.w),
                  Text(
                    widget.menuName,
                    style: kTextStyleGilroy500.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: widget.page == widget.menuName
                            ? kColorPrimary
                            : kColorWhite),
                  ),
                  const Spacer(),
                  widget.isArrow
                      ? GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                              height: 18.h,
                              width: 18.h,
                              child: widget.isExpanded
                                  ? SvgPicture.asset(
                                      "assets/icons/down-arrow.svg",
                                      color: widget.page == widget.menuName
                                          ? kColorPrimary
                                          : kColorWhite,
                                      fit: BoxFit.contain)
                                  : SvgPicture.asset(
                                      "assets/icons/forward_arrow.svg",
                                      color: widget.page == widget.menuName
                                          ? kColorPrimary
                                          : kColorWhite,
                                      fit: BoxFit.contain)),
                        )
                      : const SizedBox(),
                  SizedBox(width: 10.w),
                ],
              ),
              AnimatedContainer(
                margin: EdgeInsets.only(left: 10.w),
                duration:
                    const Duration(milliseconds: 300), // Animation duration
                height: widget.isExpanded
                    ? widget.page == "App Users"
                        ? 180.h
                        : 290.h
                    : 0.h, // Expands or collapses based on widget.isExpanded
                color: kColorWhite, // Background color for the dropdown
                child: SingleChildScrollView(
                  // Wrap in scrollable container to avoid overflow
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: widget.page == "App Users"
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 360.w,
                              ),
                              Divider(
                                color: kColorGrey.withOpacity(0.150),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text('Users',
                                  style: kTextStyleGilroy500.copyWith(
                                      fontSize: 16.sp, color: kColorPrimary)),
                              Divider(
                                color: kColorGrey.withOpacity(0.150),
                              ),
                              SizedBox(height: 10.h),
                              Text('Delivery partner',
                                  style: kTextStyleGilroy500.copyWith(
                                      fontSize: 16.sp, color: kColorPrimary)),
                              Divider(
                                color: kColorGrey.withOpacity(0.150),
                              ),
                              SizedBox(height: 10.h),
                              Text('Delivery partner request',
                                  style: kTextStyleGilroy500.copyWith(
                                      fontSize: 16.sp, color: kColorPrimary)),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 360.w,
                              ),
                              Divider(
                                color: kColorGrey.withOpacity(0.150),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text('About us',
                                  style: kTextStyleGilroy500.copyWith(
                                      fontSize: 16.sp, color: kColorPrimary)),
                              Divider(
                                color: kColorGrey.withOpacity(0.150),
                              ),
                              SizedBox(height: 10.h),
                              Text('Terms a+nd conditions',
                                  style: kTextStyleGilroy500.copyWith(
                                      fontSize: 16.sp, color: kColorPrimary)),
                              Divider(
                                color: kColorGrey.withOpacity(0.150),
                              ),
                              SizedBox(height: 10.h),
                              Text('Privacy policy',
                                  style: kTextStyleGilroy500.copyWith(
                                      fontSize: 16.sp, color: kColorPrimary)),
                              Divider(
                                color: kColorGrey.withOpacity(0.150),
                              ),
                              SizedBox(height: 10.h),
                              Text('Cancellation policy',
                                  style: kTextStyleGilroy500.copyWith(
                                      fontSize: 16.sp, color: kColorPrimary)),
                              Divider(
                                color: kColorGrey.withOpacity(0.150),
                              ),
                              SizedBox(height: 10.h),
                              Text('Refund policy',
                                  style: kTextStyleGilroy500.copyWith(
                                      fontSize: 16.sp, color: kColorPrimary)),
                            ],
                          ), // Empty when not expanded
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
