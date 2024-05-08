import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/constants/const_colors.dart';

class EducationSection extends StatefulWidget {
  const EducationSection({super.key});

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {
  final List<Map<String, String>> _educations = [
    {
      'title': 'MSc. Computer Science',
      'company': 'IIT Guwahati.',
      // 'type': 'June 201 - June 2020',
      'duration': 'June 2018- June 2020 ( 2 Years) ',
    },
    {
      'title': 'BSc.Computer Science',
      'company': 'PICT',
      'duration': 'March 2022 - June 2022 (4 months)',
    },
    {
      'title': '12th',
      'company': 'MIT',
      // 'type': 'Training',
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
    List<Map<String, String>> displayedEducations =
        _isExpanded ? _educations : _educations.take(2).toList();
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
                    child: const Text(
                      '2',
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
            children: displayedEducations.map((educations) {
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
                          educations['title']!,
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
                      educations['company']!,
                      style: const TextStyle(
                        color: textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${educations['duration']}",
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
