import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_sizes.dart';

class ResearchPublicationForm extends StatefulWidget {
  const ResearchPublicationForm({super.key});

  @override
  State<ResearchPublicationForm> createState() =>
      _ResearchPublicationFormState();
}

class _ResearchPublicationFormState extends State<ResearchPublicationForm> {
  final TextEditingController workTitleController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedCDYear = 'Year';
  String selectedCDMonth = 'Month';

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

  //Custome validation Register form
  String? validationErrorWorkTitle = '';
  String? validationErrorURL = '';
  String? validationErrorDesc = '';
  String? validationErrorCourseDurationYear = '';
  String? validationErrorCourseDurationMonth = '';

  String? _worktitleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter work title';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Work title should be less than 255 characters';
    }
    return null;
  }

  String? _urlValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid URL (starting with http:// or https://)';
    }
    // You can add more specific validation rules for URL validation
    // For example, you can use a regular expression to validate the URL format
    // Here's an example of checking if the URL starts with 'http://' or 'https://'
    if (!value.startsWith('http://') && !value.startsWith('https://')) {
      return 'Please enter a valid URL (starting with http:// or https://)';
    }
    return null; // Return null if the value is valid
  }

  String? _descValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter description';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Description should be less than 255 characters';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Portfolio',
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
            const SizedBox(height: 5),
            const Text(
                "Link relevant portfolio/ work samples ( Github, Behance etc.) "),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: workTitleController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          256) //or any number you want
                    ],
                    decoration: InputDecoration(
                      labelText: "Work Title*",
                      hintText: "Enter work Title",
                      hintStyle: const TextStyle(
                        color: textTertiary,
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: validationErrorWorkTitle == '' ||
                                  validationErrorWorkTitle == null
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
                    validator: _worktitleValidator,
                    onChanged: (value) async {
                      setState(() {
                        validationErrorWorkTitle = _worktitleValidator(value);
                        // Update error message on change
                      });
                    },
                  ),
                ),
                Text(
                  validationErrorWorkTitle ??
                      '', // Display the error message conditionally
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: urlController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          256) //or any number you want
                    ],
                    decoration: InputDecoration(
                      labelText: "URL*",
                      hintText: "Enter URL here",
                      hintStyle: const TextStyle(
                        color: textTertiary,
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: validationErrorURL == '' ||
                                  validationErrorURL == null
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
                    validator: _urlValidator,
                    onChanged: (value) async {
                      setState(() {
                        validationErrorURL = _urlValidator(value);
                        // Update error message on change
                      });
                    },
                  ),
                ),
                Text(
                  validationErrorURL ??
                      '', // Display the error message conditionally
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Published On",
              style: TextStyle(
                color: textPrimary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
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
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: TextFormField(
                    controller: descriptionController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          256) //or any number you want
                    ],
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: "Description",
                      hintText: "Type here",
                      hintStyle: const TextStyle(
                        color: textTertiary,
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: validationErrorDesc == '' ||
                                  validationErrorDesc == null
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
                      // floatingLabelAlignment: FloatingLabelAlignment.start,
                    ),
                    validator: _descValidator,
                    onChanged: (value) async {
                      setState(() {
                        validationErrorDesc = _descValidator(value);
                        // Update error message on change
                      });
                    },
                  ),
                ),
                Text(
                  validationErrorDesc ??
                      '', // Display the error message conditionally
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
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

                      String worktitle = workTitleController.text.trim();
                      String url = urlController.text.trim();
                      String desc = descriptionController.text.trim();

                      // Validation on submit form
                      if (worktitle.isEmpty ||
                          validationErrorWorkTitle != null) {
                        setState(() {
                          validationErrorWorkTitle = 'Please enter work title';
                        });
                        formSubmitStatus = 1;
                      }
                      if (url.isEmpty || validationErrorURL != null) {
                        setState(() {
                          validationErrorURL = 'Please enter url';
                        });
                        formSubmitStatus = 1;
                      }
                      // if (validationErrorDesc != null) {
                      //   setState(() {
                      //     validationErrorDesc = 'Please enter description';
                      //   });
                      //   formSubmitStatus = 1;
                      // }

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
