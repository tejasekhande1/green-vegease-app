import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/features/dashboard/products/presentation/widgets/textfield_widget.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import 'upload_photo_widget.dart';

class BottomSheetWidget extends StatefulWidget {
  final Function(Map<String, String>) onAddProduct; // Callback to pass data

  const BottomSheetWidget({super.key, required this.onAddProduct});

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String? _uploadedImageUrl; // To store the uploaded image URL

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  // Placeholder function for image upload logic
  void _pickImage() async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return const UploadPhotoWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16.w,
        right: 16.w,
        top: 16.h,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Product",
                style: kTextStyleGilroy500.copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 16.h),

              // Image Upload Avatar
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: _uploadedImageUrl != null
                          ? NetworkImage(_uploadedImageUrl!)
                          : null,
                      backgroundColor: Colors.grey[200],
                      child: _uploadedImageUrl == null
                          ? Icon(
                              Icons.person,
                              size: 50.sp,
                              color: Colors.grey,
                            )
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kColorPrimary,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              TextfieldWidget(
                  controller: _nameController, label: 'Product Name'),
              TextfieldWidget(
                  controller: _descriptionController, label: 'Description'),
              TextfieldWidget(
                  controller: _categoryController, label: 'Category'),
              TextfieldWidget(
                  controller: _quantityController, label: 'Quantity'),
              TextfieldWidget(controller: _priceController, label: 'Price'),
              SizedBox(height: 40.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: kColorPrimary,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onAddProduct({
                        "image": _uploadedImageUrl ?? '',
                        "name": _nameController.text,
                        "description": _descriptionController.text,
                        "category": _categoryController.text,
                        "quantity": _quantityController.text,
                        "price": _priceController.text,
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Center(
                    child: Text(
                      "Add Product",
                      style: kTextStyleGilroy400.copyWith(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
