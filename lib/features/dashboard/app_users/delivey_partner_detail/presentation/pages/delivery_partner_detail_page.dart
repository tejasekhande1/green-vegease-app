import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/theme/text_styles.dart';

import '../../../../../../core/common/widgets/app_bar_widget.dart';

@RoutePage()
class DeliveryPartnerDetailPage extends StatelessWidget {
  const DeliveryPartnerDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hardcoded delivery partner data and order list
    final String partnerName = 'Suman Tiwari';
    final String location = 'India';
    final String partnerForYears = '1';
    final String profileImageUrl =
        'https://img.freepik.com/premium-vector/silver-membership-icon-default-avatar-profile-icon-membership-icon-social-media-user-image-vector-illustration_561158-4195.jpg';
    final int deliveryCount = 12;
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
    final String address = 'Delhi, India';
    final String email = 'sumantdeliv@gmail.com';
    final String phone = '+91 9876543210';

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
              _buildPartnerHeader(partnerName, location, partnerForYears,
                  profileImageUrl, deliveryCount),
              SizedBox(height: 20.h),
              _buildDeliverySection(deliveries),
              SizedBox(height: 20.h),
              _buildOverviewSection(address, email, phone),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPartnerHeader(String partnerName, String location,
      String partnerForYears, String profileImageUrl, int deliveryCount) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 35.w,
          backgroundImage: NetworkImage(profileImageUrl),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                partnerName,
                style: kTextStyleGilroy300.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                location,
                style: kTextStyleGilroy300.copyWith(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              Text(
                '$deliveryCount Deliveries • Partner for $partnerForYears years',
                style: kTextStyleGilroy300.copyWith(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDeliverySection(List<Map<String, String>> deliveries) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deliveries",
          style: kTextStyleGilroy300.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        Table(
          border: TableBorder.all(color: Colors.grey.shade300),
          columnWidths: const {
            0: FlexColumnWidth(1.2),
            1: FlexColumnWidth(1.2),
            2: FlexColumnWidth(1.5),
            3: FlexColumnWidth(1),
          },
          children: [
            _buildTableHeader(),
            for (var delivery in deliveries) _buildTableRow(delivery),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      children: [
        _buildTableHeaderCell("Delivery"),
        _buildTableHeaderCell("Date"),
        _buildTableHeaderCell("Delivery Status"),
        _buildTableHeaderCell("Price"),
      ],
    );
  }

  TableRow _buildTableRow(Map<String, String> delivery) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(delivery['deliveryId']!),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            delivery['date']!,
            style: kTextStyleGilroy400.copyWith(fontSize: 12.sp),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: delivery['status'] == 'Completed'
                    ? kColorPrimary
                    : kColorPending,
              ),
              color: delivery['status'] == 'Completed'
                  ? kColorPrimary.withOpacity(0.15)
                  : kColorPending.withOpacity(0.15),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Center(
              child: Text(
                delivery['status']!,
                style: kTextStyleGilroy600.copyWith(
                    color: delivery['status'] == 'Completed'
                        ? kColorPrimary
                        : kColorPending,
                    fontSize: 12.sp),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(delivery['price']!),
        ),
      ],
    );
  }

  Widget _buildTableHeaderCell(String title) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        title,
        style: kTextStyleGilroy500.copyWith(fontSize: 16.sp),
      ),
    );
  }

  Widget _buildOverviewSection(String address, String email, String phone) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overview",
          style: kTextStyleGilroy300.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        _buildOverviewDetail("Address", address),
        _buildOverviewDetail("Email Address", email),
        _buildOverviewDetail("Phone", phone),
        SizedBox(height: 20.h),
        TextButton(
          onPressed: () {},
          child: Text(
            "Delete Partner",
            style: kTextStyleGilroy300.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget _buildOverviewDetail(String title, String detail) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: kTextStyleGilroy500.copyWith(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              detail,
              style: kTextStyleGilroy400.copyWith(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
