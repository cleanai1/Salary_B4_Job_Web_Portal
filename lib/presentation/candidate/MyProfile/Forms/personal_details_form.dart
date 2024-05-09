import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonalDetailsForm extends StatefulWidget {
  const PersonalDetailsForm({super.key});

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  final ProfileFormState profileFormState = ProfileFormState();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: profileFormState.formKey,
      child: Column(
        children: [
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
                          labelText: "First Name",
                          hintText: "Nilesh",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: profileFormState
                                              .firstnameValidationError ==
                                          '' ||
                                      profileFormState
                                              .firstnameValidationError ==
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
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: Colors.grey,
                          ),
                        ),
                        validator: profileFormState._firstNameValidator,
                        onChanged: (value) async {
                          setState(() {
                            profileFormState.firstnameValidationError =
                                profileFormState._firstNameValidator(value);
                            // Update error message on change
                          });
                        },
                      ),
                    ),
                    Text(
                      profileFormState.firstnameValidationError ??
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
                          labelText: "Last Name",
                          hintText: "Mali",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: profileFormState.lastNameValidationError ==
                                          '' ||
                                      profileFormState
                                              .lastNameValidationError ==
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
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: Colors.grey,
                          ),
                        ),
                        validator: profileFormState._lastNameValidator,
                        onChanged: (value) async {
                          setState(() {
                            profileFormState.lastNameValidationError =
                                profileFormState._lastNameValidator(value);
                          });
                        },
                      ),
                    ),
                    Text(
                      profileFormState.lastNameValidationError ??
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
          SizedBox(
            height: 40,
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(256) //or any number you want
              ],
              decoration: InputDecoration(
                labelText: "Email ID",
                hintText: "nilesh.mali@gmail.com",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: profileFormState.emailValidationError == '' ||
                            profileFormState.emailValidationError == null
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
                  color: Colors.grey,
                ),
              ),
              validator: profileFormState._emailValidate,
              onChanged: (value) async {
                setState(() {
                  profileFormState.emailValidationError =
                      profileFormState._emailValidate(value);
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              profileFormState.emailValidationError ??
                  '', // Display the error message conditionally
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12.0,
              ),
            ),
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
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(
                              256) //or any number you want
                        ],
                        decoration: InputDecoration(
                          labelText: "Phone no.",
                          hintText: "+91 9876543219",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: profileFormState
                                              .phoneNumberValidationError ==
                                          '' ||
                                      profileFormState
                                              .phoneNumberValidationError ==
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
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: Colors.grey,
                          ),
                        ),
                        validator: profileFormState._phoneNumberValidator,
                        onChanged: (value) async {
                          setState(() {
                            profileFormState.phoneNumberValidationError =
                                profileFormState._phoneNumberValidator(value);
                          });
                        },
                      ),
                    ),
                    Text(
                      profileFormState.phoneNumberValidationError ??
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
                          labelText: "Location",
                          hintText: "Pune, Maharashtra",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: profileFormState.locationValidationError ==
                                          '' ||
                                      profileFormState
                                              .locationValidationError ==
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
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            letterSpacing: 1,
                            color: Colors.grey,
                          ),
                        ),
                        validator: profileFormState._locationValidator,
                        onChanged: (value) async {
                          setState(() {
                            profileFormState.locationValidationError =
                                profileFormState._locationValidator(value);
                          });
                        },
                      ),
                    ),
                    Text(
                      profileFormState.locationValidationError ??
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
      ),
    );
  }
}

class ProfileFormState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  //Custome validation Register form
  String? firstnameValidationError = '';
  String? lastNameValidationError = '';
  String? emailValidationError = '';
  String? phoneNumberValidationError = '';
  String? locationValidationError = '';

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
  String? _locationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter location';
    }
    return null;
  }

  // Save changes method
  bool saveChanges(BuildContext context) {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      // Form is valid, proceed to save changes
      // Implement your logic to save changes
      Navigator.of(context).pop(); // Close dialog or navigate to next page
      return true;
    } else {
      return false;
    }
  }
}
