import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/constants/constants.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/theme/text_styles.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                      width: 26.w,
                      child: SvgPicture.asset(
                        Constants.kColoredCarrotIc,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.location_on, color: Colors.black),
                        ),
                        Text('Dhaka, Banassre',
                            style: kTextStyleGilroy600.copyWith(
                                fontSize: 18.sp, color: kColorLocBlack)),
                      ],
                    )
                  ],
                )
              ],
            ),
            SearchBar(),
            BannerWidget(),
            SectionTitle(title: 'Exclusive Offer', onSeeAll: () {}),
            ProductGrid(),
            SectionTitle(title: 'Best Selling', onSeeAll: () {}),
            ProductGrid(),
            SectionTitle(title: 'Groceries', onSeeAll: () {}),
            CategoryGrid(),
          ],
        ),
      ),
    );
  }
}

// SearchBar widget
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kColorLiteGrey,
      ),
      child: Row(
        children: [
          Icon(Icons.search),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: TextFormField(
              cursorHeight: 25.h,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 20.h),
                hintText: 'Search Store',
                hintStyle: kTextStyleGilroy600.copyWith(fontSize: 14.sp),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// BannerWidget
class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0.w),
      height: 115.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/banner_img.png'),
          fit: BoxFit.fill,
        ),
      ),
      // child: Center(
      // child: Text(
      //   'Fresh Vegetables\nGet Up To 40% OFF',
      //   textAlign: TextAlign.center,
      //   style: kTextStyleGilroy400.copyWith(
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,
      //   ),
      // ),
      // ),
    );
  }
}

// SectionTitle widget
class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  SectionTitle({required this.title, required this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kTextStyleGilroy600.copyWith(
              fontSize: 24.sp,
            ),
          ),
          TextButton(
            onPressed: onSeeAll,
            child: Text(
              'See all',
              style: kTextStyleGilroy600.copyWith(
                fontSize: 16.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ProductGrid widget
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return IntrinsicHeight(child: ProductCard());
        },
      ),
    );
  }
}

// ProductCard widget
class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage('assets/product.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Organic Bananas',
            style: kTextStyleGilroy400.copyWith(
                fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            '7pcs, Priceg',
            style:
                kTextStyleGilroy400.copyWith(fontSize: 12, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$4.99',
                style: kTextStyleGilroy400.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add, color: Colors.green),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// CategoryGrid widget
class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return CategoryCard();
        },
      ),
    );
  }
}

// CategoryCard widget
class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Pulses',
              style: kTextStyleGilroy400.copyWith(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
            'assets/pulses.png',
            width: 40,
          )
        ],
      ),
    );
  }
}

// CustomBottomNavigationBar widget
class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.store, color: Colors.green),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
    );
  }
}
