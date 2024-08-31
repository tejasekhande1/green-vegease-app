import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  const PasswordTextFieldWidget({super.key, required this.controller,required this.title});

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool unShowPass = true;

  Icon _toggleIcon1() {
    return Icon(
      size: 24.h,
      unShowPass ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
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
            controller: widget.controller,
            obscureText: unShowPass,
            cursorHeight: 25,
            style: kTextStyleGilroy400.copyWith(
              fontSize: 18.sp,
              color: kColorBlack,
            ),
            decoration: InputDecoration(
              hintText: widget.title,
              hintStyle: kTextStyleGilroy400.copyWith(
                color: kColorTextHint,
                fontSize: 16.sp,
              ),
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    unShowPass = !unShowPass;
                  });
                },
                child: _toggleIcon1(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
