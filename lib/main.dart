import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'RegisterPage.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromRGBO(235, 31, 42, 1),
        hintColor: Colors.orange[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Project Login Mahdi'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  bool _visible = false;
  final userController = TextEditingController();
  final pwdController = TextEditingController();
  Future userLogin() async {
    String url =
        "https://mahdimahdiwebsitemobileappflutter.000webhostapp.com/user_login.php";
    setState(() {
      _visible = true;
    });
    var data = {
      'username': userController.text,
      'password': pwdController.text,
    };
    var response = await http.post(url as Uri, body: json.encode(data));
    if (response.statusCode == 200) {
      print(response.body);
      var msg = jsonDecode(response.body);
      if (msg['loginStatus'] == true) {
        setState(() {
          _visible = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(uname: msg['userInfo']['NAME'], key: null,),
          ),
        );
      } else {
        setState(() {
          _visible = false;
          showMessage(msg["message"]);
        });
      }
    } else {
      setState(() {
        _visible = false;
        showMessage("Error during connecting to Server.");
      });
    }
  }
  Future<void> showMessage(String _msg) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_msg),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: _visible,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: LinearProgressIndicator(),
                  ),
                ),
                Container(
                  height: 100.0,
                ),
                Icon(
                  Icons.group,
                  color: Theme.of(context).primaryColor,
                  size: 80.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Login Here',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Theme(
                          data: new ThemeData(
                            primaryColor: Color.fromRGBO(84, 87, 90, 0.5),
                            primaryColorDark: Color.fromRGBO(84, 87, 90, 0.5),
                            hintColor:
                            Color.fromRGBO(84, 87, 90, 0.5), //placeholder color
                          ),
                          child: TextFormField(
                            controller: userController,
                            decoration: InputDecoration(
                              focusedBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelText: 'Enter User Name',
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                              ),
                              border: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              hintText: 'User Name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter User Name';
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Theme(
                          data: new ThemeData(
                            primaryColor: Color.fromRGBO(84, 87, 90, 0.5),
                            primaryColorDark: Color.fromRGBO(84, 87, 90, 0.5),
                            hintColor:
                            Color.fromRGBO(84, 87, 90, 0.5), //placeholder color
                          ),
                          child: TextFormField(
                            controller: pwdController,
                            obscureText: true,
                            decoration: InputDecoration(
                              focusedBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              errorBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              border: new OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(84, 87, 90, 0.5),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelText: 'Enter Password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromRGBO(84, 87, 90, 0.5),
                              ),
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () => {
                              if (_formKey.currentState!.validate()) {userLogin()}
                            },
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Submit',
                                style: TextStyle(fontSize: 18.0,color: Colors.white),

                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterPage()),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Register',
                                style: TextStyle(fontSize: 18.0,color: Colors.white),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}