import 'package:expense_tracker/shared/widgets/custom_button.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/form_input.dart';
import 'package:flutter/material.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormInput(
          labelText: "Username",
          icon: Icons.person,
          obscureText: false,
          onChanged: (value) {},
        ),
        const SizedBox(height: 16),
        FormInput(
          labelText: "Password",
          icon: Icons.lock,
          obscureText: true,
          onChanged: (value) {},
        ),
        const SizedBox(height: 16),
        CustomButton(text: "Sign In", onPressed: () {})
      ],
    );
  }
}
