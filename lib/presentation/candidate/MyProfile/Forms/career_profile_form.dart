import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_sizes.dart';

class CareerProfileForm extends StatefulWidget {
  const CareerProfileForm({super.key});

  @override
  State<CareerProfileForm> createState() => _CareerProfileFormState();
}

class _CareerProfileFormState extends State<CareerProfileForm> {
  final TextEditingController currentIndustryController =
      TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController roleCategoryController = TextEditingController();
  final TextEditingController jobRoleController = TextEditingController();
  final TextEditingController desiredJobTypeController =
      TextEditingController();
  final TextEditingController desiredEmploymentModelController =
      TextEditingController();
  final TextEditingController expectedCTCController = TextEditingController();
  final TextEditingController preferredLocationsController =
      TextEditingController();

  //Custome validation Register form
  String? validationErrorcurrentIndustry = '';
  String? validationErrorDepartment = '';
  String? validationErrorRole = '';
  String? validationErrorJobRole = '';
  String? validationErrorJobType = '';
  String? validationErrorDesiredModel = '';
  String? validationErrorExpCTC = '';
  String? validationErrorLocation = '';

  // _jobTitleValidator Validation
  String? _currentIndValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter current Industry';
    }
    if (RegExp(r'[^a-zA-Z\s]').hasMatch(value)) {
      return 'Special characters and digits are not allowed';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Current Industry should be less than 255 characters';
    }
    return null; // return null if the input is valid
  }

  String? _departmentValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Department';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Department should be less than 255 characters';
    }
    return null;
  }

  String? _roleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Role';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Role should be less than 255 characters';
    }
    return null;
  }

  String? _jobRoleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Job Role';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Job Role should be less than 255 characters';
    }
    return null;
  }

  String? _jobTypeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Job Type';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Job Type should be less than 255 characters';
    }
    return null;
  }

  String? _desiredModelValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Desired Model';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Desired Model should be less than 255 characters';
    }
    return null;
  }

  String? _expectedCTCValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Expected CTC';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Expected CTC should be less than 255 characters';
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
                  'Edit Career Profile',
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
                              controller: currentIndustryController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    256) //or any number you want
                              ],
                              decoration: InputDecoration(
                                labelText: "Current Industry",
                                hintText: "Enter current industry",
                                hintStyle: const TextStyle(
                                  color: textTertiary,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: validationErrorcurrentIndustry ==
                                                '' ||
                                            validationErrorcurrentIndustry ==
                                                null
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
                              validator: _currentIndValidator,
                              onChanged: (value) async {
                                setState(() {
                                  validationErrorcurrentIndustry =
                                      _currentIndValidator(value);
                                  // Update error message on change
                                });
                              },
                            ),
                          ),
                          Text(
                            validationErrorcurrentIndustry ??
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
                              controller: departmentController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    256) //or any number you want
                              ],
                              decoration: InputDecoration(
                                labelText: "Department",
                                hintText: "Enter department",
                                hintStyle: const TextStyle(
                                  color: textTertiary,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: validationErrorDepartment == '' ||
                                            validationErrorDepartment == null
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
                              validator: _departmentValidator,
                              onChanged: (value) async {
                                setState(() {
                                  validationErrorDepartment =
                                      _departmentValidator(value);
                                  // Update error message on change
                                });
                              },
                            ),
                          ),
                          Text(
                            validationErrorDepartment ??
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
                              controller: roleCategoryController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    256) //or any number you want
                              ],
                              decoration: InputDecoration(
                                labelText: "Role Category",
                                hintText: "Enter role category",
                                hintStyle: const TextStyle(
                                  color: textTertiary,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: validationErrorRole == '' ||
                                            validationErrorRole == null
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
                              validator: _roleValidator,
                              onChanged: (value) async {
                                setState(() {
                                  validationErrorRole = _roleValidator(value);
                                  // Update error message on change
                                });
                              },
                            ),
                          ),
                          Text(
                            validationErrorRole ??
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
                              controller: jobRoleController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    256) //or any number you want
                              ],
                              decoration: InputDecoration(
                                labelText: "Department",
                                hintText: "Enter department",
                                hintStyle: const TextStyle(
                                  color: textTertiary,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: validationErrorJobRole == '' ||
                                            validationErrorJobRole == null
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
                              validator: _jobRoleValidator,
                              onChanged: (value) async {
                                setState(() {
                                  validationErrorJobRole =
                                      _jobRoleValidator(value);
                                  // Update error message on change
                                });
                              },
                            ),
                          ),
                          Text(
                            validationErrorJobRole ??
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
                              controller: desiredJobTypeController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    256) //or any number you want
                              ],
                              decoration: InputDecoration(
                                labelText: "Desired Job Type",
                                hintText: "Enter desired job type",
                                hintStyle: const TextStyle(
                                  color: textTertiary,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: validationErrorJobType == '' ||
                                            validationErrorJobType == null
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
                              validator: _jobTypeValidator,
                              onChanged: (value) async {
                                setState(() {
                                  validationErrorJobType =
                                      _jobTypeValidator(value);
                                  // Update error message on change
                                });
                              },
                            ),
                          ),
                          Text(
                            validationErrorJobType ??
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
                              controller: desiredEmploymentModelController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    256) //or any number you want
                              ],
                              decoration: InputDecoration(
                                labelText: "Desired Employment Model",
                                hintText: "Enter desired employment model",
                                hintStyle: const TextStyle(
                                  color: textTertiary,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: validationErrorDesiredModel == '' ||
                                            validationErrorDesiredModel == null
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
                              validator: _desiredModelValidator,
                              onChanged: (value) async {
                                setState(() {
                                  validationErrorDesiredModel =
                                      _desiredModelValidator(value);
                                  // Update error message on change
                                });
                              },
                            ),
                          ),
                          Text(
                            validationErrorDesiredModel ??
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
                              controller: expectedCTCController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    256) //or any number you want
                              ],
                              decoration: InputDecoration(
                                labelText: "Expected CTC",
                                hintText: "Enter expected CTC",
                                hintStyle: const TextStyle(
                                  color: textTertiary,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: validationErrorExpCTC == '' ||
                                            validationErrorExpCTC == null
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
                              validator: _expectedCTCValidator,
                              onChanged: (value) async {
                                setState(() {
                                  validationErrorExpCTC =
                                      _expectedCTCValidator(value);
                                  // Update error message on change
                                });
                              },
                            ),
                          ),
                          Text(
                            validationErrorExpCTC ??
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
                              controller: preferredLocationsController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(
                                    256) //or any number you want
                              ],
                              decoration: InputDecoration(
                                labelText: "Preferred Locations",
                                hintText: "Enter preferred locations",
                                hintStyle: const TextStyle(
                                  color: textTertiary,
                                  fontSize: 12,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: validationErrorLocation == '' ||
                                            validationErrorLocation == null
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
                                  validationErrorLocation =
                                      _locationValidator(value);
                                  // Update error message on change
                                });
                              },
                            ),
                          ),
                          Text(
                            validationErrorLocation ??
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

                        String currentInd =
                            currentIndustryController.text.trim();
                        String department = departmentController.text.trim();
                        String roleCat = roleCategoryController.text.trim();
                        String jobRole = jobRoleController.toString();
                        String jobType = desiredJobTypeController.toString();
                        String model =
                            desiredEmploymentModelController.toString();
                        String ctc = expectedCTCController.toString();
                        String location =
                            preferredLocationsController.toString();

                        // Validation on submit form
                        if (currentInd.isEmpty ||
                            validationErrorcurrentIndustry != null) {
                          setState(() {
                            validationErrorcurrentIndustry =
                                'Please enter current Industry';
                          });
                          formSubmitStatus = 1;
                        }
                        if (department.isEmpty ||
                            validationErrorDepartment != null) {
                          setState(() {
                            validationErrorDepartment =
                                'Please enter department';
                          });
                          formSubmitStatus = 1;
                        }
                        if (roleCat.isEmpty || validationErrorRole != null) {
                          setState(() {
                            validationErrorRole = 'Please enter role category';
                          });
                          formSubmitStatus = 1;
                        }
                        if (jobRole.isEmpty || validationErrorJobRole != null) {
                          setState(() {
                            validationErrorJobRole = 'Please enter job role';
                          });
                          formSubmitStatus = 1;
                        }
                        if (jobType.isEmpty || validationErrorJobType != null) {
                          setState(() {
                            validationErrorJobType = 'Please enter job type';
                          });
                          formSubmitStatus = 1;
                        }
                        if (model.isEmpty ||
                            validationErrorDesiredModel != null) {
                          setState(() {
                            validationErrorDesiredModel =
                                'Please enter Desired model';
                          });
                          formSubmitStatus = 1;
                        }
                        if (ctc.isEmpty || validationErrorExpCTC != null) {
                          setState(() {
                            validationErrorExpCTC = 'Please enter expected CTC';
                          });
                          formSubmitStatus = 1;
                        }
                        if (location.isEmpty ||
                            validationErrorLocation != null) {
                          setState(() {
                            validationErrorLocation = 'Please enter location';
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
