import 'dart:io';
import 'dart:ui';
import 'package:dashboard_app/home_screen.dart';
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
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  Future<void> showSignupDiaglog(_userNameValidatorFunc, _passValidatorFunc) {
    final List<TextEditingController> _userName =
        List.generate(12, (index) => TextEditingController());
    final TextEditingController _password = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Dialog(
              backgroundColor: const Color.fromARGB(255, 181, 144, 187),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 450,
                width: 550,
                padding: const EdgeInsets.all(18),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 110,
                              childAspectRatio: 1.3,
                              crossAxisSpacing: 50,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: 12,
                            itemBuilder: (context, index) {
                              return TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _userName[index],
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  focusColor: Colors.black,
                                  hintText: "Word ${index + 1}",
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 218, 184, 223),
                                ),
                                validator: _userNameValidatorFunc,
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
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _password,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    contentPadding: const EdgeInsets.all(8),
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 218, 184, 223),
                                  ),
                                  validator: _passValidatorFunc,
                                  onSaved: (value) {
                                    _password.text = value!;
                                  }),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Expanded(
                                child: _customButton("Submit", () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                              }
                            }))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget showLoginDiaglog(_validatorFunc) {
    final TextEditingController _password = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: const Color.fromARGB(255, 181, 144, 187),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 450,
          width: 550,
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _password,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      contentPadding: const EdgeInsets.all(8),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 218, 184, 223),
                    ),
                    validator: _validatorFunc,
                    onSaved: (value) {
                      _password.text = value!;
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: _customButton("Login", () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyHomePage()));
                      }
                    })),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                        child: _customButton("Signup", () {
                      showSignupDiaglog((val) {
                        if (val!.isEmpty) {
                          return "Required*";
                        }
                      }, (val) {
                        if (val!.isEmpty) {
                          return "Please Must Enter Your Password";
                        }
                      });
                    }))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: showLoginDiaglog((val) {
      if (val!.isEmpty) {
        return "Please Must Enter Your Password";
      }
    }));
  }
}
