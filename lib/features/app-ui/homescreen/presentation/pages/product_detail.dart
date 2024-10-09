import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
