import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/const_colors.dart';
import 'job_suggestion_card.dart';

class JobSuggestionSection extends StatelessWidget {
  const JobSuggestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          JobSuggestionCards(),
          SizedBox(height: 16),
          JobSuggestionCards(),
          SizedBox(height: 16),
          JobSuggestionCards(),
          SizedBox(height: 16),
          JobSuggestionCards(),
          SizedBox(height: 16),
          JobSuggestionCards(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
