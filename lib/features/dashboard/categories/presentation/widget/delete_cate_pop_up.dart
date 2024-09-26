import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_vegease/features/dashboard/categories/presentation/bloc/bloc/category_bloc.dart';
import 'package:green_vegease/features/dashboard/categories/presentation/bloc/bloc/category_event.dart';

import '../../../../../core/common/bloc/internet_bloc/internet_bloc.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/utils/utils.dart';

void showCustomDialog1(BuildContext context,String id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
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
                "assets/images/dele_acc_image.svg",
                height: 68.h,
                width: 68.w,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Delete Category?',
                  style: kTextStyleGilroy700.copyWith(fontSize: 20.sp)),
              SizedBox(height: 8.h),
              Text(
                'Are you sure you want to delete category?',
                textAlign: TextAlign.center,
                style: kTextStyleGilroy400.copyWith(
                    fontSize: 14.sp, color: kColorBlack.withOpacity(0.50)),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<InternetBloc, InternetStatus>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            context.read<CategoryBloc>().add(DeleteCategoryRequestedEvent(categoryId: id));
                            Navigator.of(context).pop();
                            // AutoRouter.of(context).popForced();
                            if (state.status == ConnectivityStatus.connected) {
                            } else {
                              Utils.showCustomSnackBar(context,
                                  "No internet connection found please check connectivity and try again");
                            }
                          },
                          child: Container(
                            width: 95.w,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            decoration: const BoxDecoration(
                              color: kColorRed,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                            ),
                            child: Center(
                              child: Text(
                                "Delete",
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
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        // AutoRouter.of(context).popForced();
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
                            "No, go back",
                            style: kTextStyleGilroy600.copyWith(
                              color: kColorPrimary,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
