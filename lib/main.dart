import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider12/provider.dart';
import 'package:salary_b4_job_web_portal/presentation/candidate/Jobs/jobs.dart';
import 'package:salary_b4_job_web_portal/presentation/candidate/MyProfile/my_profile.dart';
import 'presentation/candidate/Jobs/job_application_status_screen.dart';
import 'presentation/candidate/Jobs/job_details_screen.dart';
import 'presentation/candidate/Jobs/recommended_jobs_screen.dart';
import 'presentation/candidate/Jobs/saved_jobs_screen.dart';
import 'presentation/candidate/MyProfile/my_wallet_screen.dart';
import 'presentation/candidate/homescreen.dart';
import 'presentation/splash/splash_screen.dart';
import 'provider/menu_provider.dart';
import 'utils/constants/const_colors.dart';
import 'widgets/navigation_bar.dart';

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(), // Wrap your app
//       ),
//     );
void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
      debugShowCheckedModeBanner: false,
      title: 'Salary B4 Job',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        canvasColor: primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
              bodyLarge: const TextStyle(color: textPrimary),
              bodyMedium: const TextStyle(color: textPrimary),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/jobs': (context) => const JobsScreen(),
        '/my_profile': (context) => const MyProfileScreen(),
        '/recommended_jobs': (context) => const RecommendedJobsScreen(),
        '/job_detail': (context) => const JobDetailScreen(),
        '/saved_jobs': (context) => const SavedJobsScreen(),
        '/application_status': (context) => const JobApplicationStatusScreen(),
        '/my_wallet': (context) => const MyWalletScreen(),

        // Add other routes as needed
      },
      onUnknownRoute: (settings) {
        // Handle unknown routes by navigating to a specific route or showing an error screen
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('404 - Page Not Found'),
            ),
          ),
        );
      },
      // home: const SplashScreen(),
      // home: const CandidateHomeScreen(),
    );
  }
}
