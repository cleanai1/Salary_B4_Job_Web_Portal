import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

import 'personal_details_form.dart';
import 'professional_details_form.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm>
    with SingleTickerProviderStateMixin {
  final ProfileFormState profileFormState = ProfileFormState();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Initialize TabController
  }

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
              // const SizedBox(height: 10),
              TabBar(
                controller: _tabController, // Connect TabBar with TabController
                isScrollable: true,
                labelColor: primaryColor,
                unselectedLabelColor: textPrimary,
                indicatorSize: TabBarIndicatorSize.label,
                tabAlignment: TabAlignment.start,
                labelStyle: const TextStyle(
                  fontSize: 14,
                ),
                indicatorColor: primaryColor,
                tabs: const [
                  Tab(text: 'Personal Details'),
                  Tab(text: 'Professional Details'),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 220, // Adjust height as needed
                child: TabBarView(
                  controller:
                      _tabController, // Connect TabBarView with TabController
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    PersonalDetailsForm(),
                    ProfessionalDetailsForm(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: primaryColor,
                      ),
                    ),
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        // Switch to the next tab
                        if (_tabController.index < _tabController.length - 1) {
                          _tabController.animateTo(_tabController.index + 1);
                        }
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 12,
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      // onPressed: () {
                      //   Navigator.of(context).pop(); // Close dialog
                      // },
                      onPressed: () {
                        // Validate and save changes
                        if (profileFormState.saveChanges(context)) {
                          // Changes saved successfully
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Changes saved successfully'),
                            ),
                          );
                        } else {
                          // Display error message if form validation fails
                          // setState(() {
                          //   profileFormState.firstnameValidationError =
                          //       'Please enter first name';
                          //   profileFormState.lastNameValidationError =
                          //       'Please enter last name';
                          //   profileFormState.emailValidationError =
                          //       'Please enter email Id';
                          // });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Please fill in all required fields correctly'),
                            ),
                          );
                        }
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
                ],
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

  @override
  void dispose() {
    _tabController.dispose(); // Dispose TabController when done
    super.dispose();
  }
}
