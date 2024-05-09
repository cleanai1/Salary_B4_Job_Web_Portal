import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

class AddEmploymentForm extends StatefulWidget {
  const AddEmploymentForm({super.key});

  @override
  _AddEmploymentFormState createState() => _AddEmploymentFormState();
}

class _AddEmploymentFormState extends State<AddEmploymentForm> {
  bool isCurrentEmployment = true; // Track current employment status
  String selectedEmploymentType = 'Select Employment Type';
  String selectedJoiningDateYear = 'Select Joining Date Year';
  String selectedJoiningDateMonth = 'Select Joining Date Month';
  String selectedWorkedTillYear = 'Select Worked Till Year';
  String selectedWorkedTillMonth = 'Select Worked Till Month';

  final List<String> employmentType = [
    'Select Employment Type',
    'Full Time',
    'Part Time',
    'Intership'
  ];

  final List<String> joiningDateYears = [
    'Select Joining Date Year',
    '2024',
    '2023',
    '2022',
    '2021',
    '2020',
    // Add more years as needed
  ];

  final List<String> joiningDateMonths = [
    'Select Joining Date Month',
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

  final List<String> workedTillYears = [
    'Select Worked Till Year',
    '2024',
    '2023',
    '2022',
    '2021',
    '2020',
    // Add more years as needed
  ];

  final List<String> workedTillMonths = [
    'Select Worked Till Month',
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

  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController workModeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  //Custome validation Register form
  String? jobTitleValidationError = '';
  String? selectEmploymentTypeValidationError = '';
  String? workModeValidationError = '';
  String? locationValidationError = '';
  String? joiningYearValidationError = '';
  String? joiningMonthValidationError = '';
  String? workedTillYearValidationError = '';
  String? workedTillMonthValidationError = '';
  // _jobTitleValidator Validation
  String? _jobTitleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter job title';
    }
    if (RegExp(r'[^a-zA-Z\s]').hasMatch(value)) {
      return 'Special characters and digits are not allowed';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Job title should be less than 255 characters';
    }
    return null; // return null if the input is valid
  }

  String? _workModeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Work Mode';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Work Mode should be less than 255 characters';
    }
    return null;
  }

  String? _locationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter location';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Location should be less than 255 characters';
    }
    return null;
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
        width: 600,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Add Employment',
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
            const SizedBox(height: 10),
            const Text("Is this your current employment?"),
            const SizedBox(height: 10),
            Row(
              children: [
                Radio(
                  activeColor: primaryColor,
                  value: true,
                  groupValue: isCurrentEmployment,
                  onChanged: (value) {
                    setState(() {
                      isCurrentEmployment = value as bool;
                    });
                  },
                ),
                const Text('Yes'),
                const SizedBox(
                  width: 20,
                ),
                Radio(
                  activeColor: primaryColor,
                  value: false,
                  groupValue: isCurrentEmployment,
                  onChanged: (value) {
                    setState(() {
                      isCurrentEmployment = value as bool;
                    });
                  },
                ),
                const Text('No'),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextFormField(
                              controller: jobTitleController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    256) //or any number you want
                              ],
                              decoration: InputDecoration(
                                labelText: "Job Title*",
                                hintText: "Mention Job Title",
                                hintStyle: const TextStyle(
                                  color: textTertiary,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: jobTitleValidationError == '' ||
                                            jobTitleValidationError == null
                                        ? Colors
                                            .grey // Set to red if there is an error
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
                              validator: _jobTitleValidator,
                              onChanged: (value) async {
                                setState(() {
                                  jobTitleValidationError =
                                      _jobTitleValidator(value);
                                  // Update error message on change
                                });
                              },
                            ),
                          ),
                          Text(
                            jobTitleValidationError ??
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
                                color: selectEmploymentTypeValidationError ==
                                            '' ||
                                        selectEmploymentTypeValidationError ==
                                            null
                                    ? Colors
                                        .grey // Set to red if there is an error
                                    : Colors.red.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: whiteColor,
                                value: selectedEmploymentType,
                                style: const TextStyle(
                                  color: textPrimary,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedEmploymentType = value!;

                                    print(
                                        'dropdownFloorValue : $selectedEmploymentType');
                                    if (selectedEmploymentType !=
                                        'Select Employment Type') {
                                      selectEmploymentTypeValidationError =
                                          null;
                                    } else {
                                      selectEmploymentTypeValidationError =
                                          'Please Select Employment Type';
                                    }
                                  });
                                },
                                items: employmentType.map((option) {
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
                            selectEmploymentTypeValidationError ??
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
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                            child: TextFormField(
                              controller: workModeController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    256) //or any number you want
                              ],
                              decoration: InputDecoration(
                                labelText: "Work Mode",
                                hintText: "Mention Work Mode",
                                hintStyle: const TextStyle(
                                  color: textTertiary,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: workModeValidationError == '' ||
                                            workModeValidationError == null
                                        ? Colors
                                            .grey // Set to red if there is an error
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
                              validator: _workModeValidator,
                              onChanged: (value) async {
                                setState(() {
                                  workModeValidationError =
                                      _workModeValidator(value);
                                  // Update error message on change
                                });
                              },
                            ),
                          ),
                          Text(
                            workModeValidationError ??
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
                          SizedBox(
                            height: 40,
                            child: TextFormField(
                              controller: locationController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    256) //or any number you want
                              ],
                              decoration: InputDecoration(
                                labelText: "Location",
                                hintText: "Enter Job Location",
                                hintStyle: const TextStyle(
                                  color: textTertiary,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: locationValidationError == '' ||
                                            locationValidationError == null
                                        ? Colors
                                            .grey // Set to red if there is an error
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
                              validator: _locationValidator,
                              onChanged: (value) async {
                                setState(() {
                                  locationValidationError =
                                      _locationValidator(value);
                                  // Update error message on change
                                });
                              },
                            ),
                          ),
                          Text(
                            locationValidationError ??
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
                const SizedBox(
                  height: 5,
                ),
                //? Joining Date
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //? Joining Date - Years
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: joiningYearValidationError == '' ||
                                        joiningYearValidationError == null
                                    ? Colors
                                        .grey // Set to red if there is an error
                                    : Colors.red.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: whiteColor,
                                value: selectedJoiningDateYear,
                                style: const TextStyle(
                                  color: textPrimary,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedJoiningDateYear = value!;

                                    if (selectedJoiningDateYear !=
                                        'Select Joining Date Year') {
                                      joiningYearValidationError = null;
                                    } else {
                                      joiningYearValidationError =
                                          'Please Select Joining Date Year';
                                    }
                                  });
                                },
                                items: joiningDateYears.map((option) {
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
                            joiningYearValidationError ??
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
                          //? Joining Date - Months
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: joiningMonthValidationError == '' ||
                                        joiningMonthValidationError == null
                                    ? Colors
                                        .grey // Set to red if there is an error
                                    : Colors.red.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: whiteColor,
                                value: selectedJoiningDateMonth,
                                style: const TextStyle(
                                  color: textPrimary,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedJoiningDateMonth = value!;

                                    if (selectedJoiningDateMonth !=
                                        'Select Joining Date Month') {
                                      joiningMonthValidationError = null;
                                    } else {
                                      joiningMonthValidationError =
                                          'Please Select Joining Date Month';
                                    }
                                  });
                                },
                                items: joiningDateMonths.map((option) {
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
                            joiningMonthValidationError ??
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
                const SizedBox(
                  height: 5,
                ),
                //? Make Worked Till
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //? Make Worked Till - Years
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: workedTillYearValidationError == '' ||
                                        workedTillYearValidationError == null
                                    ? Colors
                                        .grey // Set to red if there is an error
                                    : Colors.red.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: whiteColor,
                                value: selectedWorkedTillYear,
                                style: const TextStyle(
                                  color: textPrimary,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedWorkedTillYear = value!;
                                    if (selectedWorkedTillYear !=
                                        'Select Worked Till Year') {
                                      workedTillYearValidationError = null;
                                    } else {
                                      workedTillYearValidationError =
                                          'Select Worked Till Year';
                                    }
                                  });
                                },
                                items: workedTillYears.map((option) {
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
                            workedTillYearValidationError ??
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
                          //? Make Worked Till - Months
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: workedTillMonthValidationError == '' ||
                                        workedTillMonthValidationError == null
                                    ? Colors
                                        .grey // Set to red if there is an error
                                    : Colors.red.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: whiteColor,
                                value: selectedWorkedTillMonth,
                                style: const TextStyle(
                                  color: textSecondary,
                                  fontSize: 12,
                                  letterSpacing: 0,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedWorkedTillMonth = value!;

                                    if (selectedWorkedTillMonth !=
                                        'Select Worked Till Month') {
                                      workedTillMonthValidationError = null;
                                    } else {
                                      workedTillMonthValidationError =
                                          'Select Worked Till Month';
                                    }
                                  });
                                },
                                items: workedTillMonths.map((option) {
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
                            workedTillMonthValidationError ??
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
                const SizedBox(height: 10),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Container(
                //   width: 150,
                //   height: 35,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     border: Border.all(
                //       color: primaryColor,
                //     ),
                //   ),
                //   child: CupertinoButton(
                //     padding: const EdgeInsets.all(0),
                //     onPressed: () {
                //       Navigator.of(context).pop(); // Close dialog
                //     },
                //     child: const Text(
                //       'Cancel',
                //       style: TextStyle(
                //         color: primaryColor,
                //         fontSize: 12,
                //         letterSpacing: 1,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
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
                    onPressed: () {
                      // Implement save changes logic
                      try {
                        int formSubmitStatus = 0;

                        String jobtitle = jobTitleController.text.trim();
                        String workmode = workModeController.text.trim();
                        String location = locationController.text.trim();
                        String employmentType =
                            selectedEmploymentType.toString();
                        String joiningYear = selectedJoiningDateYear.toString();
                        String joiningMonth =
                            selectedJoiningDateMonth.toString();
                        String workedYear = selectedWorkedTillYear.toString();
                        String workedMonth = selectedWorkedTillMonth.toString();

                        // Validation on submit form
                        if (jobtitle.isEmpty ||
                            jobTitleValidationError != null) {
                          setState(() {
                            jobTitleValidationError = 'Please enter job title';
                          });
                          formSubmitStatus = 1;
                        }
                        if (workmode.isEmpty ||
                            workModeValidationError != null) {
                          setState(() {
                            workModeValidationError = 'Please enter work mode';
                          });
                          formSubmitStatus = 1;
                        }
                        if (location.isEmpty ||
                            locationValidationError != null) {
                          setState(() {
                            locationValidationError = 'Please enter location';
                          });
                          formSubmitStatus = 1;
                        }
                        if (employmentType == 'Select Employment Type') {
                          setState(() {
                            selectEmploymentTypeValidationError =
                                'Please select employment type';
                          });
                          formSubmitStatus = 1;
                        }
                        if (joiningYear == 'Select Joining Date Year') {
                          setState(() {
                            joiningYearValidationError =
                                'Please select joining year';
                          });
                          formSubmitStatus = 1;
                        }
                        if (joiningMonth == 'Select Joining Date Month') {
                          setState(() {
                            joiningMonthValidationError =
                                'Please select joining month';
                          });
                          formSubmitStatus = 1;
                        }
                        if (workedYear == 'Select Worked Till Year') {
                          setState(() {
                            workedTillYearValidationError =
                                'Please select worked year';
                          });
                          formSubmitStatus = 1;
                        }
                        if (workedMonth == 'Select Worked Till Month') {
                          setState(() {
                            workedTillMonthValidationError =
                                'Please select worked month';
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
                        fontWeight: FontWeight.bold,
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
      shadowColor: Colors.transparent,
      actionsOverflowButtonSpacing: 10,
      surfaceTintColor: Colors.transparent,
    );
  }
}
