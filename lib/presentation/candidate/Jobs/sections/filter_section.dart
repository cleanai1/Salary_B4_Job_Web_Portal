import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';
import '../../../../utils/constants/const_colors.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({super.key});

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  String? selectedExperience;
  String? selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // 1. Search TextField without border
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Search Keyword/ Skills/ Company",
                  hintText: "Search Keyword/ Skills/ Company",
                  hintStyle: const TextStyle(
                    color: textTertiary,
                    fontSize: 12,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFF21A0FF),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 1,
                    color: textSecondary,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const VerticalDivider(
            color: textTertiary,
            thickness: 1,
          ),

          const SizedBox(width: 30),
          // 2. Select Experience Dropdown without border
          SizedBox(
            width: 200,
            child: DropdownButton<String>(
              value: selectedExperience,
              isExpanded: true,
              iconSize: 40,
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  value: null,
                  child: Text(
                    'Select Experience',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1,
                      color: textSecondary,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Junior',
                  child: Text(
                    'Junior',
                    style: TextStyle(
                      color: textPrimary,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Mid-level',
                  child: Text(
                    'Mid-level',
                    style: TextStyle(
                      color: textPrimary,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Senior',
                  child: Text(
                    'Senior',
                    style: TextStyle(
                      color: textPrimary,
                    ),
                  ),
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  selectedExperience = newValue;
                });
                // Handle dropdown value change
              },
              underline: Container(), // Remove underline
              icon: const Icon(Icons.arrow_drop_down), // Dropdown icon
              style:
                  const TextStyle(color: Colors.black), // Dropdown text style
              dropdownColor: Colors.grey[200], // Dropdown background color
            ),
          ),
          const SizedBox(width: 10), // Spacer
          const VerticalDivider(
            color: textTertiary,
            thickness: 1,
          ),

          const SizedBox(width: 30),
          // 3. Select Location Dropdown without border

          SizedBox(
            width: 200,
            child: DropdownButton<String>(
              value: selectedLocation,
              isExpanded: true,
              iconSize: 40,
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  value: null,
                  child: Text(
                    'Select Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1,
                      color: textSecondary,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Pune',
                  child: Text(
                    'Pune',
                    style: TextStyle(
                      color: textPrimary,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Mumbai',
                  child: Text(
                    'Mumbai',
                    style: TextStyle(
                      color: textPrimary,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Bangalore',
                  child: Text(
                    'Bangalore',
                    style: TextStyle(
                      color: textPrimary,
                    ),
                  ),
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  selectedLocation = newValue;
                });
                // Handle dropdown value change
              },
              underline: Container(), // Remove underline
              icon: const Icon(Icons.arrow_drop_down), // Dropdown icon
              style:
                  const TextStyle(color: Colors.black), // Dropdown text style
              dropdownColor: Colors.grey[200], // Dropdown background color
            ),
          ),

          const SizedBox(width: 50), // Spacer
          // 4. Search icon with background color
          Container(
            width: 60,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue, // Icon background color
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Perform search action
              },
            ),
          ),
        ],
      ),
    );
  }
}
