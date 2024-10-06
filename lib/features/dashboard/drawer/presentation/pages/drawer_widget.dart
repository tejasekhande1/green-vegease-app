import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/routes/app_router.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/theme/colors.dart';
import '../widgets/logout_pop_up.dart';
import '../widgets/menu_widget.dart';

class CommonDrawer extends StatefulWidget {
  String page;
  CommonDrawer({super.key, required this.page});

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  bool isUserExpand = false;
  bool isSettingExpand = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320.w,
      elevation: 90,
      backgroundColor: kColorPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Dashboard",
                  style: kTextStyleGilroy800.copyWith(
                      fontSize: 28.sp, color: kColorGetWhite),
                ),
              ],
            ),
            const Divider(
              color: kColorWhite,
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).popForced();
                    AutoRouter.of(context).replace(const OrdersPageRoute());

                    setState(() {
                      isUserExpand = false;
                      isSettingExpand = false;
                      widget.page = 'Orders';
                    });
                  },
                  child:
                      // -->  Orders Menu Widget
                      MenuWidget(
                    isExpanded: false,
                    icon: Constants.kOrdersIc,
                    page: widget.page,
                    menuName: "Orders",
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).replace(const ProductPageRoute());
                    AutoRouter.of(context).popForced();
                    setState(() {
                      widget.page = 'Products';
                      isUserExpand = false;
                      isSettingExpand = false;
                    });
                  },
                  child:
                      // -->  Products Menu Widget
                      MenuWidget(
                    isExpanded: false,
                    icon: Constants.kProductIc,
                    page: widget.page,
                    menuName: "Products",
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).replace(const CategoriesPageRoute());
                    AutoRouter.of(context).popForced();
                    setState(() {
                      widget.page = 'Categories';
                    });
                  },
                  child:
                      // -->  Categories Menu Widget
                      MenuWidget(
                    isExpanded: false,
                    icon: Constants.kCategoryIc,
                    page: widget.page,
                    menuName: "Categories",
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.page = 'App Users';
                      isUserExpand = !isUserExpand;
                      isSettingExpand = false;
                    });
                  },
                  child:
                      // -->  Customers Menu Widget

                      MenuWidget(
                    isArrow: true,
                    isExpanded: isUserExpand,
                    icon: Constants.kPersonIc,
                    page: widget.page,
                    menuName: "App Users",
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    // AutoRouter.of(context).popForced();
                    // AutoRouter.of(context).push(const SettingsPageRoute());
                    setState(() {
                      widget.page = 'General Settings';
                      isSettingExpand = !isSettingExpand;
                      isUserExpand = false;
                    });
                  },
                  child:
                      // -->  Settings Menu Widget

                      MenuWidget(
                    isArrow: true,
                    isExpanded: isSettingExpand,
                    icon: Constants.kSettingsIc,
                    page: widget.page,
                    menuName: "General Settings",
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    showCustomDialog(context);
                    setState(() {
                      widget.page = 'Logout';
                      isUserExpand = false;
                      isSettingExpand = false;
                    });
                  },
                  child:
                      // -->  Settings Menu Widget
                      MenuWidget(
                    isExpanded: false,
                    icon: Constants.kLogoutIc,
                    page: widget.page,
                    menuName: "Logout",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
