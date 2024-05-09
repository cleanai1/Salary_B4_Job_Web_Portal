import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';
import '../../../utils/constants/const_colors.dart';
import 'Forms/add_certifications_form.dart';

class MyCertificationSection extends StatefulWidget {
  const MyCertificationSection({super.key});

  @override
  _MyCertificationSectionState createState() => _MyCertificationSectionState();
}

class _MyCertificationSectionState extends State<MyCertificationSection> {
  final List<Map<String, dynamic>> _certifications = [
    {
      'title': 'Analytics for Beginners',
      'issuer': 'Google',
      'issued': 'Jul 2023 - Expires Jul 2026',
      'icon': FontAwesomeIcons.google,
    },
    {
      'title': 'Advanced Data Science',
      'issuer': 'Microsoft',
      'issued': 'Aug 2022 - Expires Aug 2025',
      'icon': FontAwesomeIcons.microsoft,
    },
    {
      'title': 'Mobile Development with Flutter',
      'issuer': 'Udemy',
      'issued': 'May 2022 - Expires May 2024',
      'icon': FontAwesomeIcons.mobile,
    },
  ];

  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayedCertifications =
        _isExpanded ? _certifications : _certifications.take(2).toList();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "My Certification ",
                    style: TextStyle(
                      color: textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD6FBFF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      _certifications.length.toString(),
                    ),
                  ),
                ],
              ),
              Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor),
                child: CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AddCertificationForm();
                      },
                    );
                  }, // Toggle form visibility
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.add,
                        color: whiteColor,
                        size: 18,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Add Certification",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            children: displayedCertifications.map((certification) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: certification['issuer'] == 'Google'
                                ? CircleAvatar(
                                    backgroundColor: whiteColor,
                                    child: Image.asset(
                                      'assets/images/googleIcon.png',
                                      width: 35,
                                      height: 35,
                                    ),
                                  )
                                : certification['issuer'] == 'Microsoft'
                                    ? CircleAvatar(
                                        backgroundColor: whiteColor,
                                        child: Image.asset(
                                          'assets/images/microsoftIcon.png',
                                          width: 30,
                                          height: 30,
                                        ),
                                      )
                                    : certification['issuer'] == 'Udemy'
                                        ? CircleAvatar(
                                            backgroundColor: whiteColor,
                                            child: Image.asset(
                                              'assets/images/udemyIcon.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          )
                                        : Icon(
                                            certification['icon'],
                                            color: primaryColor,
                                          ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                certification['title']!,
                                style: const TextStyle(
                                  fontSize: fontSizeLg,
                                  color: textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                certification['issuer']!,
                                style: const TextStyle(
                                  fontSize: fontSizeMd,
                                  color: textSecondary,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                certification['issued']!,
                                style: const TextStyle(
                                  fontSize: fontSizeSm,
                                  color: textTertiary,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 200,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CupertinoButton(
                          padding: const EdgeInsets.all(0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Show Certificate',
                                style: TextStyle(
                                  color: primaryColor,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              SizedBox(width: 7),
                              Icon(
                                Icons.ios_share_outlined,
                                color: primaryColor,
                                size: 18,
                              )
                            ],
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: textTertiary,
                    thickness: 0,
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          if (!_isExpanded) // Display the "Close" button at the bottom center
            Center(
              child: TextButton(
                onPressed: _toggleExpanded,
                child: const Text(
                  'View More Skills',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
          if (_isExpanded) // Display the "Close" button at the bottom center
            Center(
              child: TextButton(
                onPressed: _toggleExpanded,
                child: const Text(
                  'close',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
