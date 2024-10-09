import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:green_vegease/features/app-ui/bottomnavigation/presentation/pages/bottomnavigation.dart';

@RoutePage()
class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Favourite'),
    );
  }
}
