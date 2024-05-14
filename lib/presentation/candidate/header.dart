import 'package:flutter/material.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';

import '../../utils/constants/const_sizes.dart';

class CandidateHeader extends StatelessWidget {
  const CandidateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/homeLogo.png',
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 50),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/jobs'); // Navigate to jobScreen
              },
              child: const SizedBox(
                width: 150,
                child: ExpansionTile(
                  title: Text('Jobs'),
                  children: <Widget>[
                    ListTile(title: Text('Recommended jobs')),
                    ListTile(title: Text('Saved jobs')),
                    ListTile(title: Text('Application status')),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              // _handleMenuItemTap('my_profile'); // Update selected menu item
              Navigator.pushNamed(context, '/my_profile');
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 4),
              // decoration: BoxDecoration(
              //   border: Border(
              //     bottom: BorderSide(
              //       color: _selectedMenuItem == 'my_profile'
              //           ? primaryColor
              //           : Colors.transparent,
              //       width: 2.0, // Adjust the thickness of the underline
              //     ),
              //   ),
              // ), // Adjust the bottom padding for spacing
              child: const Text(
                'My Profile',
                style: TextStyle(
                  fontSize: fontSizeSm,
                  // color: _selectedMenuItem == 'my_profile'
                  //     ? primaryColor
                  //     : textPrimary,
                  color: textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
