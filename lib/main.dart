import 'package:expense_tracker/features/tracker/presentation/pages/overview_page.dart';
import 'package:expense_tracker/shared/color/custom_color_scheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const CustomColorScheme(),
        useMaterial3: true,
      ),
      home: const OverviewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
