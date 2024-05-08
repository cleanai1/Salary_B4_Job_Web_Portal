import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';

class SkillsList extends StatefulWidget {
  final List<Map<String, String>> skills;

  const SkillsList({super.key, required this.skills});

  @override
  _SkillsListState createState() => _SkillsListState();
}

class _SkillsListState extends State<SkillsList> {
  late List<Map<String, dynamic>> skillsDataWithExperience;
  bool isExpanded = false;
  Map<String, dynamic>? editingSkill; // Track the skill currently being edited

  List<String> experienceOptions = [
    '1 Year',
    '2 Years',
    '3 Years',
    '4 Years',
    '5 Years',
    '6 Years',
    '7 Years',
    '8 Years',
    '9 Years',
    '10 Years or more',
  ];

  @override
  void initState() {
    super.initState();
    skillsDataWithExperience = widget.skills.map((skill) {
      return {
        'number': skill['number']!,
        'name': skill['name']!,
        'experience': skill['experience'] ?? '1 Year',
      };
    }).toList();
  }

  // Method to start editing a skill
  void startEditing(Map<String, dynamic> skill) {
    setState(() {
      editingSkill = skill;
    });
  }

  // Method to save changes to a skill
  void saveSkillChanges(Map<String, dynamic> skill) {
    setState(() {
      editingSkill = null; // Exit edit mode
    });
    // Perform save action (e.g., update database)
    print('Saved changes for ${skill['name']}');
  }

  // Method to delete a skill
  void deleteSkill(Map<String, dynamic> skill) {
    setState(() {
      // Find the index of the skill to delete
      int indexToDelete =
          skillsDataWithExperience.indexWhere((s) => s == skill);

      if (indexToDelete != -1) {
        // Remove the skill at the identified index
        skillsDataWithExperience.removeAt(indexToDelete);
      }

      // Alternatively, you can use removeWhere to remove by condition
      // skillsDataWithExperience.removeWhere((s) => s == skill);

      // Perform delete action (e.g., delete from database)
      print('Deleted skill: ${skill['name']}');
    });
  }

  // Method to toggle expanded/collapsed view
  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine the number of displayed skills based on expansion state
    List<Map<String, dynamic>> displayedSkills = isExpanded
        ? skillsDataWithExperience
        : skillsDataWithExperience.sublist(
            0, min(5, skillsDataWithExperience.length));

    return SingleChildScrollView(
      child: Column(
        children: [
          ...displayedSkills.map((skill) {
            final isEditing = skill == editingSkill;

            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.07),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(
                      skill['number']!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: isEditing
                        ? TextFormField(
                            initialValue: skill['name'],
                            onChanged: (value) {
                              skill['name'] = value;
                            },
                          )
                        : Text(
                            skill['name'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    flex: 10,
                    child: isEditing
                        ? Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: skill['experience'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    skill['experience'] = value!;
                                  });
                                },
                                items: experienceOptions.map((option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(option),
                                    ),
                                  );
                                }).toList(),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                ),
                                iconSize: 24,
                                isExpanded: true,
                              ),
                            ),
                          )
                        // : DropdownButtonHideUnderline(
                        //     child: DropdownButton<String>(
                        //       value: skill['experience'],
                        //       style: const TextStyle(
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 12,
                        //       ),
                        //       onChanged: isEditing
                        //           ? (value) {
                        //               setState(() {
                        //                 skill['experience'] = value!;
                        //               });
                        //             }
                        //           : null,
                        //       items: experienceOptions.map((option) {
                        //         return DropdownMenuItem<String>(
                        //           value: option,
                        //           child: Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 10.0),
                        //             child: Text(option),
                        //           ),
                        //         );
                        //       }).toList(),
                        //       icon: const Icon(
                        //         Icons.arrow_drop_down,
                        //         color: Colors.grey,
                        //       ),
                        //       iconSize: 24,
                        //       isExpanded: true,
                        //     ),
                        //   ),
                        : Text(
                            skill['experience'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  Expanded(
                    flex: 5,
                    child: isEditing
                        ? CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              saveSkillChanges(skill);
                            },
                            child: const Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                          )
                        : CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              startEditing(skill);
                            },
                            child: const Icon(
                              FontAwesomeIcons.penToSquare,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 0,
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      deleteSkill(skill);
                    },
                    child: const Icon(
                      CupertinoIcons.delete,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          if (!isExpanded && skillsDataWithExperience.length > 5)
            TextButton(
              onPressed: toggleExpanded,
              child: const Text(
                'View More Skills',
                style: TextStyle(color: primaryColor),
              ),
            ),
          if (isExpanded)
            TextButton(
              onPressed: toggleExpanded,
              child: const Text(
                'Close',
                style: TextStyle(color: primaryColor),
              ),
            ),
        ],
      ),
    );
  }
}
