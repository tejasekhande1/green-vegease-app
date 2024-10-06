import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/text_styles.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../delivey_partner_detail/presentation/widgets/table_header_cell_widget.dart';

class UserOrdersSectionWidget extends StatelessWidget {
  final List<Map<String, String>> orders;

  const UserOrdersSectionWidget({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
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
            const TableRow(
              children: [
                TableHeaderCellWidget(title: "Order"),
                TableHeaderCellWidget(title: "Date"),
                TableHeaderCellWidget(title: "Order Status"),
                TableHeaderCellWidget(title: "Price"),
              ],
            ),
            for (var order in orders)
              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.h),
                    child: Text(
                      order['orderId']!,
                      style: kTextStyleGilroy600.copyWith(fontSize: 12.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.h),
                    child: Text(
                      order['date']!,
                      style: kTextStyleGilroy400.copyWith(fontSize: 12.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0.h, vertical: 4.0.w),
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
                    padding: EdgeInsets.all(8.0.h),
                    child: Text(
                      order['price']!,
                      style: kTextStyleGilroy600.copyWith(fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
