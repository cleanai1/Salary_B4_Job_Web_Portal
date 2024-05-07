import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/constants/const_colors.dart';
import 'Jobs/jobs.dart';
import 'MyProfile/my_profile.dart';

class CandidateHomeScreen extends StatefulWidget {
  const CandidateHomeScreen({super.key});

  @override
  State<CandidateHomeScreen> createState() => _CandidateHomeScreenState();
}

class _CandidateHomeScreenState extends State<CandidateHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Column(
        children: [
          // Header Section
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // Changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/homeLogo.png', // Path to your logo image asset
                  width: 60,
                  height: 60,
                ),
                const SizedBox(width: 50),

                // Use Flexible to position TabBar next to the logo
                Flexible(
                  flex: 1, // Adjust flex value as needed
                  child: SizedBox(
                    width: 220,
                    child: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'My Profile'),
                        Tab(text: 'Jobs'),
                      ],
                      indicatorColor: primaryColor,
                      labelColor: primaryColor,
                      indicatorWeight: 2,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main Section
          const SizedBox(height: 30),
          // Wrap TabBarView in Expanded to take remaining space vertically
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                MyProfileScreen(),
                JobsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
