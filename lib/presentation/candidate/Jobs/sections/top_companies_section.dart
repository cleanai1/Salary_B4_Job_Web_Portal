import 'package:flutter/material.dart';

import '../../../../utils/constants/const_colors.dart';

class TopCompaniesSection extends StatelessWidget {
  const TopCompaniesSection({super.key});

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
            "Top Companies",
            style: TextStyle(
              color: textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Hiring for Python Developer",
            style: TextStyle(
              color: textTertiary,
              fontWeight: FontWeight.normal,
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/microsoftIcon.png',
                      width: 80,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Microsoft',
                      style: TextStyle(
                        color: textSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/facebookIcon.png',
                      width: 80,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Microsoft',
                      style: TextStyle(
                        color: textSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/facebookIcon.png',
                      width: 80,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Microsoft',
                      style: TextStyle(
                        color: textSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/microsoftIcon.png',
                      width: 80,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Microsoft',
                      style: TextStyle(
                        color: textSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ),
              const Expanded(
                child: Column(
                  children: [
                    Text(
                      'View All',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
