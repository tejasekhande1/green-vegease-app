import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:green_vegease/features/app-ui/bottomnavigation/presentation/pages/bottomnavigation.dart';

@RoutePage()
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      bottomNavigationBar: const Bottomnavigation(),
    );
  }
}
