import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pm/UI/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pm/auth/login_screen.dart';
import 'package:pm/auth/signup_provider.dart';
import 'package:pm/auth/signup_screen.dart';
import 'package:pm/homepage_screen.dart';
import 'package:pm/list_screen.dart';
import 'package:pm/task_provider.dart';
import 'package:pm/taskt2.dart';
import 'package:pm/test.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => SignupProvider()),
      ChangeNotifierProvider(create: (_) => game2Provider()),
    ],
child: ResponsiveSizer(
  builder: (p0, p1, p2) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: ListScreen(),
      // home: HomepageScreen(),
      // home: LoginScreen(),
      home: SplashScreen(),
      // home: test(),
    );
  },
),
    );




  }
}

