import 'package:expense_tracker/shared/color/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double containerWidth = (screenWidth * .93333) * .9;

    return Drawer(
      width: screenWidth * .9,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        color: CustomColorScheme.myBackground,
        child: SizedBox(
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: containerWidth,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 16,),
                    Text(
                      "Fcku Tony",
                      style: TextStyle(fontSize: 16 * 1.15),
                    ),
                    Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 16, color: CustomColorScheme.myPrimary),
                    )
                  ],
                ),
              ),
              Divider(
                height: 1,
                indent: (screenWidth - (screenWidth * .93333)) / 2,
                endIndent: (screenWidth - (screenWidth * .93333)) / 2,
                color: CustomColorScheme.mySurface,
              )
            ],
          ),
        ),
      ),
    );
  }
}
