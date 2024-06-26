import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/navigation_bar.dart';
import '../MyProfile/my_resume.dart';
import '../MyProfile/profile_card.dart';
import 'sections/filter_section.dart';
import 'sections/my_searches_section.dart';
import 'sections/recommended_section.dart';
import 'sections/top_companies_section.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: MyAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 20,
                      child: ProfileCard(),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      flex: 80,
                      child: Column(
                        children: [
                          FilterSection(),
                          SizedBox(height: 30),
                          MySearchesSection(),
                          SizedBox(height: 30),
                          RecommendedForYouSection(),
                          SizedBox(height: 30),
                          TopCompaniesSection(),
                          SizedBox(height: 30),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
