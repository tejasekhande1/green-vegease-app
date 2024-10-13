import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class CustomTextfieldWidget extends StatelessWidget {
  const CustomTextfieldWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.labelText,
    this.hintText,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.errorMaxLines,
    this.isPassword = false,
    this.prefixAsset,
    this.suffixIcon,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputType = TextInputType.text,
    this.prefixIconConstraints,
    this.contentPadding,
    this.maxLines,
    this.initialValue,
    this.textAlignVertical,
    this.prefixIcon,
    this.isReadyOnly = false,
    this.inputFormatters,
    this.focusNode,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final String? labelText;
  final String? hintText;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final bool? isPassword;
  final String? prefixAsset;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final BoxConstraints? prefixIconConstraints;
  final EdgeInsets? contentPadding;
  final int? maxLines;
  final String? initialValue;
  final TextAlignVertical? textAlignVertical;
  final Widget? prefixIcon;
  final bool? isReadyOnly;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText ?? "",
            style: kTextStyleGilroy600.copyWith(
              color: kColorGrey,
              fontSize: 16.sp,
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            prefixAsset != null
                ? Container(
                    margin: EdgeInsets.only(right: 16.w),
                    height: 24.h,
                    width: 24.h,
                    child: Center(
                        child:
                            SvgPicture.asset(prefixAsset!, fit: BoxFit.fill)))
                : const SizedBox(),
            Expanded(
              child: SizedBox(
                child: TextFormField(
                  cursorHeight: 30.h,
                  focusNode: focusNode,
                  autocorrect: false,
                  enableSuggestions: false,
                  controller: controller,
                  initialValue: initialValue,
                  readOnly: isReadyOnly!,
                  keyboardType: textInputType,
                  validator: validator,
                  maxLines: maxLines,
                  cursorColor: kColorPrimary,
                  obscureText: isPassword!,
                  inputFormatters: inputFormatters,
                  style: kTextStyleGilroy500.copyWith(
                    fontSize: 16.sp,
                    color: kColorBlack,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                    prefixIconConstraints: const BoxConstraints(),
                    suffixIconConstraints: const BoxConstraints(),
                    hintText: hintText,
                    enabledBorder: UnderlineInputBorder(
                      // borderRadius: BorderRadius.all(Radius.circular(18.r)),
                      borderSide: BorderSide(
                        color: kColorGrey.withOpacity(0.2),
                      ),
                    ),
                    border: const UnderlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(18.r)),
                        borderSide: BorderSide(color: kColorGrey, width: 1.0)),
                    focusedBorder: UnderlineInputBorder(
                      // borderRadius: BorderRadius.all(Radius.circular(18.r)),
                      borderSide: BorderSide(
                        color: kColorPrimary.withOpacity(0.8),
                      ),
                    ),
                    errorBorder: const UnderlineInputBorder(
                      // borderRadius: BorderRadius.all(Radius.circular(18.r)),
                      borderSide: BorderSide(
                        color: kColorGrey,
                      ),
                    ),
                    isDense: true,
                    errorStyle: kTextStyleGilroy400.copyWith(
                      fontSize: 14.sp,
                      // color: Colors.redAccent,
                    ),
                    labelStyle: kTextStyleGilroy400.copyWith(
                      fontSize: 16.sp,
                      color: kColorBlack,
                    ),
                    hintStyle: hintStyle ??
                        kTextStyleGilroy400.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: kColorBlack,
                        ),
                    contentPadding:
                        contentPadding ?? EdgeInsets.fromLTRB(0.w, 0.h, 0, 0.h),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
