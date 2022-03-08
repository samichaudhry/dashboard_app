import 'dart:io';

import 'package:dashboard_app/expense.dart';
import 'package:dashboard_app/income.dart';
import 'package:dashboard_app/latest_transaction.dart';
import 'package:dashboard_app/navigation_button.dart';
import 'package:dashboard_app/search_bar.dart';
import 'package:dashboard_app/statistics_by_category.dart';
import 'package:dashboard_app/upgrade_account.dart';
import 'package:dashboard_app/your_cards.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle("App Name");
    setWindowMinSize(const Size(1100, 750));
    setWindowMaxSize(Size.infinite);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Name',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffe0efff),
          primarySwatch: Colors.yellow),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Row(
            children: [
              // Navigation Panel
              Container(
                constraints: const BoxConstraints(minWidth: 80),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                        foregroundImage: AssetImage("assets/logo.png"),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          navigationButton(Icons.home, () {
                            setState(() {
                              selectedTab = 1;
                            });
                          }, selectedTab == 1),
                          navigationButton(Icons.person, () {
                            setState(() {
                              selectedTab = 2;
                            });
                          }, selectedTab == 2),
                          navigationButton(Icons.bar_chart_rounded, () {
                            setState(() {
                              selectedTab = 3;
                            });
                          }, selectedTab == 3),
                          navigationButton(Icons.pie_chart, () {
                            setState(() {
                              selectedTab = 4;
                            });
                          }, selectedTab == 4),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      )
                    ]),
              ),
              //  Grid Layout
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Search Panel
                        const SizedBox(height: 100, child: SearchBar()),
                        // Remaining Layout
                        Expanded(
                            child: Row(
                          children: [
                            // Center Panel
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: const [
                                        Flexible(child: ExpensePanel()),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(child: IncomePanel()),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 18.0,
                                      ),
                                      child: UpgradeProAccount(),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 2,
                                    child: LatestTransactionPanel(),
                                  ),
                                ],
                              ),
                              flex: 5,
                            ),

                            // Right Panel
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Column(
                                  children: [
                                    Expanded(child: YourCardPanel()),
                                    const Expanded(
                                      flex: 2,
                                      child: SatisticsByCategoryPanel(),
                                    ),
                                  ],
                                ),
                              ),
                              flex: 2,
                            )
                          ],
                        ))
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
