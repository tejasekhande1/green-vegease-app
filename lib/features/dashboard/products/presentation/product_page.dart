import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:green_vegease/core/common/drawer_widget.dart';

@RoutePage()
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [],
      ),
      drawer: CommonDrawer(),
    );
  }
}
