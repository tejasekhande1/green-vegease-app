import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/theme/text_styles.dart';

import '../../../../../../core/common/widgets/app_bar_widget.dart';

@RoutePage()
class UserDetailPage extends StatelessWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hardcoded customer data and order list
    final String customerName = 'Randhir Kumar';
    final String location = 'India';
    final String customerForYears = '2';
    final String profileImageUrl = 'https://example.com/profile.jpg';
    final int orderCount = 5;
    final List<Map<String, String>> customerOrders = [
      {
        'orderId': '#23534D',
        'date': 'May 25, 3:12 PM',
        'status': 'Pending',
        'price': '\$29.74'
      },
      {
        'orderId': '#12512B',
        'date': 'May 10, 2:00 PM',
        'status': 'Completed',
        'price': '\$23.06'
      },
      {
        'orderId': '#23534D',
        'date': 'April 18, 8:00 AM',
        'status': 'Completed',
        'price': '\$29.74'
      },
      {
        'orderId': '#76543E',
        'date': 'April 12, 8:00 AM',
        'status': 'Completed',
        'price': '\$23.06'
      },
      {
        'orderId': '#51323C',
        'date': 'April 10, 4:12 PM',
        'status': 'Completed',
        'price': '\$23.06'
      },
    ];
    final String address = 'Panapur Langa, Hajipur, Vaishali, India';
    final String email = 'randhirkip@gmail.com';
    final String phone = '+91 8804789764';

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(360.w, 50.h),
          child: const AppBarWidget(
            title1: "User Information",
            isBack: true,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCustomerHeader(customerName, location, customerForYears,
                  profileImageUrl, orderCount),
              SizedBox(height: 20.h),
              _buildCustomerOrdersSection(customerOrders),
              SizedBox(height: 20.h),
              _buildOverviewSection(address, email, phone),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerHeader(String customerName, String location,
      String customerForYears, String profileImageUrl, int orderCount) {
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
                customerName,
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
                '$orderCount Orders • Customer for $customerForYears years',
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

  Widget _buildCustomerOrdersSection(List<Map<String, String>> customerOrders) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Customer Orders",
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
            for (var order in customerOrders) _buildTableRow(order),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      children: [
        _buildTableHeaderCell("Order"),
        _buildTableHeaderCell("Date"),
        _buildTableHeaderCell("Order Status"),
        _buildTableHeaderCell("Price"),
      ],
    );
  }

  TableRow _buildTableRow(Map<String, String> order) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(order['orderId']!),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            order['date']!,
            style: kTextStyleGilroy400.copyWith(fontSize: 12.sp),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: order['status'] == 'Completed'
                    ? kColorPrimary
                    : kColorPending,
              ),
              color: order['status'] == 'Completed'
                  ? kColorPrimary.withOpacity(0.15)
                  : kColorPending.withOpacity(0.15),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Center(
              child: Text(
                order['status']!,
                style: kTextStyleGilroy600.copyWith(
                    color: order['status'] == 'Completed'
                        ? kColorPrimary
                        : kColorPending,
                    fontSize: 12.sp),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(order['price']!),
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
            "Delete Customer",
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
