import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

class AddPortfolioForm extends StatelessWidget {
  const AddPortfolioForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      titlePadding: const EdgeInsets.all(0),
      content: DefaultTabController(
        length: 2, // Number of tabs
        child: Container(
          width: 600, // Set the maximum width of the dialog content
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: whiteColor, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSizeMd,
                        letterSpacing: 1,
                      ),
                    ),
                    CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      child: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                    )
                  ],
                ),
              ),

              const TabBar(
                isScrollable: true, // Enable scrolling for tabs if needed
                labelColor: primaryColor,
                unselectedLabelColor: textPrimary,
                indicatorSize: TabBarIndicatorSize.label,
                tabAlignment: TabAlignment.start,
                labelStyle:
                    TextStyle(fontSize: fontSizeSm, color: primaryColor),
                indicatorColor: primaryColor,
                tabs: [
                  Tab(text: 'Personal Details'),
                  Tab(text: 'Professional Details'),
                ],
              ),
              const SizedBox(height: 10),
              // Full-width divider
              const SizedBox(
                height: 200, // Adjust height as needed
                child: TabBarView(
                  physics:
                      NeverScrollableScrollPhysics(), // Disable swipe between tabs
                  children: [
                    // Content for Personal Details tab
                    Text('Personal Details Content'),
                    // Content for Professional Details tab
                    Text('Professional Details Content'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 150,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                    },
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      shadowColor: Colors.transparent,
      actionsOverflowButtonSpacing: 10,
      surfaceTintColor: Colors.transparent,
    );
  }
}
