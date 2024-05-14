import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/navigation_bar.dart';
import '../MyProfile/my_resume.dart';
import 'sections/filter_section.dart';
import 'sections/recommended_jobs_filter.dart';
import 'sections/recommended_search_result_section.dart';

class RecommendedJobsScreen extends StatefulWidget {
  const RecommendedJobsScreen({super.key});

  @override
  State<RecommendedJobsScreen> createState() => _RecommendedJobsScreenState();
}

class _RecommendedJobsScreenState extends State<RecommendedJobsScreen> {
  final bool _isJobTypeExpanded = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: MyAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            // child: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const SizedBox(height: 20),
            //       _buildFilterSection(
            //         title: 'Job Type',
            //         isExpanded: _isJobTypeExpanded,
            //         onExpansionChanged: (expanded) {
            //           setState(() {
            //             _isJobTypeExpanded = expanded;
            //           });
            //         },
            //         children: [
            //           _buildFilterCheckbox(title: 'Full-time'),
            //           _buildFilterCheckbox(title: 'Part-time'),
            //           _buildFilterCheckbox(title: 'Contract'),
            //           _buildFilterCheckbox(title: 'Internship'),
            //         ],
            //       ),
            //       const Divider(thickness: 1, height: 30),
            //       // Add more filter sections here
            //     ],
            //   ),
            // ),

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 20,
                    child: RecommendedJobScreenFilter(),
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
                        RecommendedSearchResultSection(),
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
          )
        ],
      ),
    );
  }
}
