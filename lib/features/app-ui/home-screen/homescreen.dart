import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/text_styles.dart';

import '../../../core/constants/constants.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
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
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(76, 79, 77, 1),
                  ),
                  Text(
                    'Pune,India',
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
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromRGBO(242, 243, 242, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search,
                      color: Color.fromRGBO(124, 124, 124, 1),
                    ),
                    Text(
                      'Search Store',
                      style: kTextStyleGilroy600.copyWith(
                        fontSize: 14,
                        color: const Color.fromRGBO(124, 124, 124, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Card(),
            ],
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 368.2.w,
      height: 114.99.h,
      child: Stack(children: [
        Image.asset(
          Constants.kCardbIC,
          fit: BoxFit.fill,
        ),
        Image.asset(Constants.kCardcIC),
        Row(
          children: [
            const SizedBox(width: 3),
            Image.asset(Constants.kCardaIC),
            const SizedBox(width: 19),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Fresh Vegetables',
                  style: kTextStyleAclonica400.copyWith(fontSize: 20),
                ),
                Text(
                  'Get Up To 40% OFF',
                  style: kTextStyleAsap500.copyWith(
                    fontSize: 14,
                    color: const Color.fromRGBO(83, 177, 117, 1),
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}

// font-family: Aclonica;
// font-size: 20px;
// font-weight: 400;
// line-height: 22.67px;
// text-align: center;
//background: rgba(83, 177, 117, 1);







