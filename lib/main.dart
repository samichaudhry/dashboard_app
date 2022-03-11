import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle("App Name");
    setWindowMinSize(const Size(1100, 720));
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
      darkTheme: ThemeData.dark(),
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int selectedTab = 0;
  late TabController _tabController;

  final BoxDecoration _boxDecoration = BoxDecoration(
      color: const Color.fromARGB(255, 181, 144, 187),
      borderRadius: BorderRadius.circular(10));

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                //  Grid Layout
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: _boxDecoration,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                decoration: _boxDecoration,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Expanded(
                  flex: 6,
                  child: Container(
                      decoration: _boxDecoration,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 218, 184, 223),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TabBar(
                                              tabs: const [
                                                Tab(text: "Active"),
                                                Tab(text: "Passed")
                                              ],
                                              controller: _tabController,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: TabBarView(
                                      controller: _tabController,
                                      children: [
                                        ListView.builder(
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 218, 184, 223),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      right: 15,
                                                      bottom: 15,
                                                      child: ElevatedButton(
                                                          child: const Text(
                                                              "Active"),
                                                          onPressed: () {}),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        ListView.builder(
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 218, 184, 223),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      right: 15,
                                                      bottom: 15,
                                                      child: ElevatedButton(
                                                          child: const Text(
                                                              "Active"),
                                                          onPressed: () {}),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Stack(children: [
                                        Positioned(
                                          right: 10,
                                          bottom: 10,
                                          child: FloatingActionButton(
                                            onPressed: () {},
                                            child: const Icon(Icons.add),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
