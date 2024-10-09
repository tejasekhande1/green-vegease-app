import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/routes/app_router.dart';
import 'package:green_vegease/core/theme/text_styles.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 29.sp,
      unselectedItemColor: const Color.fromRGBO(24, 23, 37, 1),
      selectedItemColor: const Color.fromRGBO(38, 159, 91, 1),
      unselectedLabelStyle: kTextStyleGilroy600.copyWith(
        color: const Color.fromRGBO(24, 23, 37, 1),
      ),
      unselectedFontSize: 12,
      // background: rgba(24, 23, 37, 1);

      items: [
        BottomNavigationBarItem(
          label: 'Shop',
          icon: IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const HomeScreenPageRoute());
              },
              icon: const Icon(Icons.storefront_outlined)),
        ),
        BottomNavigationBarItem(
          label: 'Explore',
          icon: IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const ExplorePageRoute());
              },
              icon: const Icon(Icons.manage_search)),
        ),
        BottomNavigationBarItem(
          label: 'Cart',
          icon: IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const CartPageRoute());
              },
              icon: const Icon(Icons.shopping_cart_outlined)),
        ),
        BottomNavigationBarItem(
          label: 'Favourite',
          icon: IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const FavouritePageRoute());
              },
              icon: const Icon(Icons.favorite_border)),
        ),
        BottomNavigationBarItem(
          label: 'Account',
          icon: IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const AccountPageRoute());
              },
              icon: const Icon(Icons.person_2_outlined)),
        )
      ],
      currentIndex: _selectedIndex,

      onTap: _onItemTapped,
    );
  }
}
