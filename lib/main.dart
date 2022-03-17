import 'dart:io';
import 'dart:ui';
import 'package:dashboard_app/address_summary_section.dart';
import 'package:dashboard_app/tab_panel.dart';
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
      darkTheme:
          ThemeData(primarySwatch: Colors.purple, brightness: Brightness.dark),
      theme: ThemeData(primarySwatch: Colors.purple),
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
  final BoxDecoration _boxDecoration = BoxDecoration(
      color: const Color.fromARGB(255, 181, 144, 187),
      borderRadius: BorderRadius.circular(10));
  Widget _customButton(title, _onPressed) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: _onPressed,
          child: Text(title)),
    );
  }

  int users = 0;

  Widget showSignupDiaglog() {
    final List<TextEditingController> _userName =
        List.generate(12, (index) => TextEditingController());
    final TextEditingController _password = TextEditingController();

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: const Color.fromARGB(255, 181, 144, 187),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 400,
          width: 500,
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      childAspectRatio: 1.3,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 12,
                    itemBuilder: (ctx, index) {
                      return TextFormField(
                        maxLength: 1,
                        controller: _userName[index],
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4)),
                          focusColor: Colors.black,
                          hintText: "Word ${index + 1}",
                          filled: true,
                          fillColor: const Color.fromARGB(255, 218, 184, 223),
                        ),
                        onSaved: (value) {
                          _userName[index].text = value!;
                        },
                      );
                    }),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: _password,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4)),
                            contentPadding: const EdgeInsets.all(8),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 218, 184, 223),
                          ),
                          onSaved: (value) {
                            _password.text = value!;
                          }),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(child: _customButton("Submit", () {}))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showLoginDiaglog() {
    final TextEditingController _password = TextEditingController();

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: const Color.fromARGB(255, 181, 144, 187),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 400,
          width: 500,
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                    contentPadding: const EdgeInsets.all(8),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 218, 184, 223),
                  ),
                  onSaved: (value) {
                    _password.text = value!;
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _customButton("Login", () {})),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: _customButton("Signup", () {
                    showSignupDiaglog();
                  }))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (users == 0)
            ? showLoginDiaglog()
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      //  Grid Layout
                      const Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: AddressSummarySection(),
                          )),
                      Expanded(
                        flex: 6,
                        child: Container(
                            decoration: _boxDecoration,
                            child: const TabPanel()),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
