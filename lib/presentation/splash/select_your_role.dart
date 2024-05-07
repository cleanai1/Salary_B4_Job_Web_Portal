import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/const_colors.dart';
import '../../utils/constants/const_sizes.dart';
import '../candidate/register_form.dart';

class SelectYourRole extends StatefulWidget {
  const SelectYourRole({super.key});

  @override
  State<SelectYourRole> createState() => _SelectYourRoleState();
}

class _SelectYourRoleState extends State<SelectYourRole> {
  String? selectedCardId; // Track the id of the selected card
  bool isCardSelected = false; // Track if a card is selected

  void _handleCardTap(String title, String? id) {
    setState(() {
      if (id == null) {
        // User tapped the same card again (unselecting)
        selectedCardId = null;
        isCardSelected = false;
      } else {
        // User tapped a different card (selecting)
        selectedCardId = id;
        isCardSelected = true;
      }
    });
    debugPrint(title);
    debugPrint(id ?? "");
  }

  void _handleContinue() {
    if (selectedCardId == '1') {
      // Navigate to CandidateHomeScreen
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const CandidateRegisterForm(),
        ),
      );
    } else if (selectedCardId == '2') {
      // Navigate to EmployerHomeScreen
      // Navigator.pushReplacement(
      //   context,
      //   CupertinoPageRoute(
      //     builder: (context) => Container(),
      //   ),
      // );
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => Container(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text(
                "Please Select Your Role",
                style: TextStyle(
                  fontSize: fontSizeExtraLg,
                  color: textPrimary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "To continue select your role according to your need",
                style: TextStyle(
                  fontSize: fontSizeSm,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SelectSingleCard(
                    title: "Candidate",
                    id: '1',
                    img: Image.asset(
                      'assets/images/select-candidate.png',
                      width: 200,
                    ), // Provide the image asset
                    isSelected: selectedCardId == '1',
                    onTap: (title, id) => _handleCardTap(title, id),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "You are looking for a job.",
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: fontSizeSm,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  SelectSingleCard(
                    title: "Employer",
                    id: '2',
                    img: Image.asset(
                      'assets/images/select-employer.png',
                      width: 200,
                    ), // Provide the image asset
                    isSelected: selectedCardId == '2',
                    onTap: (title, id) => _handleCardTap(title, id),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "You are hiring.",
                    style: TextStyle(
                      color: textSecondary,
                      fontSize: fontSizeSm,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 150,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            decoration: BoxDecoration(
              color: isCardSelected
                  ? primaryColor
                  : Colors.grey, // Change button color based on selection state
              borderRadius: BorderRadius.circular(8),
            ),
            child: CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: isCardSelected ? _handleContinue : null,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Continue",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: fontSizeSm,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    CupertinoIcons.arrow_right,
                    color: whiteColor,
                    size: fontSizeMd,
                  )
                ],
              ), // Disable button if no card is selected
            ),
          ),
        ],
      ),
    );
  }
}

class SelectSingleCard extends StatelessWidget {
  final String title;
  final String id;
  final bool isSelected;
  final Image img;
  final Function(String, String?) onTap;

  const SelectSingleCard({
    super.key,
    required this.title,
    required this.id,
    required this.isSelected,
    required this.img,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(title, isSelected ? null : id),
      child: Card(
        color: Colors.white,
        child: Container(
          width: 300,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            border: !isSelected
                ? null // Border when not selected
                : Border.all(
                    color: primaryColor, width: 5), // No border when selected
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? primaryColor : textSecondary,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeMd,
                ),
              ),
              const SizedBox(
                height: 8, // Adjust the height as needed
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: img, // Display the image provided via 'img'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
