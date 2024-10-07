import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/common/widgets/app_bar_widget.dart';
import '../widgets/users_orders_section_widget.dart';
import '../widgets/over_view_section_widget.dart';
import '../widgets/user_header_widget.dart';

@RoutePage()
class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String customerName = 'Randhir Kumar';
    const String location = 'India';
    const String customerForYears = '2';
    const String profileImageUrl = 'https://example.com/profile.jpg';
    const int orderCount = 5;
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
    const String address = 'Panapur Langa, Hajipur, Vaishali, India';
    const String email = 'randhirkip@gmail.com';
    const String phone = '+91 8804789764';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(360.w, 50.h),
        child: const AppBarWidget(
          title1: "User Information",
          isBack: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //--------------> User information header
             const UserHeaderWidget(
                customerName: customerName,
                location: location,
                customerForYears: customerForYears,
                profileImageUrl: profileImageUrl,
                orderCount: orderCount,
              ),
              SizedBox(height: 20.h),
              //--------------> Order Section Widget
              UserOrdersSectionWidget(orders: customerOrders),
              SizedBox(height: 20.h),
              //---------------> Over View Information 
              const OverviewSectionWidget(
                  address: address, email: email, phone: phone),
            ],
          ),
        ),
      ),
    );
  }
}





