import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/common/widgets/app_bar_widget.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
import 'package:green_vegease/features/dashboard/drawer/presentation/pages/drawer_widget.dart';

@RoutePage()
class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: PreferredSize(
          preferredSize: Size(360.w, 50.h),
          child: const AppBarWidget(
            title1: "Orders",
          )),
      body: Column(
        children: [
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: kColorWhite,
                    boxShadow: const [
                      BoxShadow(
                          color: kColorBlurRadius,
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: Offset(0, 3))
                    ],
                    border: Border.all(color: kColorTextFieldBorder)),
                margin: EdgeInsets.only(right: 15.w, left: 15.w, top: 15.h),
                padding: EdgeInsets.all(5.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Customer Name :",
                          style: kTextStyleGilroy400.copyWith(fontSize: 15.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Payment Status :",
                          style: kTextStyleGilroy400.copyWith(fontSize: 15.sp),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Order Status :",
                              style:
                                  kTextStyleGilroy400.copyWith(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Date :",
                              style:
                                  kTextStyleGilroy400.copyWith(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Total :",
                              style:
                                  kTextStyleGilroy400.copyWith(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      drawer: CommonDrawer(page: "Orders"),
    );
  }
}
