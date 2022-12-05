import 'package:dwa2y/Controllers/AuthRepositories/auth_services.dart';
import 'package:dwa2y/Pages/AuthPages/signin_screen.dart';
import 'package:dwa2y/Pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthRouter extends GetView<AuthServices> {
  const AuthRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.currentuser.value!=null?const DashBoardPage(): SignInScreen(),
    );
  }
}