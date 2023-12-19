import 'dart:ui';

import 'package:expense_tracker/features/tracker/model/expense_model.dart';
import 'package:expense_tracker/features/tracker/presentation/widgets/drawer_menu.dart';
import 'package:expense_tracker/features/tracker/presentation/widgets/transaction_list_item.dart';
import 'package:expense_tracker/shared/color/custom_color_scheme.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/features/tracker/repository/expense_repository.dart'
    as expense_repository;

class RecordsPage extends StatefulWidget {
  const RecordsPage({super.key});

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late ScaffoldMessengerState _snackbar;

  bool isLoading = false;
  bool isError = false;
  List<ExpenseModel> expenseList = List.of([]);

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      List<ExpenseModel> list = await expense_repository.getTransactions();

      setState(() {
        expenseList = list;
      });
    } catch (error) {
      print(error);
      setState(() {
        isError = true;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchSearchedData(String query) async {
    setState(() {
      isLoading = true;
    });

    try {
      List<ExpenseModel> list =
          await expense_repository.searchTransaction(query);

      setState(() {
        expenseList = list;
      });
    } catch (error) {
      print(error);
      setState(() {
        isError = true;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> deleteTransaction(String transactionId) async {
    try {
      String message =
          await expense_repository.deleteTransaction(transactionId);
      fetchData();
      _snackbar.showSnackBar(SnackBar(content: Text(message)));
    } catch (error) {
      setState(() {
        isError = true;
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
    _snackbar = ScaffoldMessenger.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerMenu(),
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
                "Transactions",
                style: TextStyle(fontSize: 16),
              ),
              elevation: 0,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            FractionallySizedBox(
              widthFactor: .9,
              child: SizedBox(
                height: 45,
                child: TextFormField(
                  onChanged: (value) {
                    fetchSearchedData(value);
                  },
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Search")),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              flex: 1,
              child: FractionallySizedBox(
                widthFactor: .9,
                child: Builder(builder: (context) {
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
                              onPressed: () => fetchData(),
                              child: const Text("Refresh"))
                        ],
                      ),
                    );
                  }

                  return ListView(
                    children: List.generate(
                      expenseList.length,
                      (index) => TransactionListItem(
                          onDelete: (id) {
                            deleteTransaction(id);
                          },
                          itemId: expenseList[index].id,
                          deleteButtonVisible: true,
                          category: expenseList[index].category,
                          description: expenseList[index].note,
                          amount: "- Php ${expenseList[index].amount}"),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
