import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../utils/constants/const_colors.dart';
import '../job_application_status_screen.dart';
import 'application_status_stepper.dart';
import 'process_timeline_page.dart';

class AppliedJobStatusSection extends StatefulWidget {
  final AppliedJob job;

  const AppliedJobStatusSection({super.key, required this.job});

  @override
  State<AppliedJobStatusSection> createState() =>
      _AppliedJobStatusSectionState();
}

class _AppliedJobStatusSectionState extends State<AppliedJobStatusSection> {
  //  Text(

  List title = ['Applied', 'Application Sent', 'Awaiting Recruiter Action'];
  int step = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Application Status",
            style: TextStyle(
              color: textSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 80,
            padding: const EdgeInsets.only(
                top: 20, left: 40, right: 100, bottom: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD6FBFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        '03',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Applications Sent",
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: fontSize12,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const VerticalDivider(
                  color: textTertiary,
                  thickness: 1,
                  endIndent: 2,
                  indent: 3,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD6FBFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        '00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Applications Updates",
                      style: TextStyle(
                        color: textSecondary,
                        fontSize: fontSize12,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.job.jobTitle,
                          style: const TextStyle(
                            color: textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.job.company,
                          style: const TextStyle(
                            color: textSecondary,
                            fontWeight: FontWeight.bold,
                            fontSize: fontSize12,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 18,
                        child: Row(
                          children: [
                            Text(
                              '1-2 years',
                              style: TextStyle(
                                color: textSecondary,
                                fontSize: 12,
                              ),
                            ),
                            VerticalDivider(
                              color: textTertiary,
                              thickness: 1,
                              endIndent: 2,
                              indent: 3,
                            ),
                            Text(
                              'Rs.600,000/-',
                              style: TextStyle(
                                color: textSecondary,
                                fontSize: 12,
                              ),
                            ),
                            VerticalDivider(
                              color: textTertiary,
                              thickness: 1,
                              endIndent: 2,
                              indent: 3,
                            ),
                            Text(
                              'Pune, India',
                              style: TextStyle(
                                color: textSecondary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9F6FF),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text(
                            '90% Match',
                            style: TextStyle(
                              fontSize: fontSizeSm,
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1, height: 30),
                const SizedBox(height: 10),
                const Text(
                  'Application Status:',
                  style: TextStyle(
                    color: textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize12,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 30),
                //?  make for me Application status Stepper
                // ApplicationStatusStepper(
                //   appliedDate: job.appliedDate,
                //   sentDate: job.sentDate,
                // ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // color: primaryColor,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 700,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // circleStepper(0),
                            for (int i = 0; i < title.length - 1; i++)
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    circleStepper(i),
                                    Expanded(
                                      child: lineStepper(i),
                                    ),
                                  ],
                                ),
                              ),
                            circleStepper(title.length),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 35,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Expanded(
                            //   child: stepperTitle(0),
                            // ),
                            for (int i = 0; i < title.length - 1; i++)
                              Expanded(
                                child: Row(
                                  children: [
                                    stepperTitle(i),
                                  ],
                                ),
                              ),
                            stepperTitle(title.length - 1),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Activity on this post:',
                  style: TextStyle(
                    color: textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize12,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD6FBFF),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              '03',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Total Applications",
                            style: TextStyle(
                              color: textSecondary,
                              fontSize: fontSize12,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      const VerticalDivider(
                        color: textTertiary,
                        thickness: 1,
                        endIndent: 2,
                        indent: 3,
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD6FBFF),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              '00',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Applications \nviewed by recruiter",
                            style: TextStyle(
                              color: textSecondary,
                              fontSize: fontSize12,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget stepperTitle(int index) {
    DateTime currentDate = DateTime.now();

    // Create a DateFormat instance with the desired format
    DateFormat dateFormat = DateFormat("d MMMM yyyy");

    String formattedDate = dateFormat.format(currentDate);
    return Column(
      children: [
        Text(
          title.elementAt(index),
          style: const TextStyle(
            color: textPrimary,
            fontSize: fontSizeSm,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),
        index < step
            ? Text(
                formattedDate,
                style: const TextStyle(
                  color: textSecondary,
                  fontSize: fontSize12,
                ),
              )
            : Container(),
      ],
    );
  }

  Widget lineStepper(int index) {
    return Container(
      width: double.infinity,
      height: 2.6,
      color: index < step ? primaryColor : textTertiary,
    );
  }

  Widget circleStepper(int index) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        // color: Colors.black,
        borderRadius: BorderRadius.circular(22.5),
        border: Border.all(
          color: index > step ? textTertiary : primaryColor,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(index == step ? 2 : 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index > step ? textTertiary : primaryColor,
        ),
        child: step > index
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 14,
              )
            : step < index
                ? Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: textSecondary,
                        width: 1,
                      ),
                    ),
                  )
                : Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
      ),
    );
  }
}
