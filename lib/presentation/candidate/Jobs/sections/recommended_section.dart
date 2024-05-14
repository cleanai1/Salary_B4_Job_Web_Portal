import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

import '../../../../utils/constants/const_colors.dart';
import '../recommended_jobs_screen.dart';

class RecommendedForYouSection extends StatelessWidget {
  const RecommendedForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recommended For You",
            style: TextStyle(
              color: textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: textTertiary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Python Developer',
                                style: TextStyle(
                                  color: textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'SmartWorks Technologies.',
                                style: TextStyle(
                                  color: textSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                child: const Icon(
                                  Icons.share_outlined,
                                  color: textSecondary,
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 0),
                              CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                child: const Icon(
                                  Icons.bookmark_border_outlined,
                                  color: textSecondary,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            Text(
                              '1-2 years',
                              style: TextStyle(
                                color: textSecondary,
                                fontSize: 12,
                              ),
                            ),
                            VerticalDivider(
                              color: textTertiary,
                              thickness: 1,
                              endIndent: 2,
                              indent: 3,
                            ),
                            Text(
                              'Rs.600,000/-',
                              style: TextStyle(
                                color: textSecondary,
                                fontSize: 12,
                              ),
                            ),
                            VerticalDivider(
                              color: textTertiary,
                              thickness: 1,
                              endIndent: 2,
                              indent: 3,
                            ),
                            Text(
                              'Pune, India',
                              style: TextStyle(
                                color: textSecondary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Lorem ipsum dolor sit amet consectetur. Arcu nec consequat ac aliquam habitasse. Malesuada pellentesque laoreet aliquam ...',
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE9F6FF),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                '90% Match',
                                style: TextStyle(
                                  fontSize: fontSizeMd,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            '2 Weeks ago',
                            style: TextStyle(
                              color: textTertiary,
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: textTertiary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Python Developer',
                                style: TextStyle(
                                  color: textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'SmartWorks Technologies.',
                                style: TextStyle(
                                  color: textSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                child: const Icon(
                                  Icons.share_outlined,
                                  color: textSecondary,
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 0),
                              CupertinoButton(
                                padding: const EdgeInsets.all(0),
                                child: const Icon(
                                  Icons.bookmark_border_outlined,
                                  color: textSecondary,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            Text(
                              '1-2 years',
                              style: TextStyle(
                                color: textSecondary,
                                fontSize: 12,
                              ),
                            ),
                            VerticalDivider(
                              color: textTertiary,
                              thickness: 1,
                              endIndent: 2,
                              indent: 3,
                            ),
                            Text(
                              'Rs.600,000/-',
                              style: TextStyle(
                                color: textSecondary,
                                fontSize: 12,
                              ),
                            ),
                            VerticalDivider(
                              color: textTertiary,
                              thickness: 1,
                              endIndent: 2,
                              indent: 3,
                            ),
                            Text(
                              'Pune, India',
                              style: TextStyle(
                                color: textSecondary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Lorem ipsum dolor sit amet consectetur. Arcu nec consequat ac aliquam habitasse. Malesuada pellentesque laoreet aliquam ...',
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE9F6FF),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Text(
                                '90% Match',
                                style: TextStyle(
                                  fontSize: fontSizeMd,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            '2 Weeks ago',
                            style: TextStyle(
                              color: textTertiary,
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: textTertiary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: CupertinoButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) {
                        //       return const RecommendedJobsScreen();
                        //     },
                        //   ),
                        // );
                        Navigator.pushNamed(context, '/recommended_jobs');
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          fontSize: fontSizeLg,
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
          color: primaryColor,
          fontSize: 12,
        ),
      ),
    ),
  );
}
