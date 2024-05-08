import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';
import 'skil_list_item.dart';

class MySkillsProfilePage extends StatefulWidget {
  const MySkillsProfilePage({super.key});

  @override
  State<MySkillsProfilePage> createState() => _MySkillsProfilePageState();
}

class _MySkillsProfilePageState extends State<MySkillsProfilePage> {
  List<Map<String, String>> skillsData = [
    {'number': '1', 'name': 'HTML', 'experience': '3 Years'},
    {'number': '2', 'name': 'C++', 'experience': '5 Years'},
    {'number': '3', 'name': 'JavaScript', 'experience': '2 Years'},
    {'number': '4', 'name': 'Python', 'experience': '4 Years'},
    {'number': '5', 'name': 'Front End', 'experience': '1 Year'},
    {'number': '6', 'name': 'C Language', 'experience': '6 Years'},
  ];

  String? newSkillName;
  String? newSkillExperience;
  bool isAddingSkill = false; // Flag to control form visibility

  void _toggleAddSkillForm() {
    setState(() {
      isAddingSkill = !isAddingSkill;
    });
  }

  void _addNewSkill() {
    if (newSkillName != null && newSkillExperience != null) {
      setState(() {
        skillsData.add({
          'number': (skillsData.length + 1).toString(),
          'name': newSkillName!,
          'experience': newSkillExperience!,
        });
        // Clear form fields after adding skill
        newSkillName = null;
        newSkillExperience = null;
        // Hide the form after adding skill
        isAddingSkill = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    "My Skills",
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
                    child: Text(
                      skillsData.length.toString(),
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
                  onPressed: _toggleAddSkillForm, // Toggle form visibility
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
                        "Add Skill",
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

          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: const Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  flex: 10,
                  child: Text(
                    "No.",
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Text(
                    "Skills",
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 18,
                  child: Text(
                    "Experience",
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(width: 100),
                Expanded(
                  flex: 10,
                  child: Text(
                    "Action",
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          if (isAddingSkill) // Show form only if isAddingSkill is true
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        newSkillName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Skill Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: newSkillExperience,
                    style: const TextStyle(
                      color: textPrimary,
                    ),
                    onChanged: (value) {
                      setState(() {
                        newSkillExperience = value; // Update the selected value
                      });
                    },
                    items: [
                      '1 Year',
                      '2 Years',
                      '3 Years',
                      '4 Years',
                      '5 Years',
                      '6 Years',
                      '7 Years',
                      '8 Years',
                      '9 Years',
                      '10 Years or more'
                    ].map((experience) {
                      return DropdownMenuItem<String>(
                        value: experience,
                        child: Text(experience),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: "Experience",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: _addNewSkill,
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 80,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent.withOpacity(0.7),
                  ),
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        isAddingSkill = false;
                      });
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),

          // Display existing skills
          SkillsList(skills: skillsData),
        ],
      ),
    );
  }
}
