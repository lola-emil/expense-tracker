import 'dart:ui';

import 'package:expense_tracker/features/tracker/presentation/pages/addrecord_page.dart';
import 'package:expense_tracker/features/tracker/presentation/widgets/category_item.dart';
import 'package:expense_tracker/features/tracker/presentation/widgets/doughtnut_chart.dart';
import 'package:expense_tracker/features/tracker/presentation/widgets/drawer_menu.dart';
import 'package:expense_tracker/features/tracker/presentation/widgets/transaction_list_item.dart';
import 'package:expense_tracker/shared/color/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerMenu(),
      floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          elevation: 1,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => const AddRecordPage()));
          },
          child: const Icon(FluentIcons.add_12_regular)),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: const Color.fromARGB(82, 10, 10, 10),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(1),
                child: Container(
                  height: 1,
                  color: CustomColorScheme.mySurface,
                ),
              ),
              leading: IconButton(
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  icon: const Icon(FluentIcons.list_16_regular)),
              title: const Text(
                "Overview",
                style: TextStyle(fontSize: 16),
              ),
              elevation: 0,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          const FractionallySizedBox(
              widthFactor: .9,
              child: Text(
                "December 2024",
                style:
                    TextStyle(fontSize: 16 * 1.25, fontWeight: FontWeight.w500),
              )),
          const SizedBox(
            height: 16,
          ),
          const DoughnutChart(),
          const SizedBox(
            height: 16,
          ),
          Divider(
            height: 1,
            indent: (screenWidth - (screenWidth * .93333)) / 2,
            endIndent: (screenWidth - (screenWidth * .93333)) / 2,
            color: CustomColorScheme.mySurface,
          ),
          const SizedBox(
            height: 16,
          ),
          // Categories section
          const FractionallySizedBox(
            widthFactor: .9,
            child: Column(
              children: [
                CategoryItem(),
                CategoryItem(),
                CategoryItem(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const FractionallySizedBox(
            widthFactor: .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recent Transactions",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                Column(
                  children: [
                    TransactionListItem(
                      category: "Food",
                      description: "Buy a ramen",
                      amount: "- Php 250.00",
                    ),
                    TransactionListItem(
                      category: "Bill",
                      description: "Electricity bill",
                      amount: "- Php 250.00",
                    ),
                    TransactionListItem(
                      category: "Bill",
                      description: "Water Bill",
                      amount: "- Php 250.00",
                    ),
                    TransactionListItem(
                      category: "Rent",
                      description: "Stall",
                      amount: "- Php 250.00",
                    ),
                  ],
                )
              ],
            ),
          ),

          // Scroll padding
          const SizedBox(
            height: 16 * 4,
          )
        ],
      ),
    );
  }
}
