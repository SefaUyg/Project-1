import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


bool _iconBool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.yellow,
  brightness: Brightness.light,
  buttonTheme: const ButtonThemeData(buttonColor: Colors.amberAccent),
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _iconBool ? _darkTheme: _lightTheme,
      home: Scaffold(
        appBar: AppBar(title: const Text("Dark & Light Theme ------------------------------------------->"),
        actions: [
            IconButton(onPressed: (){
              setState(() {
                _iconBool = !_iconBool;
              });
            }, icon: Icon(_iconBool ? _iconDark : _iconLight),
            ),
        ]),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customSizedBox(),
                        Text("Welcome!", style: TextStyle(fontSize: 30,color: Colors.red, fontWeight: FontWeight.bold)),
                        customSizedBox(),
                        Center(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, "/loginPage"),
                            child: Text("Logout"),
                        ),
                    )],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget customSizedBox()=>SizedBox(
  height: 50,
);
}