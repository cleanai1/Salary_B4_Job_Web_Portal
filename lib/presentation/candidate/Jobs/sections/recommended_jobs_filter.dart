import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/const_colors.dart';

class RecommendedJobScreenFilter extends StatefulWidget {
  const RecommendedJobScreenFilter({super.key});

  @override
  State<RecommendedJobScreenFilter> createState() =>
      _RecommendedJobScreenFilterState();
}

class _RecommendedJobScreenFilterState
    extends State<RecommendedJobScreenFilter> {
  List<String> selectedCheckboxes = [];
  bool _isJobTypeExpanded = true; // Default to expanded for Job Type
  bool _isExperienceExpanded = true; // Default to collapsed for Experience
  bool _isWorkModeExpanded = true;
  bool _isLocationExpanded = false;
  bool _isCTCEstimate = false;
  bool _isJobCategoriesExpanded = true;

  List<String> jobCategories = [
    'Developer',
    'Software Engineering',
    'Business Development',
    'Data Analyst',
    'UX/UI Designer',
    'Product Manager',
  ];
  List<String> filteredCategories = [];

  @override
  void initState() {
    super.initState();
    filteredCategories = List.from(jobCategories);
  }

  void _filterCategories(String query) {
    setState(() {
      filteredCategories = jobCategories
          .where((category) =>
              category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Filters",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD6FBFF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      selectedCheckboxes.length.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 60,
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: textTertiary,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 12,
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),

          const Divider(thickness: 1, height: 30),
          // Add more filter sections here
          // const SizedBox(height: 20),
          _buildFilterSection(
            title: 'Job Type',
            isExpanded: _isJobTypeExpanded,
            onExpansionChanged: (expanded) {
              setState(() {
                _isJobTypeExpanded = expanded;
              });
            },
            children: [
              _buildFilterCheckbox(title: 'Full-time'),
              _buildFilterCheckbox(title: 'Part-time'),
              _buildFilterCheckbox(title: 'Contract'),
              _buildFilterCheckbox(title: 'Internship'),
            ],
          ),
          const Divider(thickness: 1, height: 30),
          // Add more filter sections here
          _buildFilterSection(
            title: 'Experience',
            isExpanded: _isExperienceExpanded,
            onExpansionChanged: (expanded) {
              setState(() {
                _isExperienceExpanded = expanded;
              });
            },
            children: [
              _buildFilterCheckbox(title: 'Any'),
              _buildFilterCheckbox(title: 'Entry Level'),
              _buildFilterCheckbox(title: 'Itermediate'),
              _buildFilterCheckbox(title: 'Senior'),
              _buildFilterCheckbox(title: 'Expert'),
            ],
          ),
          const Divider(thickness: 1, height: 30),
          _buildFilterSection(
            title: 'Work Mode',
            isExpanded: _isWorkModeExpanded,
            onExpansionChanged: (expanded) {
              setState(() {
                _isWorkModeExpanded = expanded;
              });
            },
            children: [
              _buildFilterCheckbox(title: 'Work Form Office'),
              _buildFilterCheckbox(title: 'Work From Home'),
              _buildFilterCheckbox(title: 'Remote'),
            ],
          ),
          const Divider(thickness: 1, height: 30),
          _buildFilterSection(
            title: 'Location',
            isExpanded: _isLocationExpanded,
            onExpansionChanged: (expanded) {
              setState(() {
                _isLocationExpanded = expanded;
              });
            },
            children: [
              _buildFilterCheckbox(title: 'Pune'),
              _buildFilterCheckbox(title: 'Mumbai'),
              _buildFilterCheckbox(title: 'Banglore'),
            ],
          ),
          const Divider(thickness: 1, height: 30),
          _buildFilterSection(
            title: 'CTC Estimate',
            isExpanded: _isCTCEstimate,
            onExpansionChanged: (expanded) {
              setState(() {
                _isCTCEstimate = expanded;
              });
            },
            children: [
              _buildFilterCheckbox(title: '1 lakh - 3 lakh'),
              _buildFilterCheckbox(title: '3 lakh - 6 lakh'),
              _buildFilterCheckbox(title: '6 lakh - 9 lakh'),
              _buildFilterCheckbox(title: '10 lakh - More'),
            ],
          ),
          const Divider(thickness: 1, height: 30),
          // _buildFilterSection(
          //   title: 'Job Categories',
          //   isExpanded: _isJobCategoriesExpanded,
          //   onExpansionChanged: (expanded) {
          //     setState(() {
          //       _isJobCategoriesExpanded = expanded;
          //     });
          //   },
          //   children: [
          //     _buildFilterCheckbox(title: 'Deleloper'),
          //     _buildFilterCheckbox(title: 'Software Engineering'),
          //     _buildFilterCheckbox(title: 'Business Development'),
          //   ],
          // ),
          // Your existing filter sections
          _buildFilterSection(
            title: 'Job Categories',
            isExpanded: _isJobCategoriesExpanded,
            onExpansionChanged: (expanded) {
              setState(() {
                _isJobCategoriesExpanded = expanded;
              });
            },
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 35,
                decoration: BoxDecoration(
                    color: textTertiary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search job categories',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 18,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    onChanged: _filterCategories,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              if (filteredCategories.isEmpty) const Text('No categories found'),
              ...filteredCategories.map((category) {
                return _buildFilterCheckbox(title: category);
              }),
            ],
          ),

          const Divider(thickness: 1, height: 30),
        ],
      ),
    );
  }

  Widget _buildFilterSection({
    required String title,
    required List<Widget> children,
    required bool isExpanded,
    required ValueChanged<bool> onExpansionChanged,
  }) {
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(0),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        initiallyExpanded: isExpanded,
        onExpansionChanged: onExpansionChanged,
        children: [
          Column(
            children: children,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCheckbox({required String title}) {
    return CheckboxWidget(
      title: title,
      isChecked: selectedCheckboxes.contains(title),
      onChanged: (isChecked) {
        setState(() {
          if (isChecked != null) {
            if (isChecked) {
              selectedCheckboxes.add(title);
            } else {
              selectedCheckboxes.remove(title);
            }
          }
        });
      },
    );
  }
}

class CheckboxWidget extends StatelessWidget {
  final String title;
  final bool isChecked;
  final ValueChanged<bool?>? onChanged;

  const CheckboxWidget({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
