import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/const_colors.dart';
import 'saved_jobs_card.dart';

class SavedJobsSection extends StatelessWidget {
  const SavedJobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Jobs saved by you",
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
                  '4',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const SaveJobsCard(),
          const SizedBox(height: 16),
          const SaveJobsCard(),
          const SizedBox(height: 16),
          const SaveJobsCard(),
          const SizedBox(height: 16),
          const SaveJobsCard(),
        ],
      ),
    );
  }
}
