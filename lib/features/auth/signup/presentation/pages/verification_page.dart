import 'dart:async';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/utils/utils.dart';

@RoutePage()
class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key, this.isResetPass = false});
  final bool isResetPass;

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController otpController = TextEditingController();
  Timer? _timer;
  int _start = 60;
  bool _isTimerCompleted = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    log("${widget.isResetPass}dfgddfgdffd");
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  void startTimer() {
    _isTimerCompleted = false;
    _start = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isTimerCompleted = true;
        });
        _timer?.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: kColorTransparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kColorWhite,
      body: Stack(children: [
        SizedBox(
          width: 414.w,
          height: 896.h,
          child: Image.asset(
            "assets/images/login_background.png",
            width: 414.w,
            height: 896.h,
            fit: BoxFit.fill,
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 35.h),
              GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).popForced();
                  },
                  child: SizedBox(
                    height: 18.h,
                    width: 10.w,
                    child: SvgPicture.asset(
                      "assets/icons/back_arrow.svg",
                      fit: BoxFit.fill,
                    ),
                  )),
              SizedBox(height: 65.h),
              Text(
                "Enter your 4-digit code",
                style: kTextStyleGilroy600.copyWith(
                  color: kColorBlack,
                  fontSize: 26.sp,
                ),
              ),
              SizedBox(height: 27.h),
              Text(
                "Code",
                style: kTextStyleGilroy600.copyWith(
                  color: kColorGrey,
                  fontSize: 16.sp,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: kColorTextFieldBorder),
                  ),
                ),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  keyboardType: TextInputType.number,
                  controller: otpController,
                  cursorHeight: 25,
                  style: kTextStyleGilroy400.copyWith(
                    fontSize: 18.sp,
                    color: kColorBlack,
                  ),
                  decoration: InputDecoration(
                    hintText: "- - - -",
                    hintStyle: kTextStyleGilroy400.copyWith(
                      color: kColorTextHint,
                      fontSize: 16.sp,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              // Timer and Resend OTP
              if (_isTimerCompleted)
                GestureDetector(
                  onTap: () {
                    startTimer(); // Restart the timer
                  },
                  child: Text(
                    "Resend Code",
                    style: kTextStyleGilroy500.copyWith(
                        fontSize: 18.sp, color: kColorPrimary),
                  ),
                )
              else
                Text(
                  "Resend OTP in 00:${_start.toString().padLeft(2, '0')}",
                  style: kTextStyleGilroy500.copyWith(
                    fontSize: 16.sp,
                    color: kColorGrey,
                  ),
                ),
            ]),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: kColorPrimary,
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (otpController.text.trim().isNotEmpty &&
              otpController.text.trim().length == 4) {
            if (!widget.isResetPass) {
              Utils.customSnackBar(
                context,
                "SignUp successful",
                backgroundColor: kColorPrimary,
              );
            }

            if (widget.isResetPass) {
              AutoRouter.of(context).push(const ResetPasswordPageRoute());
            }
          } else {
            Utils.customSnackBar(
              context,
              "Please enter valid otp",
              backgroundColor: kColorRed,
            );
          }
        },
        child: SizedBox(
          height: 18.h,
          width: 10.w,
          child: SvgPicture.asset(
            "assets/icons/forward_arrow.svg",
            fit: BoxFit.fill,
            color: kColorWhite,
          ),
        ),
      ),
    );
  }
}
