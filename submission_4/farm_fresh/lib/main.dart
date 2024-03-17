import 'package:farm_fresh/screens/auth/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farm_fresh/providers/theme_provider.dart';
import 'package:farm_fresh/root_screen.dart';

import 'consts/theme_data.dart';
import 'screens/auth/login.dart';
import 'screens/auth/register.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        })
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Farm Fresh',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),

          home: const RootScreen(),
          // home: const LoginScreen(),

            routes: {
            RootScreen.routeName: (context) => const RootScreen(),
            RegisterScreen.routName: (context) => const RegisterScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            ForgotPasswordScreen.routeName: (context) =>
              const ForgotPasswordScreen(),
          },
        );
      }),
    );
  }
}
