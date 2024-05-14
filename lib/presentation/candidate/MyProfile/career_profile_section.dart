import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';
import '../../../utils/constants/const_colors.dart';
import 'Forms/career_profile_form.dart';

class CareerProfileSection extends StatelessWidget {
  const CareerProfileSection({super.key});

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
              const Row(
                children: [
                  Text(
                    "Career Profile",
                    style: TextStyle(
                      color: textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFD6FBFF),
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   child: const Text(
                  //     '0',
                  //   ),
                  // ),
                ],
              ),
              CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CareerProfileForm();
                    },
                  );
                },
                child: const Icon(
                  FontAwesomeIcons.penToSquare,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Industry',
                      style: TextStyle(
                        fontSize: fontSizeSm,
                        color: textSecondary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'IT',
                      style: TextStyle(
                        fontSize: fontSizeMd,
                        color: textPrimary,
                        fontWeight: FontWeight.bold,
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
                      'Department',
                      style: TextStyle(
                        fontSize: fontSizeSm,
                        color: textSecondary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Software Development',
                      style: TextStyle(
                        fontSize: fontSizeMd,
                        color: textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Role Category',
                      style: TextStyle(
                        fontSize: fontSizeSm,
                        color: textSecondary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Software Development',
                      style: TextStyle(
                        fontSize: fontSizeMd,
                        color: textPrimary,
                        fontWeight: FontWeight.bold,
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
                      'Job Role',
                      style: TextStyle(
                        fontSize: fontSizeSm,
                        color: textSecondary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Python Developer',
                      style: TextStyle(
                        fontSize: fontSizeMd,
                        color: textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Desired Job Type',
                      style: TextStyle(
                        fontSize: fontSizeSm,
                        color: textSecondary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Full Time',
                      style: TextStyle(
                        fontSize: fontSizeMd,
                        color: textPrimary,
                        fontWeight: FontWeight.bold,
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
                      'Desired Employment Model',
                      style: TextStyle(
                        fontSize: fontSizeSm,
                        color: textSecondary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Remote',
                      style: TextStyle(
                        fontSize: fontSizeMd,
                        color: textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expected CTC',
                      style: TextStyle(
                        fontSize: fontSizeSm,
                        color: textSecondary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Rs. 12,00,000/-',
                      style: TextStyle(
                        fontSize: fontSizeMd,
                        color: textPrimary,
                        fontWeight: FontWeight.bold,
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
                      'Preferred Locations',
                      style: TextStyle(
                        fontSize: fontSizeSm,
                        color: textSecondary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Pune, Bengaluru, Hyderabad',
                      style: TextStyle(
                        fontSize: fontSizeMd,
                        color: textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
