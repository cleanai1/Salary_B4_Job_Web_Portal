import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_sizes.dart';
import 'search_result_list.dart';

class RecommendedSearchResultSection extends StatelessWidget {
  const RecommendedSearchResultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Results",
                style: TextStyle(
                  color: textSecondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFD6FBFF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  '12',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const SearchJobResultList(),
          const SizedBox(height: 16),
          const SearchJobResultList(),
          const SizedBox(height: 16),
          const SearchJobResultList(),
          const SizedBox(height: 16),
          const SearchJobResultList(),
          const SizedBox(height: 16),
          const SearchJobResultList(),
          const SizedBox(height: 16),
          const SearchJobResultList(),
          const SizedBox(height: 16),
          const SearchJobResultList(),
          const SizedBox(height: 16),
          const SearchJobResultList(),
        ],
      ),
    );
  }
}
