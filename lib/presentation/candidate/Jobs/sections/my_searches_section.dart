import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../utils/constants/const_colors.dart';

class MySearchesSection extends StatelessWidget {
  const MySearchesSection({super.key});

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
            "My Searches",
            style: TextStyle(
              color: textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "View previous searches",
            style: TextStyle(
              color: textTertiary,
              fontWeight: FontWeight.normal,
              fontSize: 14,
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
                    color: Colors.grey.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Keywords',
                        style: TextStyle(
                          color: textSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 30,
                        width: 300, // Set a fixed height for the scrollable row
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics:
                              const BouncingScrollPhysics(), // Add scroll physics
                          children: [
                            _buildKeywordContainer('C Language'),
                            _buildKeywordContainer('Java'),
                            _buildKeywordContainer('C++'),
                            _buildKeywordContainer('Python'),
                            _buildKeywordContainer('Dot.net'),
                            // Add more keyword containers as needed
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Experience',
                        style: TextStyle(
                          color: textSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '5 Years',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Expected CTC',
                        style: TextStyle(
                          color: textSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '7 LPA ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Keywords',
                        style: TextStyle(
                          color: textSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 30,
                        width: 300, // Set a fixed height for the scrollable row
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics:
                              const BouncingScrollPhysics(), // Add scroll physics
                          children: [
                            _buildKeywordContainer('C Language'),
                            _buildKeywordContainer('Java'),

                            // Add more keyword containers as needed
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Experience',
                        style: TextStyle(
                          color: textSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '5 Years',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Expected CTC',
                        style: TextStyle(
                          color: textSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '7 LPA ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Keywords',
                        style: TextStyle(
                          color: textSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 30,
                        width: 300, // Set a fixed height for the scrollable row
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics:
                              const BouncingScrollPhysics(), // Add scroll physics
                          children: [
                            _buildKeywordContainer('C Language'),
                            _buildKeywordContainer('Java'),
                            _buildKeywordContainer('C++'),

                            // Add more keyword containers as needed
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Experience',
                        style: TextStyle(
                          color: textSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '5 Years',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Expected CTC',
                        style: TextStyle(
                          color: textSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '7 LPA ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
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

// Helper method to build a keyword container
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
          color: primaryColor,
          fontSize: 12,
        ),
      ),
    ),
  );
}
