import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/common/widgets/app_bar_widget.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import '../../../../../../core/theme/colors.dart';

@RoutePage()
class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key});

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> with WidgetsBindingObserver {
  late quill.QuillController _quillController;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _quillController = quill.QuillController(
      document: quill.Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );

    // Optionally, you can track focus events here if needed
  }

  @override
  void dispose() {
    _quillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Detect if the keyboard is visible
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(360.w, 50.h),
        child: const AppBarWidget(title1: "Terms and conditions"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: kColorPrimary),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(color: kColorBlurRadius)]),
                    height: 700.h,
                    padding: const EdgeInsets.all(8.0),
                    child: quill.QuillEditor.basic(
                      controller: _quillController,
                      focusNode: _focusNode,
                    ),
                  ),
                ],
              ),
              if (isKeyboardVisible) // Show toolbar only when keyboard is visible
                Column(
                  children: [
                    SizedBox(
                      height: 400.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: quill.QuillToolbar.simple(
                          controller: _quillController,
                          configurations:
                              const quill.QuillSimpleToolbarConfigurations(
                            showBoldButton: true,
                            showFontSize: false,
                            showFontFamily: false,
                            showClipboardCut: false,
                          )),
                    ),
                  ],
                ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColorWhite,
        onPressed: () {
          // Handle saving of the document or other logic
        },
        child: const Icon(
          Icons.save,
          color: kColorPrimary,
        ),
      ),
    );
  }
}
