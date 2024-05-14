import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_sizes.dart';
import 'Forms/add_portfolio_form.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({super.key});

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  final List<Map<String, String>> _portfolios = [
    {
      'title': 'Finance App Code ',
      'link': 'https://github.com/01784995456/Finance-App-Code',
      'duration': 'Duration: 1 year 6 months',
    },
    {
      'title': 'Test URL ',
      'link': 'https://www.facebook.com/',
      'duration': 'Duration: 1 year 6 months',
    },
    {
      'title': 'Finance App Code ',
      'link': 'https://github.com/01784995456/Finance-App-Code',
      'duration': 'Duration: 1 year 6 months',
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
    List<Map<String, String>> displayedPortfolios =
        _isExpanded ? _portfolios : _portfolios.take(2).toList();
    return Column(
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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AddPortfolioForm();
                  },
                );
              },
            )
          ],
        ),
        const SizedBox(height: 8),
        Column(
          children: displayedPortfolios.map((portfolios) {
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
                        portfolios['title']!,
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
                      html.window.open(portfolios['link']!,
                          '_blank'); // Use the URL launcher to open the link
                    },
                    child: Text(
                      portfolios['link']!,
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
                    "${portfolios['duration']}",
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
