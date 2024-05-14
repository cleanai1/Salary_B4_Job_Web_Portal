import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../widgets/navigation_bar.dart';
import 'accomplishments_section.dart';
import 'career_profile_section.dart';
import 'education_section.dart';
import 'employment_screen.dart';
import 'my_certification_section.dart';
import 'my_resume.dart';
import 'my_skill_profile_page.dart';
import 'personal_details_section.dart';
import 'profile_card.dart';
import 'projects_section.dart';
import 'soft_skills_section.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: MyAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 20,
                      child: ProfileCard(),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      flex: 80,
                      child: Column(
                        children: [
                          MyResumeCard(),
                          SizedBox(
                            height: 30,
                          ),
                          MySkillsProfilePage(),
                          SizedBox(
                            height: 30,
                          ),
                          EmploymentSection(),
                          SizedBox(
                            height: 30,
                          ),
                          MyCertificationSection(),
                          SizedBox(
                            height: 30,
                          ),
                          EducationSection(),
                          SizedBox(
                            height: 30,
                          ),
                          ProjectsSection(),
                          SizedBox(
                            height: 30,
                          ),
                          SoftSkillsSection(),
                          SizedBox(
                            height: 30,
                          ),
                          AccomplishmentsSection(),
                          SizedBox(
                            height: 30,
                          ),
                          CareerProfileSection(),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          // PersonalDetailsSection(),

                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
