import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:dwa2y/Pages/home_screen.dart';
import 'package:dwa2y/Pages/introductionscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthRouter extends GetView<AuthServices> {
  const AuthRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.currentuser.value!=null?const HomeScreen():const IntroductionPage();
  }
}