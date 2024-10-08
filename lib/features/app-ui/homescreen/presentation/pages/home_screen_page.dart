import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
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
    return Scaffold(
      body: Column(
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
              color: const Color.fromRGBO(242, 243, 242, 1),
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
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                List<String> keysList = products.keys.toList();
                String key = keysList[index];
                List<Map<dynamic, String>> productsValue = products[key]!;
                return (ExclusiveOffer(
                    products: productsValue, productcardname: key));
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
            ),
            label: 'shop')
      ]),
    );
  }
}

class ExclusiveOffer extends StatelessWidget {
  final List<Map<dynamic, String>> products;

  final String productcardname;
  const ExclusiveOffer(
      {super.key, required this.products, required this.productcardname});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.only(left: 20.0.w),
          child: Text(
            productcardname,
            style: kTextStyleGilroy600.copyWith(
                fontSize: 24.sp, color: const Color.fromRGBO(24, 23, 37, 1)),
          ),
        ),
        SizedBox(
          height: 248.51.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) =>
                ProductCard(productInfo: products[index]),
          ),
        )
      ],
    );
  }
}
