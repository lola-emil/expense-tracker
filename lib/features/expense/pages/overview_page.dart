import 'package:expense_tracker/features/expense/pages/addrecord_page.dart';
import 'package:expense_tracker/features/expense/widgets/doughtnut_chart.dart';
import 'package:expense_tracker/features/expense/widgets/drawer_menu.dart';
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
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerMenu(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (builder) => const AddRecordPage()));
          }, child: const Icon(FluentIcons.add_12_regular)),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: CustomColorScheme.myBackground,
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
      body: ListView(
        children: const [
          SizedBox(
            height: 16,
          ),
          FractionallySizedBox(
              widthFactor: .9,
              child: Text(
                "December 2024",
                style:
                    TextStyle(fontSize: 16 * 1.25, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 16,
          ),
          DoughnutChart(),
        ],
      ),
    );
  }
}
