// import 'package:auto_route/annotations.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:green_vegease/core/common/widgets/button_widget.dart';
// import 'package:green_vegease/core/theme/colors.dart';

// @RoutePage()
// class SingupPage extends StatefulWidget {
//   const SingupPage({super.key});

//   @override
//   State<SingupPage> createState() => _SingupPageState();
// }

// class _SingupPageState extends State<SingupPage> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool unShowPass = true;
//   Icon toggleIcon() {
//     return Icon(
//         unShowPass ? Icons.remove_red_eye_outlined : Icons.remove_red_eye);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: kColorWhite,
//         body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Image.asset(
//                 "assets/images/login_background.png",
//                 width: 414.w,
//                 height: 896.h,
//                 fit: BoxFit.fill,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(25.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 77.25.h,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SvgPicture.asset("assets/images/colored_carrot.svg"),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 100.h,
//                     ),
//                     Text(
//                       "Sign Up",
//                       style: TextStyle(
//                           color: kColorBlack,
//                           fontFamily: "Gilroy",
//                           fontWeight: FontWeight.w600,
//                           fontSize: 26.sp),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     Text(
//                       "Enter your credentials to continue",
//                       style: TextStyle(
//                           color: kColorGrey,
//                           fontFamily: "Gilroy",
//                           fontWeight: FontWeight.w400,
//                           fontSize: 16.sp),
//                     ),
//                     SizedBox(
//                       height: 24.h,
//                     ),
//                     Text(
//                       "Username",
//                       style: TextStyle(
//                           color: kColorGrey,
//                           fontFamily: "Gilroy",
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16.sp),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                           border: Border(
//                               bottom:
//                                   BorderSide(color: kColorTextFieldBorder))),
//                       child: TextFormField(
//                         controller: usernameController,
//                         cursorHeight: 25,
//                         style: TextStyle(
//                             fontSize: 18.sp,
//                             fontFamily: "Gilroy",
//                             fontWeight: FontWeight.w400,
//                             color: kColorBlack),
//                         decoration: InputDecoration(
//                           hintText: "Enter username",
//                           hintStyle: TextStyle(
//                               color: kColorTextHint,
//                               fontFamily: "Gilroy",
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16.sp),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30.h,
//                     ),
//                     Text(
//                       "Email",
//                       style: TextStyle(
//                           color: kColorGrey,
//                           fontFamily: "Gilroy",
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16.sp),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                           border: Border(
//                               bottom:
//                                   BorderSide(color: kColorTextFieldBorder))),
//                       child: TextFormField(
//                         controller: emailController,
//                         cursorHeight: 25,
//                         style: TextStyle(
//                             fontSize: 18.sp,
//                             fontFamily: "Gilroy",
//                             fontWeight: FontWeight.w400,
//                             color: kColorBlack),
//                         decoration: InputDecoration(
//                           hintText: "Enter email id",
//                           hintStyle: TextStyle(
//                               color: kColorTextHint,
//                               fontFamily: "Gilroy",
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16.sp),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     Text(
//                       "Password",
//                       style: TextStyle(
//                           color: kColorGrey,
//                           fontFamily: "Gilroy",
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16.sp),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                           border: Border(
//                               bottom:
//                                   BorderSide(color: kColorTextFieldBorder))),
//                       child: TextFormField(
//                         controller: passwordController,
//                         obscureText: unShowPass,
//                         obscuringCharacter: ".",
//                         cursorHeight: 25,
//                         style: TextStyle(
//                             fontSize: 18.sp,
//                             fontFamily: "Gilroy",
//                             fontWeight: FontWeight.w400,
//                             color: kColorBlack),
//                         decoration: InputDecoration(
//                           hintText: "Enter password",
//                           hintStyle: TextStyle(
//                               color: kColorTextHint,
//                               fontFamily: "Gilroy",
//                               fontWeight: FontWeight.w400,
//                               fontSize: 16.sp),
//                           border: InputBorder.none,
//                           suffixIcon: GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   unShowPass = !unShowPass;
//                                 });
//                                 toggleIcon();
//                               },
//                               child: toggleIcon()),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Expanded(
//                           child: RichText(
//                             text: TextSpan(
//                               text: "By continuing you agree to our ",
//                               style: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontFamily: "Gilroy",
//                                 fontWeight: FontWeight.w400,
//                                 color: kColorBlack,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: "Terms of Service",
//                                   style: TextStyle(
//                                     fontSize: 16.sp,
//                                     color: kColorPrimary,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: " and ",
//                                   style: TextStyle(
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: "Privacy Policy",
//                                   style: TextStyle(
//                                     fontSize: 16.sp,
//                                     color: kColorPrimary,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 30.h,
//                     ),
//                     GestureDetector(
//                         onTap: () {},
//                         child: const ButtonWidget(title: "Sign Up")),
//                     SizedBox(
//                       height: 25.h,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Already have an account? ",
//                           style: TextStyle(
//                               fontSize: 14.sp,
//                               fontFamily: "Gilroy",
//                               fontWeight: FontWeight.w600,
//                               color: kColorBlack),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             AutoRouter.of(context).back();
//                           },
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                                 fontSize: 14.sp,
//                                 fontFamily: "Gilroy",
//                                 fontWeight: FontWeight.w600,
//                                 color: kColorPrimary),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }
