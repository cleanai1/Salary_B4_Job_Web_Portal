import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/const_colors.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Projects",
                    style: TextStyle(
                      color: textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD6FBFF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      '0',
                    ),
                  ),
                ],
              ),
              Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor),
                child: CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {}, // Toggle form visibility
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.add,
                        color: whiteColor,
                        size: 18,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Add Projects",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "Add projects that you have done in college, internships, jobs etc.",
            style: TextStyle(
              color: textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
