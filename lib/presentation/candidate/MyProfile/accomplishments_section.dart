import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

import '../../../utils/constants/const_colors.dart';

class AccomplishmentsSection extends StatelessWidget {
  const AccomplishmentsSection({super.key});

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
                    "Accomplishments",
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
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Add your accomplishments.",
            style: TextStyle(
              color: textSecondary,
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Portfolio",
                        style: TextStyle(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeSm,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Link relevant portfolio/ work samples ( Github, Behance etc.) ",
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  CupertinoButton(
                    child: const Text(
                      'Add',
                      style: TextStyle(color: primaryColor),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 0),
              const Divider(
                color: textTertiary,
                thickness: 0,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Research Publication/ Journal entry",
                        style: TextStyle(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeSm,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Add links to your publications",
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  CupertinoButton(
                    child: const Text(
                      'Add',
                      style: TextStyle(color: primaryColor),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 0),
              const Divider(
                color: textTertiary,
                thickness: 0,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Presentation",
                        style: TextStyle(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeSm,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Add links to your presentations",
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  CupertinoButton(
                    child: const Text(
                      'Add',
                      style: TextStyle(color: primaryColor),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 0),
              const Divider(
                color: textTertiary,
                thickness: 0,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Patent",
                        style: TextStyle(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeSm,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Add links to patents you have filed",
                        style: TextStyle(
                          color: textSecondary,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  CupertinoButton(
                    child: const Text(
                      'Add',
                      style: TextStyle(color: primaryColor),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 0),
              // const Divider(
              //   color: textTertiary,
              //   thickness: 0,
              // ),
              // const SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}
