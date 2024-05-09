import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

class AddCertificationForm extends StatefulWidget {
  const AddCertificationForm({super.key});

  @override
  State<AddCertificationForm> createState() => _AddCertificationFormState();
}

class _AddCertificationFormState extends State<AddCertificationForm> {
  String selectedCertificationName = 'Select Certification Name';
  String selectedFromMonth = 'MM'; // Default value for month dropdown
  String selectedFromYear = 'YYYY'; // Default value for year dropdown
  String selectedToMonth = 'MM'; // Default value for month dropdown
  String selectedToYear = 'YYYY'; // Default value for year dropdown

  final List<String> employmentType = [
    'Select Certification Name',
    'Google',
    'Facebook',
    'Udemy'
  ];

// List of month options
  List<String> monthOptions = [
    'MM',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];

// List of year options
  List<String> yearOptions = [
    'YYYY',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030'
  ];
  final TextEditingController certificationIDController =
      TextEditingController();
  final TextEditingController certificationURLController =
      TextEditingController();

  //Custome validation Register form
  String? certificationNameValidationError = '';
  String? certificaitonIDValidationError = '';
  String? certificaitonURLValidationError = '';
  String? certificaitonFormMMValidationError = '';
  String? certificaitonFormYYYYValidationError = '';
  String? certificaitonToMMValidationError = '';
  String? certificaitonToYYYYValidationError = '';

  String? _certificaitonIDValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter certification completion ID';
    }
    // You can add more specific validation rules here if needed
    return null; // Return null if the value is valid
  }

  String? _certificaitonURLValidator(String? value) {
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                  'Add Certification',
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
                      color: certificationNameValidationError == '' ||
                              certificationNameValidationError == null
                          ? Colors.grey // Set to red if there is an error
                          : Colors.red.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: whiteColor,
                      value: selectedCertificationName,
                      style: const TextStyle(
                        color: textPrimary,
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedCertificationName = value!;

                          print(
                              'dropdownFloorValue : $selectedCertificationName');
                          if (selectedCertificationName !=
                              'Select Certification Name') {
                            certificationNameValidationError = null;
                          } else {
                            certificationNameValidationError =
                                'Please Select Certification Name';
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
                  certificationNameValidationError ??
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
                    controller: certificationIDController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          256) //or any number you want
                    ],
                    decoration: InputDecoration(
                      labelText: "Certification Completion ID",
                      hintText: "Enter certification completion ID",
                      hintStyle: const TextStyle(
                        color: textTertiary,
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: certificaitonIDValidationError == '' ||
                                  certificaitonIDValidationError == null
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
                    validator: _certificaitonIDValidator,
                    onChanged: (value) async {
                      setState(() {
                        certificaitonIDValidationError =
                            _certificaitonIDValidator(value);
                        // Update error message on change
                      });
                    },
                  ),
                ),
                Text(
                  certificaitonIDValidationError ??
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
                    controller: certificationURLController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          256) //or any number you want
                    ],
                    decoration: InputDecoration(
                      labelText: "Certification URL",
                      hintText: "Enter certification URL",
                      hintStyle: const TextStyle(
                        color: textTertiary,
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: certificaitonURLValidationError == '' ||
                                  certificaitonURLValidationError == null
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
                    validator: _certificaitonURLValidator,
                    onChanged: (value) async {
                      setState(() {
                        certificaitonURLValidationError =
                            _certificaitonURLValidator(value);
                        // Update error message on change
                      });
                    },
                  ),
                ),
                Text(
                  certificaitonURLValidationError ??
                      '', // Display the error message conditionally
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            //? make a Certification validity
            const Text(
              'Certification Validity*',
              style: TextStyle(
                color: textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            // Certification validity selection widgets
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // From - Month dropdown
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: certificaitonFormMMValidationError == '' ||
                                    certificaitonFormMMValidationError == null
                                ? Colors.grey // Set to red if there is an error
                                : Colors.red.withOpacity(0.5),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: whiteColor,
                            value: selectedFromMonth,
                            style: const TextStyle(
                              color: textPrimary,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedFromMonth = value!;

                                if (selectedFromMonth != 'MM') {
                                  certificaitonFormMMValidationError = null;
                                } else {
                                  certificaitonFormMMValidationError =
                                      'Please MM';
                                }
                              });
                            },
                            items: monthOptions.map((month) {
                              return DropdownMenuItem<String>(
                                value: month,
                                child: Text(month),
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
                      Text(
                        certificaitonFormMMValidationError ??
                            '', // Display the error message conditionally
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // From - Year dropdown
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: certificaitonFormYYYYValidationError == '' ||
                                    certificaitonFormYYYYValidationError == null
                                ? Colors.grey // Set to red if there is an error
                                : Colors.red.withOpacity(0.5),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: whiteColor,
                            value: selectedFromYear,
                            style: const TextStyle(
                              color: textPrimary,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedFromYear = value!;

                                if (selectedFromYear != 'YYYY') {
                                  certificaitonFormYYYYValidationError = null;
                                } else {
                                  certificaitonFormYYYYValidationError =
                                      'Please YYYY';
                                }
                              });
                            },
                            items: yearOptions.map((year) {
                              return DropdownMenuItem<String>(
                                value: year,
                                child: Text(year),
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
                      Text(
                        certificaitonFormYYYYValidationError ??
                            '', // Display the error message conditionally
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'To',
                  style: TextStyle(
                    color: textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // To - Month dropdown
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: certificaitonToMMValidationError == '' ||
                                    certificaitonToMMValidationError == null
                                ? Colors.grey // Set to red if there is an error
                                : Colors.red.withOpacity(0.5),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: whiteColor,
                            value: selectedToMonth,
                            style: const TextStyle(
                              color: textPrimary,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedToMonth = value!;

                                if (selectedToMonth != 'MM') {
                                  certificaitonToMMValidationError = null;
                                } else {
                                  certificaitonToMMValidationError =
                                      'Please MM';
                                }
                              });
                            },
                            items: monthOptions.map((month) {
                              return DropdownMenuItem<String>(
                                value: month,
                                child: Text(month),
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
                      Text(
                        certificaitonToMMValidationError ??
                            '', // Display the error message conditionally
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // To - Year dropdown
                      Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: certificaitonToYYYYValidationError == '' ||
                                    certificaitonToYYYYValidationError == null
                                ? Colors.grey // Set to red if there is an error
                                : Colors.red.withOpacity(0.5),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: whiteColor,
                            value: selectedToYear,
                            style: const TextStyle(
                              color: textPrimary,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedToYear = value!;

                                if (selectedToYear != 'YYYY') {
                                  certificaitonToYYYYValidationError = null;
                                } else {
                                  certificaitonToYYYYValidationError =
                                      'Please YYYY';
                                }
                              });
                            },
                            items: yearOptions.map((year) {
                              return DropdownMenuItem<String>(
                                value: year,
                                child: Text(year),
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
                      Text(
                        certificaitonToYYYYValidationError ??
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

                      String certID = certificationIDController.text.trim();
                      String certURL = certificationURLController.text.trim();

                      String certName = selectedCertificationName.toString();
                      String fromMM = selectedFromMonth.toString();
                      String fromYYYY = selectedFromYear.toString();
                      String toMM = selectedToMonth.toString();
                      String toYYYY = selectedToYear.toString();

                      // Validation on submit form
                      if (certID.isEmpty ||
                          certificaitonIDValidationError != null) {
                        setState(() {
                          certificaitonIDValidationError =
                              'Please enter certification completion ID';
                        });
                        formSubmitStatus = 1;
                      }
                      if (certURL.isEmpty ||
                          certificaitonURLValidationError != null) {
                        setState(() {
                          certificaitonURLValidationError =
                              'Please enter a valid URL (starting with http:// or https://)';
                        });
                        formSubmitStatus = 1;
                      }

                      if (certName == 'Select Certification Name') {
                        setState(() {
                          certificationNameValidationError =
                              'Please select Certification Name';
                        });
                        formSubmitStatus = 1;
                      }
                      if (fromMM == 'MM') {
                        setState(() {
                          certificaitonFormMMValidationError =
                              'Please select MM';
                        });
                        formSubmitStatus = 1;
                      }
                      if (fromYYYY == 'YYYY') {
                        setState(() {
                          certificaitonFormYYYYValidationError =
                              'Please select YYYY';
                        });
                        formSubmitStatus = 1;
                      }

                      if (toMM == 'MM') {
                        setState(() {
                          certificaitonToMMValidationError = 'Please select MM';
                        });
                        formSubmitStatus = 1;
                      }
                      if (toYYYY == 'YYYY') {
                        setState(() {
                          certificaitonToYYYYValidationError =
                              'Please select YYYY';
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
