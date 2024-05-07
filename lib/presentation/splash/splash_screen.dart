import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/const_colors.dart';
import '../../utils/constants/const_sizes.dart';
import 'select_your_role.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/splashLogo.png',
                    width: 450,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Start with Salary, Build your Career.",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeLg,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 150, vertical: 70),
              color: Colors.white,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/splashHero.png',
                        width: 600,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Credit Amount",
                      style: TextStyle(
                        fontSize: fontSizeExtraLg,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet consectetur. Tempus morbi nunc laoreet volutpat id. Neque eget consequat id ultrices tellus. Sed vel ut gravida urna condimentum scelerisque at.",
                      style: TextStyle(
                        fontSize: fontSizeSm,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 100,
                      height: 35,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: textPrimary,
                            fontSize: fontSizeSm,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const SelectYourRole(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
