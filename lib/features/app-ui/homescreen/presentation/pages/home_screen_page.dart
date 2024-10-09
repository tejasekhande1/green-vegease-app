import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
import 'package:green_vegease/features/app-ui/bottomnavigation/presentation/pages/bottomnavigation.dart';
import 'package:green_vegease/features/app-ui/homescreen/presentation/widget/banner_card.dart';
import 'package:green_vegease/features/app-ui/homescreen/presentation/widget/glosseries.dart';
import 'package:green_vegease/features/app-ui/homescreen/presentation/widget/offer_card.dart';
import 'package:green_vegease/features/app-ui/homescreen/presentation/widget/product_card.dart';

import '../../../../../../../../core/constants/constants.dart';

@RoutePage()
class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchcontroller = TextEditingController();
    List<Map<dynamic, String>> offercradList = [
      {
        'CardBgImage': Constants.kCardbIC,
        'CardOuterImage': Constants.kCardcIC,
        'CardImage': Constants.kCardaIC,
        'Cardtitle': 'Fresh Vegetables',
        'Cardoffer': 'Get Up To 40% OFF'
      },
      {
        'CardBgImage': Constants.kCardbIC,
        'CardOuterImage': Constants.kCardcIC,
        'CardImage': Constants.kCardaIC,
        'Cardtitle': 'Fresh Vegetables',
        'Cardoffer': 'Get Up To 40% OFF'
      },
      {
        'CardBgImage': Constants.kCardbIC,
        'CardOuterImage': Constants.kCardcIC,
        'CardImage': Constants.kCardaIC,
        'Cardtitle': 'Fresh Vegetables',
        'Cardoffer': 'Get Up To 40% OFF'
      },
      {
        'CardBgImage': Constants.kCardbIC,
        'CardOuterImage': Constants.kCardcIC,
        'CardImage': Constants.kCardaIC,
        'Cardtitle': 'Fresh Vegetables',
        'Cardoffer': 'Get Up To 40% OFF'
      },
    ];
    Map<String, List<Map<dynamic, String>>> products = {
      'Exclusive Offer': [
        {
          'ProductImage': Constants.kBananaIC,
          'ProductName': 'Organic Bananas',
          'ProductQuantity': '7pcs,Priceg',
          'ProductPrice': '30',
        },
        {
          'ProductImage': Constants.kBananaIC,
          'ProductName': 'Organic Bananas',
          'ProductQuantity': '7pcs,Priceg',
          'ProductPrice': '30',
        },
        {
          'ProductImage': Constants.kBananaIC,
          'ProductName': 'Organic Bananas',
          'ProductQuantity': '7pcs,Priceg',
          'ProductPrice': '30',
        },
      ],
      'Best Selling': [
        {
          'ProductImage': Constants.kBananaIC,
          'ProductName': 'Organic Bananas',
          'ProductQuantity': '7pcs,Priceg',
          'ProductPrice': '30',
        },
        {
          'ProductImage': Constants.kBananaIC,
          'ProductName': 'Organic Bananas',
          'ProductQuantity': '7pcs,Priceg',
          'ProductPrice': '30',
        },
        {
          'ProductImage': Constants.kBananaIC,
          'ProductName': 'Organic Bananas',
          'ProductQuantity': '7pcs,Priceg',
          'ProductPrice': '30',
        },
      ],
      'Glosseries': [
        {
          'ProductImage': Constants.kBananaIC,
          'ProductName': 'Organic Bananas',
          'ProductQuantity': '7pcs,Priceg',
          'ProductPrice': '30',
        },
        {
          'ProductImage': Constants.kBananaIC,
          'ProductName': 'Organic Bananas',
          'ProductQuantity': '7pcs,Priceg',
          'ProductPrice': '30',
        },
        {
          'ProductImage': Constants.kBananaIC,
          'ProductName': 'Organic Bananas',
          'ProductQuantity': '7pcs,Priceg',
          'ProductPrice': '30',
        },
      ],
    };

    Map<dynamic, String> location = {'Location': 'Pune India'};
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 58.29.h),
          child: Image.asset(
            Constants.kHomeIc,
            width: 26.48.w,
            height: 30.8.h,
            fit: BoxFit.fill,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: const Color.fromRGBO(76, 79, 77, 1),
              size: 25.sp,
            ),
            Text(
              //get value from API
              location['Location']!,
              style: kTextStyleGilroy600.copyWith(
                color: const Color.fromRGBO(76, 79, 77, 1),
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
        Container(
          width: 364.w,
          height: 51.57.h,
          margin: EdgeInsets.only(top: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: const Color.fromRGBO(242, 243, 242, 0.7),
          ),
          child: TextField(
            controller: searchcontroller,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: const Color.fromRGBO(124, 124, 124, 1),
                  size: 36.sp,
                ),
                hintText: 'Search Store',
                hintStyle: kTextStyleGilroy600.copyWith(
                  color: const Color.fromRGBO(124, 124, 124, 1),
                  fontSize: 14.sp,
                ),
                contentPadding: EdgeInsets.all(15.h)),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 600.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 114.99.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: offercradList.length,
                    itemBuilder: (context, index) => OfferCard(
                      cardouterimage: offercradList[index]['CardOuterImage']!,
                      cardBgImage: offercradList[index]['CardBgImage']!,
                      cardimage: offercradList[index]['CardImage']!,
                      cardtitle: offercradList[index]['Cardtitle']!,
                      cardoffer: offercradList[index]['Cardoffer']!,
                    ),
                  ),
                ),
                BannerCard(
                    products: products['Exclusive Offer']!,
                    productcardname: 'Exclusive Offer'),
                BannerCard(
                    products: products['Best Selling']!,
                    productcardname: 'Best Selling'),
                Glosseries(products: products['Glosseries']!)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
