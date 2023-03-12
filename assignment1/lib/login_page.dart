import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
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

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  late String username;
  late String password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _iconBool ? _darkTheme: _lightTheme,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: const Text("Dark & Light Theme ------------------------------------------->"),
        actions: [
            IconButton(onPressed: (){
              setState(() {
                _iconBool = !_iconBool;
              });
            }, icon: Icon(_iconBool ? _iconDark : _iconLight),
            ),
        ]),
        
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)
                          ),
                          labelText: "User Name",
                          labelStyle: TextStyle(color: Colors.purple),
                          border: OutlineInputBorder()
                        ),
                        validator:(value){
                          if (value!.isEmpty) {
                            return "Please Fill This Area!";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value){
                          username = value!;
                        },
                      ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.purple),
                          border: OutlineInputBorder()
                        ),
                        validator:(value){
                          if (value!.isEmpty) {
                            return "Please Fill This Area!";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        onSaved: (value){
                          password = value!;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          MaterialButton(
                          child: TextButton(
                            onPressed: () => Navigator.pushNamed(context, "/signUp"),
                            child: Text("Sign Up", style: TextStyle(color: Colors.red))
                          ),
                          onPressed: (){},
                          ),
                          MaterialButton(
                          child: TextButton(
                            onPressed: () => Navigator.pushNamed(context, "/forgotPassword"),
                            child: Text("Forgot Password", style: TextStyle(color: Colors.red))),
                          onPressed: () {},
                          ),
                        ],
                      ),
                      _loginButton()
                  ],
                ),
              ),
             ),
          ),
        ),
      ),
    );
  }
  Widget _loginButton() => ElevatedButton(
        child: Text("Sign In"),
        onPressed: () {
          if (_formKey.currentState!.validate()){
            _formKey.currentState!.save();
              try {
                Navigator.pushReplacementNamed(context, "/homePage");
              } catch (e) {
                print(e.toString());
              }
            } else {
              showDialog(
                barrierDismissible: false,
                context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Error"),
                  content: Text("Please Fill These Areas!"),
                  actions: <Widget>[
                    MaterialButton(child: Text("Back"),onPressed: ()=>Navigator.pop(context))
                  ],
                );
              });
          
            }
});
}