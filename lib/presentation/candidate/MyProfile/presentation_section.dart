import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salary_b4_job_web_portal/presentation/candidate/MyProfile/Forms/research_publication_form.dart';

import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_sizes.dart';
import 'Forms/add_presentation_form.dart';

class PresentationSection extends StatefulWidget {
  const PresentationSection({super.key});

  @override
  State<PresentationSection> createState() => _PresentationSectionState();
}

class _PresentationSectionState extends State<PresentationSection> {
  final List<Map<String, String>> _linksList = [
    {
      'title': 'Finance App Code ',
      'link': 'https://github.com/01784995456/Finance-App-Code',
      'duration': 'Pubhlished On : March 2024',
    },
    {
      'title': 'Test URL ',
      'link': 'https://www.facebook.com/',
      'duration': 'Pubhlished On : March 2024',
    },
    {
      'title': 'Finance App Code ',
      'link': 'https://github.com/01784995456/Finance-App-Code',
      'duration': 'Pubhlished On : March 2024',
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
    List<Map<String, String>> displayedLinks =
        _isExpanded ? _linksList : _linksList.take(2).toList();
    return Column(
      children: [
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AddPresentationForm();
                  },
                );
              },
            )
          ],
        ),
        const SizedBox(height: 8),
        Column(
          children: displayedLinks.map((links) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        links['title']!,
                        style: const TextStyle(
                          color: textSecondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
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
                              size: 14,
                            ),
                          ),
                          CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {},
                            child: const Icon(
                              CupertinoIcons.delete,
                              color: Colors.blue,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {
                      html.window.open(links['link']!,
                          '_blank'); // Use the URL launcher to open the link
                    },
                    child: Text(
                      links['link']!,
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 10,
                        decoration: TextDecoration
                            .underline, // Optionally underline the text
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${links['duration']}",
                    style: const TextStyle(
                      color: textSecondary,
                      fontSize: 10,
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
                'View More',
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
    );
  }
}
