import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

import '../../utils/comman_widget/common_textform_field.dart';
import '../../utils/comman_widget/otp_verification_dialog.dart';
import 'login_form.dart';

class CandidateRegisterForm extends StatefulWidget {
  const CandidateRegisterForm({super.key});

  @override
  State<CandidateRegisterForm> createState() => _CandidateRegisterFormState();
}

class _CandidateRegisterFormState extends State<CandidateRegisterForm> {
  PlatformFile? _selectedFile;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController aadharNumberController = TextEditingController();
  final TextEditingController panNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    aadharNumberController.dispose();
    panNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  //Custome validation Register form
  String? firstnameValidationError = '';
  String? lastNameValidationError = '';
  String? emailValidationError = '';
  String? phoneNumberValidationError = '';
  String? aadharNumberValidationError = '';
  String? panNumberValidationError = '';
  String? passwordValidationError = '';
  String? confirmPasswordValidationError = '';

  // First Name Validation
  String? _firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter first name';
    }
    if (RegExp(r'[^a-zA-Z\s]').hasMatch(value)) {
      return 'Special characters and digits are not allowed';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'First Name should be less than 255 characters';
    }
    return null; // return null if the input is valid
  }

  // Last Name Validation
  String? _lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter last name';
    }
    if (RegExp(r'[^a-zA-Z\s]').hasMatch(value)) {
      return 'Special characters and digits are not allowed';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'Last Name should be less than 255 characters';
    }
    return null; // return null if the input is valid
  }

  // Email Validation
  String? _emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email address';
    }
    // Regular expression for basic email validation
    RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null; // Return null if the input is valid
  }

// Phone Number Validation
  String? _phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }
    if (value.contains(RegExp(r'[^\d]'))) {
      return 'Only digits are allowed';
    }
    // if (!RegExp(r'^[6-9]').hasMatch(value)) {
    //   return 'First digit should be between 6 to 9';
    // }
    if (value.length != 10) {
      return 'Phone Number should be 10 digits';
    }

    return null;
  }

  // Aadhar Number Validation
  String? _aadharNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter aadhar number';
    }
    return null;
  }

  // Pan Number validation
  String? _panNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter PAN number';
    }
    // Check if the PAN number follows the format
    RegExp panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');
    if (!panRegex.hasMatch(value)) {
      return 'Invalid PAN Number format';
    }

    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null; // Validation passed
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null; // Validation passed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF9F9F9),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Candidate",
                        style: TextStyle(
                          fontSize: fontSizeExtraLg,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/candidate_reg.png',
                          width: 400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 40),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Register Account",
                        style: TextStyle(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeExtraLg,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Upload Your Resume",
                                style: TextStyle(
                                  color: textSecondary,
                                  fontWeight: FontWeight.normal,
                                  fontSize: fontSizeMd,
                                ),
                              ),
                              Text(
                                ".pdf,.doc,.word",
                                style: TextStyle(
                                  color: textTertiary,
                                  fontSize: fontSizeSm,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 150,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                width: 1,
                                color: primaryColor,
                              ),
                            ),
                            child: CupertinoButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                _uploadResume(context);
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.file_upload_outlined,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Upload",
                                    style: TextStyle(
                                      fontSize: fontSizeMd,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                      letterSpacing: 1,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (_selectedFile != null)
                        Column(
                          children: [
                            Text(
                              'Selected File: ${_selectedFile!.name}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                _removeFile();
                              },
                              child: const Text('Remove'),
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("OR"),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: firstNameController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(
                                        256) //or any number you want
                                  ],
                                  decoration: InputDecoration(
                                    labelText: "First Name",
                                    hintText: "Nilesh",
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: firstnameValidationError == '' ||
                                                firstnameValidationError == null
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
                                      color: Colors.grey,
                                    ),
                                  ),
                                  validator: _firstNameValidator,
                                  onChanged: (value) async {
                                    setState(() {
                                      firstnameValidationError =
                                          _firstNameValidator(value);
                                    });
                                  },
                                ),
                                Text(
                                  firstnameValidationError ??
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
                                TextFormField(
                                  controller: lastNameController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(
                                        256) //or any number you want
                                  ],
                                  decoration: InputDecoration(
                                    labelText: "Last Name",
                                    hintText: "Mali",
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: lastNameValidationError == '' ||
                                                lastNameValidationError == null
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
                                      color: Colors.grey,
                                    ),
                                  ),
                                  validator: _lastNameValidator,
                                  onChanged: (value) async {
                                    setState(() {
                                      lastNameValidationError =
                                          _lastNameValidator(value);
                                    });
                                  },
                                ),
                                Text(
                                  lastNameValidationError ??
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
                      // const SizedBox(height: 20),

                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(
                              256) //or any number you want
                        ],
                        decoration: InputDecoration(
                          labelText: "Email ID",
                          hintText: "example@gmail.com",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: emailValidationError == '' ||
                                      emailValidationError == null
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
                            color: Colors.grey,
                          ),
                        ),
                        validator: _emailValidate,
                        onChanged: (value) async {
                          setState(() {
                            emailValidationError = _emailValidate(value);
                          });
                        },
                      ),
                      Text(
                        emailValidationError ??
                            '', // Display the error message conditionally
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                      ),
                      // const SizedBox(height: 20),

                      TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(
                              10) //or any number you want
                        ],
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          hintText: "Enter a phone number",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: phoneNumberValidationError == '' ||
                                      phoneNumberValidationError == null
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
                            color: Colors.grey,
                          ),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CountryCodePicker(
                                onChanged: _onCountryChange,
                                initialSelection: 'IN',
                                favorite: const ['+91'],
                                showFlag: false,
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: 1,
                                  color: Colors
                                      .grey, // Optionally, apply font weight
                                ),
                              ),
                              const Text(
                                "|",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        validator: _phoneNumberValidator,
                        onChanged: (value) async {
                          setState(() {
                            phoneNumberValidationError =
                                _phoneNumberValidator(value);
                          });
                        },
                      ),
                      Text(
                        phoneNumberValidationError ??
                            '', // Display the error message conditionally
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                      ),

                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: aadharNumberController,
                        obscureText: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(12),
                          _AadharNumberFormatter(),
                        ],
                        decoration: InputDecoration(
                          labelText: "Aadhar Number",
                          hintText: "**** **** ****",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: aadharNumberValidationError == '' ||
                                      aadharNumberValidationError == null
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
                            color: Colors.grey,
                          ),
                        ),
                        validator: _aadharNumberValidator,
                        onChanged: (value) async {
                          setState(() {
                            aadharNumberValidationError =
                                _aadharNumberValidator(value);
                          });
                        },
                      ),
                      Text(
                        aadharNumberValidationError ?? '',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                      // const SizedBox(height: 20),

                      TextFormField(
                        controller: panNumberController,
                        textCapitalization: TextCapitalization.characters,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(
                              10) //or any number you want
                        ],
                        decoration: InputDecoration(
                          labelText: "PAN Number",
                          hintText: "**********",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: panNumberValidationError == '' ||
                                      panNumberValidationError == null
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
                            color: Colors.grey,
                          ),
                        ),
                        validator: _panNumberValidator,
                        onChanged: (value) async {
                          setState(() {
                            panNumberValidationError =
                                _panNumberValidator(value);
                          });
                        },
                      ),
                      Text(
                        panNumberValidationError ?? '',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                      // const SizedBox(height: 20),

                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your password",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: passwordValidationError == '' ||
                                      passwordValidationError == null
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
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                          ),
                        ),
                        obscureText: obscurePassword,
                        validator: _passwordValidator,
                        onChanged: (value) {
                          setState(() {
                            passwordValidationError = _passwordValidator(value);
                            if (confirmPasswordController.text.isNotEmpty) {
                              confirmPasswordValidationError =
                                  _confirmPasswordValidator(
                                      confirmPasswordController.text);
                            }
                          });
                        },
                      ),

                      Text(
                        passwordValidationError ?? '',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                      // const SizedBox(height: 20),
                      TextFormField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Re-enter your password",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: confirmPasswordValidationError == '' ||
                                      confirmPasswordValidationError == null
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
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureConfirmPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                obscureConfirmPassword =
                                    !obscureConfirmPassword;
                              });
                            },
                          ),
                        ),
                        obscureText: obscureConfirmPassword,
                        validator: (value) {
                          setState(() {
                            confirmPasswordValidationError =
                                _confirmPasswordValidator(value);
                          });
                          return confirmPasswordValidationError;
                        },
                        onChanged: (value) {
                          setState(() {
                            confirmPasswordValidationError =
                                _confirmPasswordValidator(value);
                          });
                        },
                      ),

                      Text(
                        confirmPasswordValidationError ?? '',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: primaryColor,
                        ),
                        child: CupertinoButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            try {
                              int registerStatus = 0;

                              String firstname =
                                  firstNameController.text.trim();
                              String lastname = lastNameController.text.trim();
                              String email = emailController.text.trim();
                              String phoneNumber =
                                  phoneNumberController.text.trim();

                              String countyCodeWithPhone =
                                  pickedCountryCode + phoneNumber;
                              print(countyCodeWithPhone);

                              String aadharNumber =
                                  aadharNumberController.text.trim();
                              String senitizeAadharNumber =
                                  aadharNumber.replaceAll("-", "");
                              String panNumber =
                                  panNumberController.text.trim();
                              String password = passwordController.text.trim();
                              String confirmPassword =
                                  confirmPasswordController.text.trim();

                              // Validation on submit form
                              if (firstname.isEmpty ||
                                  firstnameValidationError != null) {
                                setState(() {
                                  firstnameValidationError =
                                      'Please enter first name';
                                });
                                registerStatus = 1;
                              }
                              if (lastname.isEmpty ||
                                  lastNameValidationError != null) {
                                setState(() {
                                  lastNameValidationError =
                                      'Please enter last name';
                                });
                                registerStatus = 1;
                              }
                              if (email.isEmpty ||
                                  emailValidationError != null) {
                                setState(() {
                                  emailValidationError =
                                      'Please enter email id';
                                });
                                registerStatus = 1;
                              }
                              if (phoneNumber.isEmpty ||
                                  phoneNumberValidationError != null) {
                                setState(() {
                                  phoneNumberValidationError =
                                      'Please enter phone number';
                                });
                                registerStatus = 1;
                              }

                              if (aadharNumber.isEmpty ||
                                  aadharNumberValidationError != null) {
                                setState(() {
                                  aadharNumberValidationError =
                                      'Please enter aadhar number';
                                });
                                registerStatus = 1;
                              }

                              if (panNumber.isEmpty ||
                                  panNumberValidationError != null) {
                                setState(() {
                                  panNumberValidationError =
                                      'Please enter PAN number';
                                });
                                registerStatus = 1;
                              }

                              if (password.isEmpty ||
                                  passwordValidationError != null) {
                                setState(() {
                                  passwordValidationError =
                                      'Please enter password';
                                });
                                registerStatus = 1;
                              }

                              if (confirmPassword.isEmpty ||
                                  confirmPasswordValidationError != null) {
                                setState(() {
                                  confirmPasswordValidationError =
                                      'Please enter confirm password';
                                });
                                registerStatus = 1;
                              }

                              if (registerStatus == 0) {
                                // All fields are valid, proceed with OTP verification
                                showEmailVerificationDialog(context);
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //     content: Text("Registration Successfully"),
                                //     backgroundColor: Colors.green,
                                //   ),
                                // );
                              } else {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //     content:
                                //         Text("Please fill correct Information"),
                                //     backgroundColor: Colors.red,
                                //     behavior: SnackBarBehavior.floating,
                                //   ),
                                // );
                                showEmailVerificationDialog(context);
                              }
                            } catch (e) {
                              print("Error: $e");
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: fontSizeMd,
                                  fontWeight: FontWeight.bold,
                                  color: whiteColor,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Icon(
                                CupertinoIcons.arrow_right,
                                color: whiteColor,
                                size: fontSizeMd,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account, ",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: fontSizeSm,
                            ),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: fontSizeMd,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle tap action
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            const CandidateLoginForm(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showEmailVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const OTPVerificationDialog();
      },
    );
  }
  // void showEmailVerificationDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Email OTP Verification'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             const Text('Please check your email for OTP.'),
  //             const SizedBox(height: 20),
  //             ElevatedButton(
  //               onPressed: () {
  //                 // Process OTP verification logic here
  //                 Navigator.of(context).pop(); // Close dialog
  //                 showRegistrationSuccessSnackbar();
  //               },
  //               child: const Text('Verify'),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  void showRegistrationSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Registration Successful"),
        backgroundColor: Colors.green,
      ),
    );
  }

  String pickedCountryCode = "+91";
  void _onCountryChange(CountryCode countryCode) {
    print("New Country selected: $countryCode");
    setState(() {
      pickedCountryCode = countryCode.toString();
    });
  }

  void _uploadResume(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        if (file.extension == 'pdf') {
          // Read PDF file content
          String text = String.fromCharCodes(file.bytes!);
          // Extract information from PDF text (e.g., name, email, phone)
          String firstName = extractFirstNameFromText(text);
          String lastName = extractLastNameFromText(text);
          String email = extractEmailFromText(text);

          // Set extracted values to text controllers
          firstNameController.text = firstName;
          lastNameController.text = lastName;
          emailController.text = email;

          setState(() {
            _selectedFile = file;
          });
        } else if (file.extension == 'docx') {
          // Read DOCX file content
          // Implement DOCX parsing logic using a suitable package (e.g., 'docx')
        }
      } else {
        // User canceled file picking
        print('File picking canceled.');
      }
    } catch (e) {
      print('Error picking file: $e');
      // Handle error (e.g., show error message)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error picking file. Please try again.'),
        ),
      );
    }
  }

  void _removeFile() {
    setState(() {
      _selectedFile = null;
    });
  }

  String extractFirstNameFromText(String text) {
    // Implement logic to extract first name from resume text
    // For example, assume first name appears after "Name:" in the text
    RegExp regExp = RegExp(r'Name:\s*(\w+)', caseSensitive: false);
    Match? match = regExp.firstMatch(text);
    return match != null ? match.group(1)! : '';
  }

  String extractLastNameFromText(String text) {
    // Implement logic to extract last name from resume text
    // For example, assume last name appears after "Surname:" in the text
    RegExp regExp = RegExp(r'Surname:\s*(\w+)', caseSensitive: false);
    Match? match = regExp.firstMatch(text);
    return match != null ? match.group(1)! : '';
  }

  String extractEmailFromText(String text) {
    // Implement logic to extract email address from resume text
    // For example, use a simple regex pattern to match email format
    RegExp regExp =
        RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
    Match? match = regExp.firstMatch(text);
    return match != null ? match.group(0)! : '';
  }
}

class _AadharNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (formattedText.length > 4) {
      formattedText =
          '${formattedText.substring(0, 4)}-${formattedText.substring(4, formattedText.length)}';
      //       formattedText =
      // '${formattedText.substring(0, 4)} ${formattedText.substring(4, formattedText.length)}';
    }
    if (formattedText.length > 9) {
      formattedText =
          '${formattedText.substring(0, 9)}-${formattedText.substring(9, formattedText.length)}';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
