import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/features/dashboard/drawer/presentation/pages/drawer_widget.dart';
import '../../../../../core/common/widgets/app_bar_widget.dart';
import '../widget/category_dialog.dart';

@RoutePage()
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(360.w, 50.h),
          child: const AppBarWidget(
            title1: "Categories",
          )),
      body: Column(
        children: [],
      ),
      drawer: const CommonDrawer(
        page: "Categories",
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColorPrimary,

        shape: const CircleBorder(),
        onPressed: () {
          showAddCategoryDialog(context, (categoryName) {
          }); // Show the dialog box
        },
        child: const Icon(
          Icons.add,
          color: kColorWhite,
        ),
      ),
    );
  }
}
