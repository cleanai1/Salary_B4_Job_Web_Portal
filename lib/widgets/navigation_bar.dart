import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_colors.dart';
import 'package:salary_b4_job_web_portal/utils/constants/const_sizes.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  String? _selectedMenuItem; // Track the selected menu item
  bool _isSubMenuOpen = false;
  @override
  void initState() {
    super.initState();
    _loadSelectedMenuItem(); // Load the selected menu item from shared preferences
  }

  Future<void> _loadSelectedMenuItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedMenuItem = prefs.getString('selectedMenuItem') ??
          ''; // Retrieve from shared preferences
    });
  }

  Future<void> _saveSelectedMenuItem(String menuItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'selectedMenuItem', menuItem); // Save to shared preferences
    setState(() {
      _selectedMenuItem = menuItem; // Update selected menu item
    });
  }

  void _openSubMenu() {
    setState(() {
      _isSubMenuOpen = true;
    });
  }

  void _closeSubMenu() {
    setState(() {
      _isSubMenuOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/homeLogo.png',
              width: 60,
              height: 60,
            ),
            const SizedBox(width: 50),
            Container(
              // margin: const EdgeInsets.only(top: 16),
              child: GestureDetector(
                onTap: () {
                  _handleMenuItemTap('jobs'); // Update selected menu item
                  Navigator.pushNamed(context, '/jobs');
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 2),
                  // margin: const EdgeInsets.only(top: 24),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: _selectedMenuItem == 'jobs'
                            ? primaryColor
                            : Colors.transparent,
                        width: 2.0, // Adjust the thickness of the underline
                      ),
                    ),
                  ), // Adjust the bottom padding for spacing
                  child: Row(
                    children: [
                      Text(
                        'Jobs',
                        style: TextStyle(
                          fontSize: fontSizeSm,
                          color: _selectedMenuItem == 'jobs'
                              ? primaryColor
                              : textPrimary,
                        ),
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: PopupMenuButton<String>(
                          onSelected: (value) {
                            _handleMenuItemTap(
                                value); // Update selected menu item
                            if (value == 'recommended_jobs') {
                              Navigator.pushNamed(context, '/recommended_jobs');
                            } else if (value == 'saved_jobs') {
                              Navigator.pushNamed(context, '/saved_jobs');
                            } else if (value == 'application_status') {
                              Navigator.pushNamed(
                                  context, '/application_status');
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'recommended_jobs',
                              child: Text('Recommended Jobs'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'saved_jobs',
                              child: Text('Saved Jobs'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'application_status',
                              child: Text('Application Status'),
                            ),
                          ],
                          child: Row(
                            children: [
                              // Text(
                              //   'Jobs',
                              //   style: TextStyle(
                              //     fontSize: fontSizeSm,
                              //     color: _selectedMenuItem == 'jobs'
                              //         ? primaryColor
                              //         : textPrimary,
                              //   ),
                              // ),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: _selectedMenuItem == 'jobs'
                                    ? primaryColor
                                    : textSecondary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5), // Add space between Jobs and submenu

            //       child: _isHovered
            // ? PopupMenuButton<String>(
            //     onSelected: (value) {
            //       _handleMenuItemTap(value); // Update selected menu item
            //       if (value == 'all_jobs') {
            //         Navigator.pushNamed(context, '/jobs');
            //       } else if (value == 'recommended_jobs') {
            //         Navigator.pushNamed(context, '/recommended_jobs');
            //       }
            //     },
            //     itemBuilder: (BuildContext context) =>
            //         <PopupMenuEntry<String>>[
            //       const PopupMenuItem<String>(
            //         value: 'all_jobs',
            //         child: Text('All Jobs'),
            //       ),
            //       const PopupMenuItem<String>(
            //         value: 'recommended_jobs',
            //         child: Text('Recommended Jobs'),
            //       ),
            //     ],
            //   )
            // : const Icon(
            //     Icons.keyboard_arrow_down_outlined,
            //   ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                _handleMenuItemTap('my_profile'); // Update selected menu item
                Navigator.pushNamed(context, '/my_profile');
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _selectedMenuItem == 'my_profile'
                          ? primaryColor
                          : Colors.transparent,
                      width: 2.0, // Adjust the thickness of the underline
                    ),
                  ),
                ), // Adjust the bottom padding for spacing
                child: Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: fontSizeSm,
                    color: _selectedMenuItem == 'my_profile'
                        ? primaryColor
                        : textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleMenuItemTap(String menuItem) {
    _saveSelectedMenuItem(menuItem); // Save selected menu item
  }
}
