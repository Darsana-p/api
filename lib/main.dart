import 'package:api_integration/providers/auth_provider.dart';
import 'package:api_integration/providers/branch_provider.dart';
import 'package:api_integration/providers/patient_provider.dart';
import 'package:api_integration/providers/treatment_provider.dart';
import 'package:api_integration/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>authprovider()),
      ChangeNotifierProvider(create: (_)=>branch_provider()),
      ChangeNotifierProvider(create: (_)=>patient_provider()),
      ChangeNotifierProvider(create: (_)=>treatment_provider())
    ],
      child: MaterialApp(

        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}

