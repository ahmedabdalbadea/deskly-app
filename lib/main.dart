import 'package:deskly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const DesklyApp());
}

class DesklyApp extends StatelessWidget {
  const DesklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        primaryTextTheme: GoogleFonts.interTextTheme(),
      ),
    );
  }
}
