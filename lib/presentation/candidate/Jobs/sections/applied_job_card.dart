import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_sizes.dart';

class AppliedJobCard extends StatefulWidget {
  final String jobTitle;
  final String company;
  final bool isSelected;
  final VoidCallback onCardTap;

  const AppliedJobCard({
    super.key,
    required this.jobTitle,
    required this.company,
    required this.isSelected,
    required this.onCardTap,
  });

  @override
  _AppliedJobCardState createState() => _AppliedJobCardState();
}

class _AppliedJobCardState extends State<AppliedJobCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCardTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: widget.isSelected ? const Color(0xFFE9F6FF) : Colors.white,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.jobTitle,
                            style: const TextStyle(
                              color: textPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.company,
                            style: const TextStyle(
                              color: textSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
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
                ],
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
