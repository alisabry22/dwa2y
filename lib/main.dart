import 'package:dwa2y/Bindings/binding.dart';
import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:dwa2y/Pages/AuthPages/auth_route.dart';
import 'package:dwa2y/Pages/home_screen.dart';
import 'package:dwa2y/Pages/introductionscreen.dart';
import 'package:dwa2y/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return  GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home:const AuthRouter(),
    );
  }
}
