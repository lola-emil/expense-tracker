import 'package:expense_tracker/shared/color/custom_color_scheme.dart';
import 'package:expense_tracker/shared/widgets/custom_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class AddRecordPage extends StatelessWidget {
  const AddRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: CustomColorScheme.myBackground,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(FluentIcons.chevron_left_12_regular)),
          title: const Text(
            "Add Record",
            style: TextStyle(fontSize: 16),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1,
              color: CustomColorScheme.mySurface,
            ),
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth * .9333,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Category"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Amount"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Note"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(text: "Submit", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
