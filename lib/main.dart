import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:deskly_app/core/utils/app_bloc_observer.dart';
import 'package:deskly_app/core/utils/app_router.dart';
import 'package:deskly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupServiceLocator();
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
