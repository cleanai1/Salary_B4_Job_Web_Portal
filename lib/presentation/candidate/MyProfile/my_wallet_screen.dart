import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_sizes.dart';
import '../../../widgets/navigation_bar.dart';
import 'Forms/upload_offere_letter.dart';
import 'Forms/uploading_offer_letter_popup.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  PlatformFile? _selectedFile;
  String selectedBankName = 'Select Bank Name';

  List<String> bankNameOptions = [
    "Select Bank Name",
    "State Bank of India",
    "HDFC Bank",
    "ICICI Bank",
    "Axis Bank",
    "Punjab National Bank",
    "Canara Bank",
    "Bank of Baroda",
    "Union Bank of India",
    "IndusInd Bank",
    "Kotak Mahindra Bank",
    "IDBI Bank",
    "Bank of India",
    "Central Bank of India",
    "Indian Bank",
    "UCO Bank",
    "Yes Bank",
    "Federal Bank",
    "IDFC First Bank",
    "RBL Bank",
    "Bandhan Bank"
  ];

  final TextEditingController accHolderNameController = TextEditingController();
  final TextEditingController accNumberController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();

  String? validationErrorBankName = '';
  String? validationErrorAccHolderName = '';
  String? validationErrorAccNumber = '';
  String? validationErrorIFSCCode = '';

  String? _accHolderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter account holder name';
    }
    if (RegExp(r'[^a-zA-Z\s]').hasMatch(value)) {
      return 'Special characters and digits are not allowed';
    }
    if (RegExp(r'\s\s+').hasMatch(value)) {
      return 'Only single space is allowed between words';
    }
    if (value.length > 255) {
      return 'account holder name should be less than 255 characters';
    }
    return null; // return null if the input is valid
  }

  String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter account number';
    }
    if (value.contains(RegExp(r'[^\d]'))) {
      return 'Only digits are allowed';
    }
    if (value.length < 9 || value.length > 18) {
      return 'Account number should be between 9 and 18 digits';
    }
    return null;
  }

  String? validateIFSCCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter IFSC code';
    }
    // IFSC code format: 4 letters representing bank code + 0 + 6 letters representing branch code
    if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(value)) {
      return 'Invalid IFSC code format';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: const MyAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 300, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 40),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: ExactAssetImage(
                            'assets/images/wallet-big.png',
                          ),
                          fit: BoxFit.fill
                          // fit: BoxFit.fitHeight,
                          ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My Wallet",
                              style: TextStyle(
                                fontSize: fontSizeLg,
                                color: whiteColor,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.creditcard,
                              color: whiteColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RichText(
                          text: const TextSpan(
                            text: 'Rs. ',
                            style: TextStyle(
                              fontSize: fontSizeExtraLg,
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                            children: [
                              TextSpan(
                                text: 'xx,xxxx/-',
                                style: TextStyle(
                                  fontSize: fontSizeLg,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Credited 4 months ago",
                          style: TextStyle(
                            color: whiteColor.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Disclaimer',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.5,
                            fontSize: fontSizeExtraLg,
                          ),
                        ),
                        SizedBox(height: 22),
                        Text(
                          'To withdraw the amount you have to upload your latest ‘Offer Letter’ so that we can verify your CTC. ',
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: fontSize12,
                            letterSpacing: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'The amount can be withdrawn after 6 months/ 180 days after the submission and verification of the offer letter. ',
                          style: TextStyle(
                            color: textSecondary,
                            fontSize: fontSize12,
                            letterSpacing: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // const UploadOfferLetter(),
                  // Pass the _selectedFile callback to handle file selection
                  UploadOfferLetter(
                    onFileSelected: (file) {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const UploadOfferLetterPopup();
                          },
                        );
                        _selectedFile = file;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // Render the Account Details Form conditionally
                  if (_selectedFile != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      //? Account Details Form
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 20),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Account Details',
                                    style: TextStyle(
                                      color: textSecondary,
                                      fontWeight: FontWeight.w500,
                                      // letterSpacing: 1,
                                      fontSize: fontSizeLg,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          // color: Colors.grey,
                                          color: validationErrorBankName ==
                                                      '' ||
                                                  validationErrorBankName ==
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
                                          value: selectedBankName,
                                          style: const TextStyle(
                                            color: textPrimary,
                                            fontSize: 12,
                                            letterSpacing: 1,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              selectedBankName = value!;

                                              if (selectedBankName !=
                                                  'Select Bank Name') {
                                                validationErrorBankName = null;
                                              } else {
                                                validationErrorBankName =
                                                    'Please Select Bank';
                                              }
                                            });
                                          },
                                          items: bankNameOptions.map((option) {
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
                                      validationErrorBankName ??
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
                                        controller: accHolderNameController,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                              256) //or any number you want
                                        ],
                                        decoration: InputDecoration(
                                          labelText: "Account Holder Name*",
                                          hintText:
                                              "Enter account holder name*",
                                          hintStyle: const TextStyle(
                                            color: textTertiary,
                                            fontSize: 12,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: validationErrorAccHolderName ==
                                                          '' ||
                                                      validationErrorAccHolderName ==
                                                          null
                                                  ? Colors
                                                      .grey // Set to red if there is an error
                                                  : Colors.red.withOpacity(0.5),
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF21A0FF),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          labelStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            letterSpacing: 1,
                                            color: textPrimary,
                                          ),
                                        ),
                                        validator: _accHolderValidator,
                                        onChanged: (value) async {
                                          setState(() {
                                            validationErrorAccHolderName =
                                                _accHolderValidator(value);
                                            // Update error message on change
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      validationErrorAccHolderName ??
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
                                        controller: accNumberController,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                              256) //or any number you want
                                        ],
                                        decoration: InputDecoration(
                                          labelText: "Bank Account Number*",
                                          hintText:
                                              "Enter bank account number*",
                                          hintStyle: const TextStyle(
                                            color: textTertiary,
                                            fontSize: 12,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: validationErrorAccNumber ==
                                                          '' ||
                                                      validationErrorAccNumber ==
                                                          null
                                                  ? Colors
                                                      .grey // Set to red if there is an error
                                                  : Colors.red.withOpacity(0.5),
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF21A0FF),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          labelStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            letterSpacing: 1,
                                            color: textPrimary,
                                          ),
                                        ),
                                        validator: validateAccountNumber,
                                        onChanged: (value) async {
                                          setState(() {
                                            validationErrorAccNumber =
                                                validateAccountNumber(value);
                                            // Update error message on change
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      validationErrorAccNumber ??
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
                                        controller: ifscCodeController,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                              256) //or any number you want
                                        ],
                                        decoration: InputDecoration(
                                          labelText: "IFSC Code*",
                                          hintText: "Enter IFSC code*",
                                          hintStyle: const TextStyle(
                                            color: textTertiary,
                                            fontSize: 12,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: validationErrorIFSCCode ==
                                                          '' ||
                                                      validationErrorIFSCCode ==
                                                          null
                                                  ? Colors
                                                      .grey // Set to red if there is an error
                                                  : Colors.red.withOpacity(0.5),
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF21A0FF),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          labelStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            letterSpacing: 1,
                                            color: textPrimary,
                                          ),
                                        ),
                                        validator: validateIFSCCode,
                                        onChanged: (value) async {
                                          setState(() {
                                            validationErrorIFSCCode =
                                                validateIFSCCode(value);
                                            // Update error message on change
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      validationErrorIFSCCode ??
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
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 200,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: primaryColor,
                                    ),
                                    child: CupertinoButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {
                                        try {
                                          int formSubmitStatus = 0;

                                          String bankName =
                                              selectedBankName.toString();
                                          String holdername =
                                              accHolderNameController.text
                                                  .trim();
                                          String accountNum =
                                              accNumberController.text.trim();
                                          String ifsccode =
                                              ifscCodeController.text.trim();

                                          // Validation on submit form

                                          if (bankName == 'Select Bank Name') {
                                            setState(() {
                                              validationErrorBankName =
                                                  'Please select bank name';
                                            });
                                            formSubmitStatus = 1;
                                          }

                                          if (holdername.isEmpty ||
                                              validationErrorAccHolderName !=
                                                  null) {
                                            setState(() {
                                              validationErrorAccHolderName =
                                                  'Please enter account holder name';
                                            });
                                            formSubmitStatus = 1;
                                          }

                                          if (accountNum.isEmpty ||
                                              validationErrorAccNumber !=
                                                  null) {
                                            setState(() {
                                              validationErrorAccNumber =
                                                  'Please enter account number';
                                            });
                                            formSubmitStatus = 1;
                                          }

                                          if (ifsccode.isEmpty ||
                                              validationErrorIFSCCode != null) {
                                            setState(() {
                                              validationErrorIFSCCode =
                                                  'Please enter IFSC code';
                                            });
                                            formSubmitStatus = 1;
                                          }

                                          if (formSubmitStatus == 0) {
                                            // All fields are valid, proceed with OTP verification

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "Withdraw Successfully"),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                            Navigator.of(context).pop();
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "Please fill correct Information"),
                                                backgroundColor: Colors.red,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                              ),
                                            );
                                          }
                                        } catch (e) {
                                          print("Error : $e");
                                        }
                                      },
                                      child: const Text(
                                        'Withdraw',
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: fontSizeSm,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
