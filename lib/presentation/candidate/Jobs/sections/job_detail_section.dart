import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_sizes.dart';

class JobDetailSection extends StatelessWidget {
  const JobDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              BackButton(
                color: textSecondary,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Job Details",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeLg,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: textTertiary.withOpacity(0.1),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Job Title:',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textSecondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Python Developer',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textPrimary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Work Mode:',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textSecondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'On Site',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textPrimary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Work Experience:',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textSecondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '2-3 Years',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textPrimary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Employment type:',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textSecondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Full Time',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textPrimary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Job Location:',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textSecondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Pune',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textPrimary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Salary:',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textSecondary,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '600,000-12,00,000',
                            style: TextStyle(
                              fontSize: fontSize12,
                              color: textPrimary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Key Skills:',
                    style: TextStyle(
                      color: textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize12,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      width: 540, // Set a fixed height for the scrollable row
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics:
                            const BouncingScrollPhysics(), // Add scroll physics
                        children: [
                          _buildKeywordContainer('C Language'),
                          _buildKeywordContainer('Java'),
                          _buildKeywordContainer('Skill Number 2'),
                          _buildKeywordContainer('Skill Number 3'),
                          _buildKeywordContainer('Skill Number 4'),
                          _buildKeywordContainer('Skill Number 5'),
                          _buildKeywordContainer('Skill Number 6'),
                          _buildKeywordContainer('Skill Number 7'),
                        ],
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9F6FF),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Text(
                          '63% Match',
                          style: TextStyle(
                            fontSize: fontSizeSm,
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: textTertiary.withOpacity(0.1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Job Description:',
                  style: TextStyle(
                    color: textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize12,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'We are looking for a Python Developer to join our engineering team and help us develop and maintain various software products. Python Developer responsibilities include writing and testing code, debugging programs and integrating applications with third-party web services. To be successful in this role, you should have experience using server-side logic and work well in a team. Ultimately, you’ll build highly responsive web applications that align with our business needs.',
                  style: TextStyle(
                    color: textSecondary,
                    fontWeight: FontWeight.normal,
                    fontSize: fontSize12,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Responsibilities:',
                  style: TextStyle(
                    color: textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize12,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildResponsibilityItem('Write effective, scalable code'),
                    _buildResponsibilityItem(
                        'Develop back-end components to improve responsiveness and overall performance'),
                    _buildResponsibilityItem(
                        'Integrate user-facing elements into applications'),
                    _buildResponsibilityItem('Test and debug programs'),
                    _buildResponsibilityItem(
                        'Improve functionality of existing systems'),
                    _buildResponsibilityItem(
                        'Implement security and data protection solutions'),
                    _buildResponsibilityItem(
                        'Assess and prioritize feature requests'),
                    _buildResponsibilityItem(
                        'Coordinate with internal teams to understand user requirements and provide technical solutions'),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Requirements and skills:',
                  style: TextStyle(
                    color: textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize12,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildResponsibilityItem(
                        'Work experience as a Python Developer'),
                    _buildResponsibilityItem(
                        'Expertise in at least one popular Python framework (like Django, Flask or Pyramid)'),
                    _buildResponsibilityItem(
                        'Knowledge of object-relational mapping (ORM)'),
                    _buildResponsibilityItem(
                        'Familiarity with front-end technologies (like JavaScript and HTML5)'),
                    _buildResponsibilityItem('Team spirit'),
                    _buildResponsibilityItem('Good problem-solving skills'),
                    _buildResponsibilityItem(
                        'BSc in Computer Science, Engineering or relevant field'),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Company Details:',
                  style: TextStyle(
                    color: textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize12,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'We are looking for a Python Developer to join our engineering team and help us develop and maintain various software products. ',
                  style: TextStyle(
                    color: textSecondary,
                    fontWeight: FontWeight.normal,
                    fontSize: fontSize12,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 0,
                      ),
                      decoration: const BoxDecoration(),
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        child: const Text(
                          'Remove',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: fontSizeSm,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        child: const Text(
                          'Apply Now',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: fontSizeSm,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0.5,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsibilityItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const Icon(Icons.check_circle, color: Colors.green),
          Container(
            width: 3,
            height: 3,
            decoration: BoxDecoration(
              color: textTertiary,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: textSecondary,
                fontSize: fontSize12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper method to build a keyword container
Widget _buildKeywordContainer(String keyword) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    margin: const EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: primaryColor,
      ),
    ),
    child: Center(
      child: Text(
        keyword,
        style: const TextStyle(
          color: textSecondary,
          fontSize: 12,
        ),
      ),
    ),
  );
}
