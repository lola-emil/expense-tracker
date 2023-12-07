import 'package:expense_tracker/shared/widgets/custom_button.dart';
import 'package:expense_tracker/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth * .93333,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Center(
                child:
                    Text("WELCOME BACK", style: TextStyle(fontSize: 16 * 1.5)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                      text: "SIGN IN",
                      onPressed: () => HomeController.gotoSignInPage(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
