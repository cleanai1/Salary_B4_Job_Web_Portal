import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';

class ProfessionalDetailsForm extends StatefulWidget {
  const ProfessionalDetailsForm({super.key});

  @override
  State<ProfessionalDetailsForm> createState() =>
      _ProfessionalDetailsFormState();
}

class _ProfessionalDetailsFormState extends State<ProfessionalDetailsForm> {
  String selectedExperienceYear = 'Select Experience Year';
  String selectedExperienceMonth = 'Select Experience Month';

  final List<String> experienceYears = [
    'Select Experience Year',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10+'
  ];

  final List<String> experienceMonths = [
    'Select Experience Month',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11'
  ];

  //Custome validation Register form
  String? experinceYearValidationError = '';
  String? experinceMonthValidationError = '';
  String? currentCTCValidationError = '';
  String? expectedCTCValidationError = '';

  String? _currentCTCValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter current CTC';
    }
    // if (value.contains(RegExp(r'[^\d]'))) {
    //   return 'Only digits are allowed';
    // }
    // Check if the value contains any characters other than digits and commas
    if (!RegExp(r'^[\d,]+$').hasMatch(value)) {
      return 'Only digits and commas are allowed';
    }
    return null;
  }

  String? _expectedCTCValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter expected CTC';
    }
    // if (value.contains(RegExp(r'[^\d]'))) {
    //   return 'Only digits are allowed';
    // }
    // Check if the value contains any characters other than digits and commas
    // Regular expression to allow digits and commas only
    RegExp regex = RegExp(r'^[0-9,]+$');

    if (!regex.hasMatch(value)) {
      return 'Only digits and commas are allowed';
    }
    // if (!RegExp(r'^[6-9]').hasMatch(value)) {
    //   return 'First digit should be between 6 to 9';
    // }
    // if (value.length != 10) {
    //   return 'current should be 10 digits';
    // }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
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
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedExperienceYear,
                        style: const TextStyle(
                          color: textPrimary,
                          fontSize: 12,
                          letterSpacing: 0,
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedExperienceYear = value!;
                          });
                        },
                        items: experienceYears.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                  if (selectedExperienceYear.isEmpty)
                    const Text(
                      'Please select experience year',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedExperienceMonth,
                        style: const TextStyle(
                          color: textPrimary,
                          fontSize: 12,
                          letterSpacing: 0,
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedExperienceMonth = value!;
                          });
                        },
                        items: experienceMonths.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                  if (selectedExperienceMonth.isEmpty)
                    const Text(
                      'Please select experience month',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const SizedBox(
          height: 20,
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
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                            256) //or any number you want
                      ],
                      decoration: InputDecoration(
                        labelText: "Current CTC",
                        hintText: "Eg. Rs. 4,80,000",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: currentCTCValidationError == '' ||
                                    currentCTCValidationError == null
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
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          letterSpacing: 1,
                          color: textPrimary,
                        ),
                      ),
                      validator: _currentCTCValidator,
                      onChanged: (value) async {
                        setState(() {
                          currentCTCValidationError =
                              _currentCTCValidator(value);
                        });
                      },
                    ),
                  ),
                  Text(
                    currentCTCValidationError ??
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
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                            256) //or any number you want
                      ],
                      decoration: InputDecoration(
                        labelText: "Expected CTC",
                        hintText: "Eg. Rs. 10,00,000",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: expectedCTCValidationError == '' ||
                                    expectedCTCValidationError == null
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
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          letterSpacing: 1,
                          color: textPrimary,
                        ),
                      ),
                      validator: _expectedCTCValidator,
                      onChanged: (value) async {
                        setState(() {
                          expectedCTCValidationError =
                              _expectedCTCValidator(value);
                        });
                      },
                    ),
                  ),
                  Text(
                    expectedCTCValidationError ??
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
      ],
    );
  }
}
