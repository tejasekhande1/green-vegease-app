import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/common/widgets/app_bar_widget.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
import 'package:green_vegease/features/dashboard/drawer/presentation/pages/drawer_widget.dart';

@RoutePage()
class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for the orders
    final List<Map<String, String>> orders = [
      {
        'customerName': 'John Doe',
        'paymentStatus': 'Paid',
        'orderStatus': 'Delivered',
        'date': '12 Sep 2024',
        'total': '\$25.99'
      },
      {
        'customerName': 'Jane Smith',
        'paymentStatus': 'Pending',
        'orderStatus': 'In Transit',
        'date': '10 Sep 2024',
        'total': '\$15.75'
      },
    ];

    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: PreferredSize(
        preferredSize: Size(360.w, 50.h),
        child: const AppBarWidget(
          title1: "Orders",
        ),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        itemBuilder: (context, index) {
          final order = orders[index];

          return Container(
            margin: EdgeInsets.only(bottom: 15.h),
            padding: EdgeInsets.all(15.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: kColorWhite,
              boxShadow: [
                BoxShadow(
                  color: kColorBlurRadius.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(color: kColorTextFieldBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow(
                  label: "Customer Name:",
                  value: order['customerName']!,
                ),
                SizedBox(height: 10.h),
                _buildRow(
                  label: "Payment Status:",
                  value: order['paymentStatus']!,
                  statusColor: order['paymentStatus'] == 'Paid'
                      ? Colors.green
                      : Colors.orange,
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildColumnDetail(
                      label: "Order Status:",
                      value: order['orderStatus']!,
                    ),
                    _buildColumnDetail(
                      label: "Date:",
                      value: order['date']!,
                    ),
                    _buildColumnDetail(
                      label: "Total:",
                      value: order['total']!,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      drawer: CommonDrawer(page: "Orders"),
    );
  }

  // Helper method to build a single row with a label and value
  Widget _buildRow({
    required String label,
    required String value,
    Color statusColor = Colors.black,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: kTextStyleGilroy400.copyWith(
            fontSize: 14.sp,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Text(
            value,
            style: kTextStyleGilroy500.copyWith(
              fontSize: 14.sp,
              color: statusColor,
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to build column details for "Order Status", "Date", "Total"
  Widget _buildColumnDetail({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: kTextStyleGilroy400.copyWith(
            fontSize: 13.sp,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: kTextStyleGilroy500.copyWith(
            fontSize: 14.sp,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
