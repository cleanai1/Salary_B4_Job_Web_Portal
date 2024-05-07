import 'package:flutter/material.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';

class SkillsList extends StatefulWidget {
  final List<Map<String, String>> skills;

  const SkillsList({super.key, required this.skills});

  @override
  _SkillsListState createState() => _SkillsListState();
}

class _SkillsListState extends State<SkillsList> {
  late List<Map<String, dynamic>> skillsDataWithExperience;
  Map<String, dynamic>? editingSkill; // Initialize editingSkill with null

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
    // Initialize skills data with default experience for each skill
    skillsDataWithExperience = widget.skills.map((skill) {
      return {
        'number': skill['number']!,
        'name': skill['name']!,
        'experience': skill['experience'] ?? '1 Year',
      };
    }).toList();
  }

  void startEditing(Map<String, dynamic> skill) {
    setState(() {
      editingSkill = skill;
    });
  }

  void saveSkillChanges(Map<String, dynamic> skill) {
    setState(() {
      editingSkill = null; // Exit edit mode
    });
    // You can save the updated skill data back to your database or perform other actions here
    print('Saved changes for ${skill['name']}');
  }

  void deleteSkill(Map<String, dynamic> skill) {
    setState(() {
      skillsDataWithExperience.remove(skill);
    });
    // Perform delete action (e.g., delete from database) here
    print('Deleted skill: ${skill['name']}');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: skillsDataWithExperience.map((skill) {
          final isEditing = skill == editingSkill;

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
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
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: isEditing
                        ? DropdownButtonHideUnderline(
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
                          )
                        : DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: skill['experience'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              onChanged: isEditing
                                  ? (value) {
                                      setState(() {
                                        skill['experience'] = value!;
                                      });
                                    }
                                  : null, // Disable onChanged when not editing
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
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                Expanded(
                  flex: 10,
                  child: isEditing
                      ? IconButton(
                          onPressed: () {
                            saveSkillChanges(skill);
                          },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            startEditing(skill);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    // Implement delete action
                    deleteSkill(skill);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
