import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  // Current index of the carousel
  int _currentIndex = 0;

  // Example list of banner images
  final List<String> banners = [
    'assets/images/banner_img.png',
    'assets/images/banner_img.png',
    'assets/images/banner_img.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Stack to overlay indicator on carousel
        Stack(
          children: [
            // Carousel Slider
            CarouselSlider(
              items: banners.map((banner) => _buildBanner(banner)).toList(),
              options: CarouselOptions(
                height: 115.h,
                viewportFraction: 0.9,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            // SmoothPageIndicator for the carousel
            Positioned(
              bottom:
                  10.h, // Position the indicator at the bottom of the carousel
              left: 0,
              right: 0,
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: banners.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8.h,
                    dotWidth: 8.h,
                    activeDotColor: Colors.green, // Customize active dot color
                    dotColor: Colors.grey, // Customize inactive dot color
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h), // Space between banner and other content if any
      ],
    );
  }

  // Helper method to build each banner
  Widget _buildBanner(String assetPath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
