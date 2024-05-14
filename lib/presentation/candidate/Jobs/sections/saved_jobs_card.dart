import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_sizes.dart';

class SaveJobsCard extends StatelessWidget {
  const SaveJobsCard({super.key});

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
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/job_detail');
                      },
                      child: const Column(
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
                            Icons.bookmark,
                            color: primaryColor,
                            size: 28,
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Arcu nec consequat ac aliquam habitasse. Malesuada pellentesque laoreet aliquam aenean feugiat \nArcu nec consequat ac aliquam habitasse. Malesuada pellentesque laoreet aliquam aenean feugiat',
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '2 Weeks ago',
                      style: TextStyle(
                        color: textTertiary,
                        fontSize: 12,
                      ),
                    )
                  ],
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
                )
              ],
            ),
          ),
          const SizedBox(width: 20),
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
