import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/utils/utils.dart';

void showAddCategoryDialog(
    BuildContext context, Function(String) onAddCategory) {
  final TextEditingController categoryController = TextEditingController();

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
                      onTap: () {
                        String category = categoryController.text.trim();
                        if (category.isNotEmpty) {
                          onAddCategory(category); // Pass category back
                          Navigator.of(context).pop();
                        } else {
                          Utils.showCustomSnackBar(
                              context, "Please enter a category name");
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
