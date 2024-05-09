import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';

import 'Forms/add_employment_form.dart';

class EmploymentSection extends StatefulWidget {
  const EmploymentSection({super.key});

  @override
  _EmploymentSectionState createState() => _EmploymentSectionState();
}

class _EmploymentSectionState extends State<EmploymentSection> {
  final List<Map<String, String>> _employments = [
    {
      'title': 'Dev Ops Engineer',
      'company': 'Softex Pvt. Ltd.',
      'type': 'Full Time',
      'duration': 'June 2022 - Sept 2023 (1 Year 3 months)',
    },
    {
      'title': 'Fullstack Developer',
      'company': 'Azure',
      'type': 'Internship',
      'duration': 'March 2022 - June 2022 (3 months)',
    },
    {
      'title': 'Web Developer',
      'company': 'Facebook',
      'type': 'Training',
      'duration': 'March 2022 - June 2022 (3 months)',
    },
  ];

  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> displayedEmployments =
        _isExpanded ? _employments : _employments.take(2).toList();

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
                    "Employment",
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
                    child: Text(
                      _employments.length.toString(),
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddEmploymentForm();
                      },
                    );
                  }, // Toggle form visibility
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.add_circled,
                        color: whiteColor,
                        size: 18,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Add Employment",
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
          const SizedBox(height: 20),
          Column(
            children: displayedEmployments.map((employment) {
              return Container(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          employment['title']!,
                          style: const TextStyle(
                            color: textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            CupertinoButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              child: const Icon(
                                FontAwesomeIcons.penToSquare,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                            CupertinoButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              child: const Icon(
                                CupertinoIcons.delete,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      employment['company']!,
                      style: const TextStyle(
                        color: textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${employment['type']}  ${employment['duration']}",
                      style: const TextStyle(
                        color: textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          if (!_isExpanded) // Display the "Close" button at the bottom center
            Center(
              child: TextButton(
                onPressed: _toggleExpanded,
                child: const Text(
                  'View More Skills',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
          if (_isExpanded) // Display the "Close" button at the bottom center
            Center(
              child: TextButton(
                onPressed: _toggleExpanded,
                child: const Text(
                  'close',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
