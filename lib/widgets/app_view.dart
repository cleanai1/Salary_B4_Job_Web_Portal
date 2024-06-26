import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  final Widget child;

  const AppView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          NavigationBar(
            destinations: const [],
          ),
          Expanded(child: child)
        ],
      ),
    );
  }
}
