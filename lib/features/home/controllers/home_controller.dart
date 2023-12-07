import 'package:expense_tracker/features/auth/presentation/pages/signin_page.dart';
import 'package:flutter/material.dart';

class HomeController {
  static void gotoSignInPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (builder) => const SignInPage()));
  }
}
