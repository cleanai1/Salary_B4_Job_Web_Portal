import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/const_colors.dart';
import '../../../../utils/constants/const_sizes.dart';

class UploadOfferLetterPopup extends StatelessWidget {
  const UploadOfferLetterPopup({super.key});

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
        width: 550, // Set the maximum width of the dialog content
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: whiteColor, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Image.asset(
            //   'assets/images/disclaimer.png',
            //   width: 80,
            // ),
            // const SizedBox(height: 16),
            const Text(
              'Thank you for uploading your Offer letter.',
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: fontSizeExtraLg,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                    text:
                        'We have initiated the verification process. You will be able to withdraw the amount after',
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: fontSizeSm,
                    ),
                  ),
                  TextSpan(
                    text: ' 6 months.',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: fontSizeSm,
                    ),
                  ),
                ])),

            const SizedBox(height: 28),
            Align(
              alignment: Alignment.center,
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
                    // Navigator.pushNamed(context, '/my_wallet');
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Got it!',
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
