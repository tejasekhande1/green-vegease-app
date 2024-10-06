import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/widgets/app_bar_widget.dart';
import '../widgets/delivery_section_widget.dart';
import '../widgets/over_view_section_widget.dart';
import '../widgets/partner_header_widget.dart';

@RoutePage()
class DeliveryPartnerDetailPage extends StatelessWidget {
  const DeliveryPartnerDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded delivery partner data and order list
    const String partnerName = 'Suman Tiwari';
    const String location = 'India';
    const String partnerForYears = '1';
    const String profileImageUrl =
        'https://img.freepik.com/premium-vector/silver-membership-icon-default-avatar-profile-icon-membership-icon-social-media-user-image-vector-illustration_561158-4195.jpg';
    const int deliveryCount = 12;
    final List<Map<String, String>> deliveries = [
      {
        'deliveryId': '#D23534',
        'date': 'May 25, 3:12 PM',
        'status': 'Pending',
        'price': '\$29.74'
      },
      {
        'deliveryId': '#D12512',
        'date': 'May 10, 2:00 PM',
        'status': 'Completed',
        'price': '\$23.06'
      },
      {
        'deliveryId': '#D23534',
        'date': 'April 18, 8:00 AM',
        'status': 'Completed',
        'price': '\$29.74'
      },
      {
        'deliveryId': '#D76543',
        'date': 'April 12, 8:00 AM',
        'status': 'Completed',
        'price': '\$23.06'
      },
      {
        'deliveryId': '#D51323',
        'date': 'April 10, 4:12 PM',
        'status': 'Completed',
        'price': '\$23.06'
      },
    ];
    const String address = 'Delhi, India';
    const String email = 'sumantdeliv@gmail.com';
    const String phone = '+91 9876543210';

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(360.w, 50.h),
          child: const AppBarWidget(
            title1: "Delivery Partner Information",
            isBack: true,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -------------> Header of details
              const PartnerHeaderWidget(partnerName: partnerName, location: location, partnerForYears: partnerForYears, profileImageUrl: profileImageUrl, deliveryCount: deliveryCount),
              SizedBox(height: 20.h),
              //--------------> Delivery Table
              DeliverySectionWidget(deliveries: deliveries),
              SizedBox(height: 20.h),
              //--------------> OverView Section
              const OverViewSectionWidget(address: address, email: email, phone: phone),
            ],
          ),
        ),
      ),
    );
  }
}


