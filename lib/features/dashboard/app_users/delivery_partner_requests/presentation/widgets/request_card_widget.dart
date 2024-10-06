import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../delivery_partner/presentation/widgets/delivery_partner_approve_widget.dart';

class RequestCardWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String profilePicture;
  final String status;

  const RequestCardWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.profilePicture,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DeliveryPartnerApproveWidget();                              //-----------> show pop up of approve
          },
        );
      },
      child: Container(
        margin:  EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.h),
        decoration: BoxDecoration(
          color: kColorWhite.withOpacity(0.8), // White with some transparency
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: kColorBlack.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 3),                                             //-----------> Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(profilePicture),
                backgroundColor: kColorGrey,
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$firstName $lastName",
                      style: kTextStyleGilroy400.copyWith(
                        fontSize: 20.sp,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          mobileNumber,
                          style: kTextStyleGilroy400.copyWith(
                            fontSize: 16.sp,
                            color: kColorGrey,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.w, horizontal: 12.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: kColorPending),
                            color: kColorPending.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            status,
                            style: kTextStyleGilroy600.copyWith(
                                color: kColorPending, fontSize: 12.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

