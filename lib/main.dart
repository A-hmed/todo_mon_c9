import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_mon_c9/providers/list_provider.dart';
import 'package:todo_mon_c9/ui/screens/auth/login/login_screen.dart';
import 'package:todo_mon_c9/ui/screens/auth/register/register_screen.dart';
import 'package:todo_mon_c9/ui/screens/splash/splash_screen.dart';
import 'package:todo_mon_c9/ui/utils/app_theme.dart';
import 'ui/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (_) => ListProvider(),
      child: const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen()
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}