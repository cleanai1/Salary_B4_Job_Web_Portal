import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/navigation_bar.dart';
import '../MyProfile/profile_card.dart';
import 'sections/filter_section.dart';
import 'sections/saved_jobs_section.dart';

class SavedJobsScreen extends StatelessWidget {
  const SavedJobsScreen({super.key});
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
                          SavedJobsSection(),
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
