import 'package:dashboard_app/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TabPanel extends StatefulWidget {
  const TabPanel({Key? key}) : super(key: key);

  @override
  State<TabPanel> createState() => _TabPanelState();
}

class _TabPanelState extends State<TabPanel>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  late List<bool> buttonsIndex =
      List.generate(totalTask + 1, (totalTask) => true, growable: true);
  int totalTask = 0;
  String address = 'Address 1';
  double price = 2340;
  String function = 'Function Data';
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 218, 184, 223),
                              borderRadius: BorderRadius.circular(10)),
                          child: TabBar(
                            indicatorColor: Colors.black,
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
                      // Active Tab
                      ListView.builder(
                        controller: _scrollController,
                        itemCount: totalTask,
                        itemBuilder: (context, index) {
                          final pressedButton = buttonsIndex[index];
                          var buttonState = "Active";
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 218, 184, 223),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Positioned(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      left: 15,
                                      top: 5,
                                      child: customTextField(
                                          context, "Address", address)),
                                  Positioned(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      left: 15,
                                      top: 62,
                                      child: customTextField(
                                          context, "Price", "$price\$")),
                                  Positioned(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    left: 310,
                                    top: 5,
                                    child: customTextField(
                                        context, "Function", function),
                                  ),
                                  Positioned(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    left: 310,
                                    top: 62,
                                    child: customTextField(context, "Date",
                                        intl.DateFormat.yMd().format(date)),
                                  ),
                                  Positioned(
                                    right: 15,
                                    bottom: 12,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: pressedButton
                                              ? MaterialStateProperty.all(
                                                  Colors.black)
                                              : MaterialStateProperty.all(
                                                  Colors.grey[400]),
                                        ),
                                        child: pressedButton
                                            ? Text(buttonState)
                                            : const Text("In-Active"),
                                        onPressed: () {
                                          setState(() {
                                            buttonsIndex[index] =
                                                !pressedButton;
                                          });
                                        }),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      // Passed Tab
                      ListView.builder(
                        controller: _scrollController,
                        itemCount: totalTask,
                        itemBuilder: (context, index) {
                          final pressedButton = buttonsIndex[index];
                          var buttonState = "Active";
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 218, 184, 223),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Positioned(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      left: 15,
                                      top: 5,
                                      child: customTextField(
                                          context, "Address", address)),
                                  Positioned(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      left: 15,
                                      top: 62,
                                      child: customTextField(
                                          context, "Price", "$price\$")),
                                  Positioned(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    left: 310,
                                    top: 5,
                                    child: customTextField(
                                        context, "Function", function),
                                  ),
                                  Positioned(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    left: 310,
                                    top: 62,
                                    child: customTextField(context, "Date",
                                        intl.DateFormat.yMd().format(date)),
                                  ),
                                  Positioned(
                                    right: 15,
                                    bottom: 12,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: pressedButton
                                              ? MaterialStateProperty.all(
                                                  Colors.black)
                                              : MaterialStateProperty.all(
                                                  Colors.grey[400]),
                                        ),
                                        child: pressedButton
                                            ? Text(buttonState)
                                            : const Text("In-Active"),
                                        onPressed: () {
                                          setState(() {
                                            buttonsIndex[index] =
                                                !pressedButton;
                                          });
                                        }),
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
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              totalTask = totalTask + 1;
                            });
                          },
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
    );
  }
}
