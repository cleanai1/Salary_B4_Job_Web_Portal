import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/candidate/homescreen.dart';
import 'presentation/splash/splash_screen.dart';
import 'utils/constants/const_colors.dart';

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(), // Wrap your app
//       ),
//     );
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      // home: const SplashScreen(),
      home: const CandidateHomeScreen(),
    );
  }
}
