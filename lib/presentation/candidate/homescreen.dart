import 'package:flutter/material.dart';

class CandidateHomeScreen extends StatelessWidget {
  const CandidateHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // Fixed header properties
            floating: true,
            pinned: true,
            snap: false,
            elevation: 0, // No shadow
            backgroundColor: Colors.white,
            leading: Image.asset(
              'assets/images/homeLogo.png', // Path to your logo image asset
              width: 60,
              height: 60,
            ),
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/jobs');
                  },
                  child: const Text('Jobs'),
                ),
                const SizedBox(width: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/my_profile');
                  },
                  child: const Text('My Profile'),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                // Your main content goes here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
