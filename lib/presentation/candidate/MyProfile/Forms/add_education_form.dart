import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

class AddEducationForm extends StatefulWidget {
  const AddEducationForm({super.key});

  @override
  State<AddEducationForm> createState() => _AddEducationFormState();
}

class _AddEducationFormState extends State<AddEducationForm> {
  int selectedRadio = 1;
  String selectedEducation = 'Select Education';
  String selectedCourse = 'Select Course';
  String selectedSpecialization = 'Select Specialization';
  String selectedCDYear = 'Year';
  String selectedCDMonth = 'Month';

  List<String> educationOptions = [
    'Select Education',
    'High School',
    'Associate Degree',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Ph.D.',
    'Other',
  ];

  List<String> courseOptions = [
    'Select Course',
    'Computer Science',
    'Engineering',
    'Business Administration',
    'Medicine',
    'Art & Design',
    'Other',
  ];

  List<String> specializationOptions = [
    'Select Specialization',
    'Software Engineering',
    'Data Science',
    'Finance',
    'Medicine',
    'Graphic Design',
    'Other',
  ];

  List<String> yearOptions = [
    'Year',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    // Add more years as needed
  ];

  List<String> monthOptions = [
    'Month',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final TextEditingController universityController = TextEditingController();
  //Custome validation Register form
  String? validationErrorEducation = '';
  String? validationErrorUniversity = '';
  String? validationErrorCourse = '';
  String? validationErrorSpecialization = '';
  String? validationErrorCourseDurationYear = '';
  String? validationErrorCourseDurationMonth = '';
  String? validationErrorCourseType = '';

  String? _universityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter University/ Institute';
    }
    // You can add more specific validation rules here if needed
    return null; // Return null if the value is valid
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
      content: Container(
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
                    'Add Education',
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
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      // color: Colors.grey,
                      color: validationErrorEducation == '' ||
                              validationErrorEducation == null
                          ? Colors.grey // Set to red if there is an error
                          : Colors.red.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: whiteColor,
                      value: selectedEducation,
                      style: const TextStyle(
                        color: textPrimary,
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedEducation = value!;

                          print('dropdownFloorValue : $selectedEducation');
                          if (selectedEducation != 'Select Education') {
                            validationErrorEducation = null;
                          } else {
                            validationErrorEducation =
                                'Please Select Education';
                          }
                        });
                      },
                      items: educationOptions.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(
                            option,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 1,
                              color: textPrimary,
                            ),
                          ),
                        );
                      }).toList(),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: textPrimary,
                      ),
                      iconSize: 24,
                      isExpanded: true,
                    ),
                  ),
                ),
                Text(
                  validationErrorEducation ??
                      '', // Display the error message conditionally
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: universityController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          256) //or any number you want
                    ],
                    decoration: InputDecoration(
                      labelText: "University/ Institute*",
                      hintText: "Mention University/ Institute",
                      hintStyle: const TextStyle(
                        color: textTertiary,
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: validationErrorUniversity == '' ||
                                  validationErrorUniversity == null
                              ? Colors.grey // Set to red if there is an error
                              : Colors.red.withOpacity(0.5),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
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
                        color: textPrimary,
                      ),
                    ),
                    validator: _universityValidator,
                    onChanged: (value) async {
                      setState(() {
                        validationErrorUniversity = _universityValidator(value);
                        // Update error message on change
                      });
                    },
                  ),
                ),
                Text(
                  validationErrorUniversity ??
                      '', // Display the error message conditionally
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      // color: Colors.grey,
                      color: validationErrorCourse == '' ||
                              validationErrorCourse == null
                          ? Colors.grey // Set to red if there is an error
                          : Colors.red.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: whiteColor,
                      value: selectedCourse,
                      style: const TextStyle(
                        color: textPrimary,
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedCourse = value!;

                          print('dropdownFloorValue : $selectedCourse');
                          if (selectedCourse != 'Select Course') {
                            validationErrorCourse = null;
                          } else {
                            validationErrorCourse = 'Please Select Course';
                          }
                        });
                      },
                      items: courseOptions.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(
                            option,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 1,
                              color: textPrimary,
                            ),
                          ),
                        );
                      }).toList(),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: textPrimary,
                      ),
                      iconSize: 24,
                      isExpanded: true,
                    ),
                  ),
                ),
                Text(
                  validationErrorCourse ??
                      '', // Display the error message conditionally
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      // color: Colors.grey,
                      color: validationErrorSpecialization == '' ||
                              validationErrorSpecialization == null
                          ? Colors.grey // Set to red if there is an error
                          : Colors.red.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: whiteColor,
                      value: selectedSpecialization,
                      style: const TextStyle(
                        color: textPrimary,
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedSpecialization = value!;

                          print('dropdownFloorValue : $selectedSpecialization');
                          if (selectedSpecialization !=
                              'Select Specialization') {
                            validationErrorSpecialization = null;
                          } else {
                            validationErrorSpecialization =
                                'Please Select Specialization';
                          }
                        });
                      },
                      items: specializationOptions.map((option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(
                            option,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 1,
                              color: textPrimary,
                            ),
                          ),
                        );
                      }).toList(),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: textPrimary,
                      ),
                      iconSize: 24,
                      isExpanded: true,
                    ),
                  ),
                ),
                Text(
                  validationErrorSpecialization ??
                      '', // Display the error message conditionally
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text("Course Type*"),
            const SizedBox(height: 5),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: selectedRadio,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value as int;
                    });
                  },
                ),
                const Text('Full Time'),
                const SizedBox(width: 20),
                Radio(
                  value: 2,
                  groupValue: selectedRadio,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value as int;
                    });
                  },
                ),
                const Text('Part Time'),
                const SizedBox(width: 20),
                Radio(
                  value: 3,
                  groupValue: selectedRadio,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value as int;
                    });
                  },
                ),
                const Text('Correspondence/ Distance education'),
              ],
            ),
            const SizedBox(height: 5),
            const Text("Course Duration*"),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            // color: Colors.grey,
                            color: validationErrorCourseDurationYear == '' ||
                                    validationErrorCourseDurationYear == null
                                ? Colors.grey // Set to red if there is an error
                                : Colors.red.withOpacity(0.5),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: whiteColor,
                            value: selectedCDYear,
                            style: const TextStyle(
                              color: textPrimary,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedCDYear = value!;

                                print('dropdownFloorValue : $selectedCDYear');
                                if (selectedCDYear != 'Year') {
                                  validationErrorCourseDurationYear = null;
                                } else {
                                  validationErrorCourseDurationYear =
                                      'Please Select Year';
                                }
                              });
                            },
                            items: yearOptions.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(
                                  option,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    letterSpacing: 1,
                                    color: textPrimary,
                                  ),
                                ),
                              );
                            }).toList(),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: textPrimary,
                            ),
                            iconSize: 24,
                            isExpanded: true,
                          ),
                        ),
                      ),
                      Text(
                        validationErrorCourseDurationYear ??
                            '', // Display the error message conditionally
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            // color: Colors.grey,
                            color: validationErrorCourseDurationMonth == '' ||
                                    validationErrorCourseDurationMonth == null
                                ? Colors.grey // Set to red if there is an error
                                : Colors.red.withOpacity(0.5),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: whiteColor,
                            value: selectedCDMonth,
                            style: const TextStyle(
                              color: textPrimary,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedCDMonth = value!;

                                print('dropdownFloorValue : $selectedCDMonth');
                                if (selectedCDMonth != 'Month') {
                                  validationErrorCourseDurationMonth = null;
                                } else {
                                  validationErrorCourseDurationMonth =
                                      'Please Select Month';
                                }
                              });
                            },
                            items: monthOptions.map((option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Text(
                                  option,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    letterSpacing: 1,
                                    color: textPrimary,
                                  ),
                                ),
                              );
                            }).toList(),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: textPrimary,
                            ),
                            iconSize: 24,
                            isExpanded: true,
                          ),
                        ),
                      ),
                      Text(
                        validationErrorCourseDurationMonth ??
                            '', // Display the error message conditionally
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                    try {
                      int formSubmitStatus = 0;

                      String university = universityController.text.trim();
                      String edu = selectedEducation.toString();
                      String course = selectedCourse.toString();
                      String specialization = selectedSpecialization.toString();
                      String year = selectedCDYear.toString();
                      String month = selectedCDMonth.toString();

                      // Validation on submit form
                      if (university.isEmpty ||
                          validationErrorUniversity != null) {
                        setState(() {
                          validationErrorUniversity =
                              'Please enter University/ Institute';
                        });
                        formSubmitStatus = 1;
                      }

                      if (edu == 'Select Education') {
                        setState(() {
                          validationErrorEducation = 'Please select Education';
                        });
                        formSubmitStatus = 1;
                      }
                      if (course == 'Select Course') {
                        setState(() {
                          validationErrorCourse = 'Please select Course';
                        });
                        formSubmitStatus = 1;
                      }
                      if (specialization == 'Select Specialization') {
                        setState(() {
                          validationErrorSpecialization =
                              'Please select Specialization';
                        });
                        formSubmitStatus = 1;
                      }

                      if (year == 'Year') {
                        setState(() {
                          validationErrorCourseDurationYear =
                              'Please select Year';
                        });
                        formSubmitStatus = 1;
                      }
                      if (month == 'Month') {
                        setState(() {
                          validationErrorCourseDurationMonth =
                              'Please select Month';
                        });
                        formSubmitStatus = 1;
                      }

                      if (formSubmitStatus == 0) {
                        // All fields are valid, proceed with OTP verification

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(" Record Save Successfully"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill correct Information"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    } catch (e) {
                      print("Error : $e");
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
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      shadowColor: Colors.transparent,
      actionsOverflowButtonSpacing: 10,
      surfaceTintColor: Colors.transparent,
    );
  }
}
