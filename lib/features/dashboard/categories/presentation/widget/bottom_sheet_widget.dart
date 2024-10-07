import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../bloc/upload_photo_bloc/update_profile_bloc.dart';
import '../bloc/upload_photo_bloc/update_profile_event.dart';

Future<void> showOptionBottomSheet(BuildContext context) async {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            color: kColorWhite, borderRadius: BorderRadius.circular(4)),
        width: 414.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
              child: Row(
                children: [
                  Text(
                    "Upload",
                    style: kTextStyleGilroy600.copyWith(fontSize: 20.sp),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      // AutoRouter.of(context).popForced();
                    },
                    child: SvgPicture.asset(
                      "assets/icons/cross_icon.svg",
                      width: 32.w,
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              color: kColorBlack.withOpacity(0.25),
            ),
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      uploadPhoto("gal", context);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/photos_bottom_sheet.svg",
                          width: 48.w,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/icons/Line 8.svg",
                    height: 72.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      uploadPhoto("cam", context);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/cam_bottom_sheet.svg",
                          width: 48.w,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Future<void> uploadPhoto(String option, BuildContext context) async {
  try {
    String? filePath;
    String? fileName;
    if (option == "cam") {
      final ImagePicker picker = ImagePicker();
      XFile? file = await picker.pickImage(source: ImageSource.camera);

      if (file != null) {
        filePath = file.path;
        context
            .read<UpdateProfileBloc>()
            .add(ProfileImageSelect(image: filePath));
        fileName = file.name;
      }
    } else {
      final ImagePicker picker = ImagePicker();
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      context
          .read<UpdateProfileBloc>()
          .add(ProfileImageSelect(image: file!.path));
    }
    Navigator.of(context).pop();
    // AutoRouter.of(context).popForced();
    if (filePath == null || fileName == null) return;
  } catch (e) {
    debugPrint('Error uploading photo: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error uploading photo: $e')),
    );
  }
}
