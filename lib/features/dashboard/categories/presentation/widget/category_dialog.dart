import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/features/dashboard/categories/presentation/bloc/bloc/category_bloc.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/utils/utils.dart';
import '../bloc/bloc/category_event.dart';
import '../bloc/upload_photo_bloc/update_profile_bloc.dart';
import '../bloc/upload_photo_bloc/update_profile_event.dart';
import '../bloc/upload_photo_bloc/update_profile_state.dart';
import 'bottom_sheet_widget.dart';

void showAddCategoryDialog(BuildContext context,
    {String? catName, String? catId, int? index, String? image}) {
  final TextEditingController categoryController = TextEditingController();

  if (catName != null) {
    categoryController.text = catName;
  }
  bool isNetworkImage(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  context.read<UpdateProfileBloc>().add(ProfileImageClear());
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
            color: kColorWhite, // Same white background
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Add Category',
                style: kTextStyleGilroy700.copyWith(fontSize: 20.sp),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 150.h,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<UpdateProfileBloc, UpdateProfileState>(
                          builder: (context, state) {
                            if (state is ProfileSelect) {
                              image = state.image;
                              return ClipOval(
                                child: Image.asset(
                                  state.image,
                                  height: 150
                                      .h, // Adjust height and width to keep it circular
                                  width: 150
                                      .h, // Use the same height and width for circular shape
                                  fit: BoxFit
                                      .cover, // Ensures the image covers the circular area
                                ),
                              );
                            }
                            if (image != null && isNetworkImage(image!)) {
                              return ClipOval(
                                child: Image.network(
                                  image!,
                                  height: 150
                                      .h, // Adjust height and width to keep it circular
                                  width: 150
                                      .h, // Use the same height and width for circular shape
                                  fit: BoxFit
                                      .cover, // Ensures the image covers the circular area
                                ),
                              );
                            }
                            return Container(
                              height: 150.h,
                              width: 150.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kColorGrey,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 414.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            showOptionBottomSheet(context);
                            FocusScope.of(context).unfocus();
                          },
                          child: SvgPicture.asset(
                              "assets/icons/upload_image_icon.svg",
                              width: 40.w,
                              fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                controller: categoryController,
                style: kTextStyleGilroy400.copyWith(
                    fontSize: 14.sp), // Same text style
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                  labelText: 'Category Name',
                  labelStyle: kTextStyleGilroy400.copyWith(
                    color: kColorBlack.withOpacity(0.50),
                    fontSize: 14.sp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kColorPrimary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kColorPrimary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: kColorBlack.withOpacity(0.25)),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); // Close dialog on cancel
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: kColorPrimary),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: kTextStyleGilroy600.copyWith(
                              color: kColorPrimary,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        String category = categoryController.text.trim();
                        if (category.isNotEmpty) {
                          if (await Utils.checkInternet(context) == true) {
                            catId != null
                                ? context.read<CategoryBloc>().add(
                                    UpdateCategorySubmittedEvent(
                                        index: index!,
                                        categoryId: catId,
                                        updatedCategoryName: category))
                                : context.read<CategoryBloc>().add(
                                    AddCategorySubmittedEvent(
                                        image: image, categoryName: category));
                          }
                          Navigator.of(context).pop();
                        } else {
                          Utils.customSnackBar(
                              backgroundColor: kColorRed,
                              context,
                              "Please enter a category name",
                              isFloatingButton: true);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: const BoxDecoration(
                          color: kColorPrimary,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Center(
                          child: Text(
                            "Add",
                            style: kTextStyleGilroy600.copyWith(
                              color: kColorWhite,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
