import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/common/widgets/loader_widget.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
import 'package:green_vegease/core/utils/utils.dart';
import 'package:green_vegease/features/dashboard/categories/presentation/bloc/bloc/category_bloc.dart';
import 'package:green_vegease/features/dashboard/categories/presentation/bloc/bloc/category_state.dart';
import 'package:green_vegease/features/dashboard/drawer/presentation/pages/drawer_widget.dart';
import '../../../../../core/common/widgets/app_bar_widget.dart';
import '../bloc/bloc/category_event.dart';
import '../widget/category_dialog.dart';
import '../widget/delete_cate_pop_up.dart';

@RoutePage()
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(const GetCategoryRequestedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(360.w, 50.h),
          child: const AppBarWidget(
            title1: "Categories",
          )),
      body: Stack(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoadedState) {
                // Assuming CategoryLoadedState contains a list of categories
                final categories = state.category
                    .data; // Assuming `data` holds the list of categories

                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.h),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // 3 columns
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 1, // Adjust the ratio as needed
                          ),
                          itemCount: categories!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onLongPress: () {
                                showCustomDialog1(
                                  context,
                                  categories[index].id!,
                                );
                              },
                              onTap: () {
                                showAddCategoryDialog(context,
                                    catName: categories[index].categoryName!,
                                    catId: categories[index].id,
                                    index: index,
                                    image: categories[index].image!);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 93.h,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: Image.network(
                                                  categories[index].image!)
                                              .image),
                                      color: kColorPrimary.withOpacity(0.05),
                                      border: Border.all(color: kColorPrimary),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  Text(
                                    categories[index]
                                        .categoryName!, // Replace with actual field of category
                                    textAlign: TextAlign.center,
                                    style: kTextStyleGilroy400.copyWith(
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          BlocConsumer<CategoryBloc, CategoryState>(builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const LoaderWidget();
            }
            return const SizedBox();
          }, listener: (context, state) {
            if (state is CategoryFailedState) {
              Utils.customSnackBar(context, state.error,
                 );
            }
            if (state is CategoryExceptionState) {
              Utils.customSnackBar(context, "Something went wrong",
                 );
            }
          })
        ],
      ),
      drawer: CommonDrawer(
        page: "Categories",
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColorPrimary,
        shape: const CircleBorder(),
        onPressed: () {
          showAddCategoryDialog(context); // Show the dialog box
        },
        child: const Icon(
          Icons.add,
          color: kColorWhite,
        ),
      ),
    );
  }
}
