import 'dart:ui';

import 'package:expense_tracker/features/tracker/model/overview_model.dart';
import 'package:expense_tracker/features/tracker/model/transaction_mode.dart';
import 'package:expense_tracker/features/tracker/presentation/pages/addrecord_page.dart';
import 'package:expense_tracker/features/tracker/presentation/widgets/category_item.dart';
import 'package:expense_tracker/features/tracker/presentation/widgets/doughtnut_chart.dart';
import 'package:expense_tracker/features/tracker/presentation/widgets/drawer_menu.dart';
import 'package:expense_tracker/features/tracker/presentation/widgets/transaction_list_item.dart';
import 'package:expense_tracker/shared/color/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:expense_tracker/features/tracker/repository/expense_repository.dart'
    as expense_repository;

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;
  bool isError = false;

  late List<OverviewModel> overviewList;
  late List<TransactionModel> recentTransactions;

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final overviewValue = await expense_repository.getOverview();
      final recentTransactionsValue =
          await expense_repository.getRecentTransactions();

      setState(() {
        overviewList = overviewValue;
        recentTransactions = recentTransactionsValue;
      });
    } catch (error) {
      setState(
        () {
          isError = true;
        },
      );
      // Handle the error appropriately, e.g., show an error message to the user.
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerMenu(
      ),
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
      body: Builder(builder: (context) {
        if (isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (isError) {
          return Center(
            child: Column(
              children: [
                const Text("An error occured"),
                ElevatedButton(
                    onPressed: () => fetchData(), child: const Text("Refresh"))
              ],
            ),
          );
        }

        return ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            const FractionallySizedBox(
                widthFactor: .9,
                child: Text(
                  "December 2024",
                  style: TextStyle(
                      fontSize: 16 * 1.25, fontWeight: FontWeight.w500),
                )),
            const SizedBox(
              height: 16,
            ),
            DoughnutChart(
              overviewList: overviewList,
            ),
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
            FractionallySizedBox(
              widthFactor: .9,
              child: Column(
                children: List.generate(
                    overviewList.length,
                    (index) => CategoryItem(
                        category: overviewList[index].category,
                        percent: overviewList[index].percentage)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FractionallySizedBox(
              widthFactor: .9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Recent Transactions",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  Column(
                    children: List.generate(
                        recentTransactions.length,
                        (index) => TransactionListItem(
                            category: recentTransactions[index].category,
                            description: recentTransactions[index].note,
                            amount:
                                "- Php ${recentTransactions[index].amount}")),
                  )
                ],
              ),
            ),

            // Scroll padding
            const SizedBox(
              height: 16 * 4,
            )
          ],
        );
      }),
    );
  }
}
