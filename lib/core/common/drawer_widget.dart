import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/text_styles.dart';

import '../theme/colors.dart';


class CommonDrawer extends StatefulWidget {
  final String page;
  const CommonDrawer({super.key, required this.page});

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

bool isDarkTheme = false;

class _CommonDrawerState extends State<CommonDrawer> {
  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    setState(() {});
  }

  String selectedValue = "English";

  String email = "Email";
  String name = "Name";
  String imageUrl = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = Theme.of(context).colorScheme.surface == Colors.grey.shade700;
    return Drawer(
      elevation: 100,
      backgroundColor: kColorPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      ),
      child: Column(
        children: [
         const Divider(
            color: kColorWhite,
          ),
          SizedBox(
            height: 30.h,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).popForced();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10.w),
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 30.w),
                  decoration: BoxDecoration(
                      color:
                          widget.page == "Home" ? Colors.white : kColorPrimary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25))),
                  child: Row(
                    children: [
                      Icon(Icons.home,
                          color: widget.page == "Home"
                              ? kColorPrimary
                              : kColorWhite),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text("Orders",
                          style: kTextStyleGilroy500.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: widget.page == "Home"
                                ? kColorPrimary
                                : kColorWhite),
                      )
                    ],
                  ),
                ),
              ),
             
            

              
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).popForced();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10.w),
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 30.w),
                  decoration: BoxDecoration(
                      color:
                          widget.page != "Prof" ? kColorPrimary : kColorWhite,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25))),
                  child: Row(
                    children: [
                      Icon(Icons.person,
                          color: widget.page == "Prof"
                              ? kColorPrimary
                              : kColorWhite),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
      "Products",
                        style: kTextStyleGilroy500.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: widget.page == "Prof"
                                ? kColorPrimary
                                : kColorWhite),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  // AutoRouter.of(context).push(const ImportantPageRoute());
                  AutoRouter.of(context).popForced();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10.w),
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 30.w),
                  decoration: BoxDecoration(
                      color: widget.page != "Imp" ? kColorPrimary : kColorWhite,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25))),
                  child: Row(
                    children: [
                      Icon(Icons.star_border_purple500_sharp,
                          color: widget.page == "Imp"
                              ? kColorPrimary
                              : kColorWhite),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text("Categories",
                         style: kTextStyleGilroy500.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: widget.page == "Imp"
                                ? kColorPrimary
                                : kColorWhite),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  // AutoRouter.of(context).push(const );
                  AutoRouter.of(context).popForced();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10.w),
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 30.w),
                  decoration: BoxDecoration(
                      color: widget.page != "Rec" ? kColorPrimary : kColorWhite,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25))),
                  child: Row(
                    children: [
                      Icon(Icons.delete_forever,
                          color: widget.page == "Rec"
                              ? kColorPrimary
                              : kColorWhite),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text("Customers",
      
                        style: kTextStyleGilroy500.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: widget.page == "Rec"
                                ? kColorPrimary
                                : kColorWhite),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).popForced();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10.w),
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 30.w),
                  decoration: BoxDecoration(
                      color: widget.page != "Set" ? kColorPrimary : kColorWhite,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25))),
                  child: Row(
                    children: [
                      Icon(Icons.settings,
                          color: widget.page == "Set"
                              ? kColorPrimary
                              : kColorWhite),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text("Settings",
                         style: kTextStyleGilroy500.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: widget.page == "Set"
                                ? kColorPrimary
                                : kColorWhite),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}