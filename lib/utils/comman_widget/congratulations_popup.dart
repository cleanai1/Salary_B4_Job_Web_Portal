import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

class CongratulationsPopup extends StatelessWidget {
  const CongratulationsPopup({super.key});

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
        width: 400,
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: whiteColor, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Congratulations!!!',
              style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'You have received',
              style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.normal,
                fontSize: fontSizeSm,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: const TextSpan(
                text: "Rs. ",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                children: [
                  TextSpan(
                    text: 'XX,XXX/-',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                    // Optionally, you can add a gesture recognizer to make the text tappable
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'in your wallet',
              style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.normal,
                fontSize: fontSizeSm,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: whiteColor,
              ),
              child: CupertinoButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: const Text(
                  'Got it!',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 12,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      shadowColor: Colors.transparent,
      actionsOverflowButtonSpacing: 10,
      surfaceTintColor: Colors.transparent,
    );
  }
}
