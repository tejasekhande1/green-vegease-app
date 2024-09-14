import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/routes/app_router.dart';
import 'package:green_vegease/core/theme/text_styles.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/theme/colors.dart';
import '../widgets/menu_widget.dart';

class CommonDrawer extends StatelessWidget {
  final String page;
  const CommonDrawer({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 100,
      backgroundColor: kColorPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(35), bottomRight: Radius.circular(35)),
      ),
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
            height: 30.h,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).replace(const OrdersPageRoute());
                },
                child:
                    // -->  Orders Menu Widget
                    MenuWidget(
                      icon: Constants.kOrderIc
                      ,
                  page: page,
                  menuName: "Orders",
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).replace(const ProductPageRoute());
                },
                child:
                    // -->  Products Menu Widget
                    MenuWidget(
                      icon: Constants.kProductIc,
                  page: page,
                  menuName: "Products",
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).replace(const CategoriesPageRoute());
                },
                child:
                    // -->  Categories Menu Widget
                    MenuWidget(
                      icon: Constants.kExploreIc,
                  page: page,
                  menuName: "Categories",
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).replace(const CustomersPageRoute());
                },
                child:
                    // -->  Customers Menu Widget
                    MenuWidget(
                      icon: Constants.kPersonIc,
                  page: page,
                  menuName: "Customers",
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).popForced();
                  AutoRouter.of(context).push(const SettingsPageRoute());
                },
                child:
                    // -->  Settings Menu Widget
                    MenuWidget(
                      icon: Constants.kSettingsIc,
                  page: page,
                  menuName: "Settings",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
