import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/common/bloc/internet_bloc/internet_bloc.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../../../../core/utils/utils.dart';

class DeliveryPartnerApproveWidget extends StatelessWidget {
  const DeliveryPartnerApproveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: kColorWhite,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              Constants.kApproveImg, // Replace with your asset
              height: 68.h,
              width: 68.w,
            ),
            SizedBox(
              height: 24.h,
            ),
            Text('Approve Request?',
                style: kTextStyleGilroy700.copyWith(fontSize: 20.sp)),
            SizedBox(height: 8.h),
            Text(
              'Do you want to approve this delivery partner request?',
              textAlign: TextAlign.center,
              style: kTextStyleGilroy400.copyWith(
                  fontSize: 14.sp, color: kColorBlack.withOpacity(0.50)),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // Close dialog
                    },
                    child: Container(
                      width: 95.w,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: kColorPrimary),
                      ),
                      child: Center(
                        child: Text(
                          "Reject",
                          style: kTextStyleGilroy600.copyWith(
                            color: kColorPrimary,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: BlocBuilder<InternetBloc, InternetStatus>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () async {
                          Navigator.of(context).pop(); // Close dialog
                          if (state.status == ConnectivityStatus.connected) {
                            // Handle the approval logic here
                            Utils.showCustomSnackBar(
                                context, "Delivery request approved.");
                            // Add further logic such as calling an API or updating the status.
                          } else {
                            Utils.showCustomSnackBar(
                              context,
                              "No internet connection found, please check connectivity and try again",
                            );
                          }
                        },
                        child: Container(
                          width: 95.w,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: const BoxDecoration(
                            color: kColorPrimary,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child: Center(
                            child: Text(
                              "Approve",
                              style: kTextStyleGilroy600.copyWith(
                                color: kColorWhite,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
