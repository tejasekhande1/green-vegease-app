import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:green_vegease/features/app-ui/bottomnavigation/presentation/pages/bottomnavigation.dart';

@RoutePage()
class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      bottomNavigationBar: const Bottomnavigation(),
    );
  }
}
