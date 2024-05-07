import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

import 'my_resume.dart';
import 'my_skill_profile_page.dart';
import 'profile_card.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
