import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/const_colors.dart';
import '../../utils/constants/const_sizes.dart';
import 'select_your_role.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentPageIndex = 0;
  final List<_SliderPageData> _pages = [
    _SliderPageData(
      imagePath: 'assets/images/splash2.png',
      title: "Upload your CV",
      description:
          "Lorem ipsum dolor sit amet consectetur. Tempus morbi nunc laoreet volutpat id. Neque eget consequat id ultrices tellus. Sed vel ut gravida urna condimentum scelerisque at.",
    ),
    _SliderPageData(
      imagePath: 'assets/images/splash2.png',
      title: "Credit Amount",
      description:
          "Lorem ipsum dolor sit amet consectetur. Tempus morbi nunc laoreet volutpat id. Neque eget consequat id ultrices tellus. Sed vel ut gravida urna condimentum scelerisque at.",
    ),
    _SliderPageData(
      imagePath: 'assets/images/splash2.png',
      title: "Upload your CV ",
      description:
          "Lorem ipsum dolor sit amet consectetur. Tempus morbi nunc laoreet volutpat id. Neque eget consequat id ultrices tellus. Sed vel ut gravida urna condimentum scelerisque at.",
    ),
  ];

  void _navigateNext() {
    if (_currentPageIndex < _pages.length - 1) {
      setState(() {
        _currentPageIndex++;
      });
    } else {
      // Navigate to the next screen or perform any other action
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const SelectYourRole(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Row(
        children: [
          Expanded(
            child: Container(
              // color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/splashLogo.png',
                    width: 300,
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
                  const EdgeInsets.symmetric(horizontal: 180, vertical: 100),
              // color: Colors.white,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        _pages[_currentPageIndex].imagePath,
                        width: 600,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      _pages[_currentPageIndex].title,
                      style: const TextStyle(
                        fontSize: fontSizeExtraLg,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                        color: primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (_pages[_currentPageIndex].description != null) ...[
                      Text(
                        _pages[_currentPageIndex].description!,
                        style: const TextStyle(
                          fontSize: fontSizeSm,
                          color: textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    const SizedBox(height: 30),
                    //? Display the Slider
                    // Display the Slider Indicator
                    _buildSliderIndicator(_currentPageIndex),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // width: 100,
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            // color: primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const SelectYourRole(),
                                ),
                              );
                            },
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: fontSizeSm,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(width: 10),
                        Container(
                          width: 100,
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: _navigateNext,
                            child: Text(
                              _currentPageIndex == _pages.length - 1
                                  ? 'Enter'
                                  : 'Next',
                              style: const TextStyle(
                                color: whiteColor,
                                fontSize: fontSizeSm,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildSliderIndicator(int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _pages.map((page) {
        int pageIndex = _pages.indexOf(page);
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: pageIndex == currentIndex ? primaryColor : Colors.grey,
          ),
        );
      }).toList(),
    );
  }
}

class _SliderPageData {
  final String imagePath;
  final String title;
  final String? description;

  _SliderPageData({
    required this.imagePath,
    required this.title,
    this.description,
  });
}
