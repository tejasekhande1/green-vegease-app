import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/common/widgets/app_bar_widget.dart';
import 'package:green_vegease/features/dashboard/drawer/presentation/pages/drawer_widget.dart';

@RoutePage()
class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(360.w, 50.h), child: const AppBarWidget(title1: "Orders",)),
      body: Column(
        children: [],
      ),
      drawer:const CommonDrawer(page:"Orders"),
    );
  }
}