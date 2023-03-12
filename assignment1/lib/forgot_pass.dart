import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
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


class _ForgotPasswordState extends State<ForgotPassword> {
  late String email, password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Please Write Your Email and New Password!", style: TextStyle(fontSize: 30,color: Colors.red, fontWeight: FontWeight.bold)),
                        customSizedBox(),
                        emailTextField(),
                        customSizedBox(),
                        passwordTextFile(),
                        customSizedBox(),
                        signUpButton(),
                        customSizedBox(),
                        backToLogin(),
                      ],
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

  Center signUpButton() {
    return Center(
                    child: ElevatedButton(
                      onPressed: signIn,
                      child: Text("Change Your Password", style: TextStyle(color: Colors.blue),),),
                  );
  }

  void signIn() async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        try {
                          showDialog(
                barrierDismissible: false,
                context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Successful"),
                  content: Text("Your password is changed!"),
                  actions: <Widget>[
                    MaterialButton(child: Text("Back"),onPressed: ()=>Navigator.pushNamed(context, "/loginPage"),)
                  ],
                );
              });
                        } catch (e) {
                          print(e.toString());
                        }
                      } else {
                      }
                    }
  Center backToLogin() {
    return Center(
                    child: TextButton(
                      onPressed: ()=>Navigator.pushNamed(context, "/loginPage"),
                      child: Text("Back To Login Page", style: TextStyle(color: Colors.blue),),),
                  );
  }

  TextFormField passwordTextFile() {
    return TextFormField(
      validator: (value){
        if (value!.isEmpty) {
          return "Please Fill Here!";
        } else {}
      },
      onSaved: (value){
        password = value!;
      },
      obscureText: true,
      style: TextStyle(color: Colors.purple),
      decoration: customInputDecoration("Password"),
                  );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value){
        if (value!.isEmpty) {
          return "Please Fill Here!";
        } else {}
      },
      onSaved: (value){
        email = value!;
      },
      style: TextStyle(color: Colors.purple),
      decoration: customInputDecoration("Email"),
                  );
  }

Widget customSizedBox()=>SizedBox(
  height: 20,
);

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      )),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                      )
                  );
  }
}