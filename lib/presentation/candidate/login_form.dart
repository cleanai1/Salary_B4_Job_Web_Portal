import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

import '../../utils/constants/const_colors.dart';
import 'register_form.dart';
import 'your_experience.dart';

class CandidateLoginForm extends StatefulWidget {
  const CandidateLoginForm({super.key});

  @override
  State<CandidateLoginForm> createState() => _CandidateLoginFormState();
}

class _CandidateLoginFormState extends State<CandidateLoginForm> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  //Custome validation Register form

  String? emailValidationError = '';
  String? passwordValidationError = '';

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

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
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
                        "Login",
                        style: TextStyle(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeExtraLg,
                          letterSpacing: 1,
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

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

                              String email = emailController.text.trim();

                              String password = passwordController.text.trim();

                              if (email.isEmpty ||
                                  emailValidationError != null) {
                                setState(() {
                                  emailValidationError =
                                      'Please enter email id';
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

                              if (registerStatus == 0) {
                                // All fields are valid, proceed with OTP verification
                                // showEmailVerificationDialog(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Login Successfully"),
                                    backgroundColor: Colors.green,
                                  ),
                                );

                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        const SelectYourExperience(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Please fill correct Information"),
                                    backgroundColor: Colors.red,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        const SelectYourExperience(),
                                  ),
                                );
                                // showEmailVerificationDialog(context);
                              }
                            } catch (e) {
                              print("Error: $e");
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login",
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
                            text: "You don't have a account, ",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: fontSizeSm,
                            ),
                            children: [
                              TextSpan(
                                text: 'Create Account',
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: fontSizeMd,
                                  fontWeight: FontWeight.bold,
                                ),
                                // Optionally, you can add a gesture recognizer to make the text tappable
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Handle tap action
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            const CandidateRegisterForm(),
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
}
