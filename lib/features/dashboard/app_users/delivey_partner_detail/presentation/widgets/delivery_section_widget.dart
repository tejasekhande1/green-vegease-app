import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/text_styles.dart';
import 'table_header_cell_widget.dart';

class DeliverySectionWidget extends StatelessWidget {
  const DeliverySectionWidget({
    super.key,
    required this.deliveries,
  });

  final List<Map<String, String>> deliveries;

  @override
  Widget build(BuildContext context) {
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
            const TableRow(
              children: [
                //------------------> Table headers

                TableHeaderCellWidget(title: "Delivery"),
                TableHeaderCellWidget(title: "Date"),
                TableHeaderCellWidget(title: "Delivery Status"),
                TableHeaderCellWidget(title: "Price"),
              ],
            ),
            for (var delivery in deliveries)
              TableRow(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.h),
                    child: Text(
                      delivery['deliveryId']!,
                      style: kTextStyleGilroy600.copyWith(fontSize: 12.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.h),
                    child: Text(
                      delivery['date']!,
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
                    padding: EdgeInsets.all(8.0.h),
                    child: Text(
                      delivery['price']!,
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
