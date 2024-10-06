import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/common/widgets/app_bar_widget.dart';
import 'package:green_vegease/features/dashboard/drawer/presentation/pages/drawer_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../widgets/bottomsheet_widget.dart';

@RoutePage()
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Map<String, String>> products = [
    {
      "image": "https://via.placeholder.com/150",
      "name": "Product 1",
      "description": "This is the description for Product 1",
      "category": "Vegetables",
      "quantity": "1",
      "price": "29.99"
    },
    {
      "image": "https://via.placeholder.com/150",
      "name": "Product 2",
      "description": "This is the description for Product 2",
      "category": "Fruits",
      "quantity": "2",
      "price": "19.99"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: PreferredSize(
        preferredSize: Size(360.w, 50.h),
        child: const AppBarWidget(
          title1: "Products",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
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
                        offset: Offset(0, 3),
                      ),
                    ],
                    border: Border.all(color: kColorTextFieldBorder),
                  ),
                  margin: EdgeInsets.only(right: 15.w, left: 15.w, top: 15.h),
                  padding: EdgeInsets.all(10.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image
                      Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kColorBackground,
                          image: DecorationImage(
                            image: NetworkImage(products[index]['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Name
                            Text(
                              products[index]['name']!,
                              style: kTextStyleGilroy400.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            // Category
                            Text(
                              "Category: ${products[index]['category']!}",
                              style: kTextStyleGilroy400.copyWith(
                                fontSize: 14.sp,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            // Product Description
                            Text(
                              products[index]['description']!,
                              style: kTextStyleGilroy400.copyWith(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Quantity
                                Text(
                                  "Qty: ${products[index]['quantity']}",
                                  style: kTextStyleGilroy400.copyWith(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                // Price
                                Text(
                                  "\$${products[index]['price']}",
                                  style: kTextStyleGilroy400.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColorPrimary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return BottomSheetWidget(
                onAddProduct: (product) {
                  setState(() {
                    products.add(product); // Adds product to the list
                  });
                },
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: kColorWhite,
        ),
      ),
      drawer: CommonDrawer(
        page: "Products",
      ),
    );
  }
}
