import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> _register() async {
    final id = _idController.text;
    final name = _nameController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;
    final String url =
        'https://mahdimahdiwebsitemobileappflutter.000webhostapp.com/add_users.php';
    final Map<String, dynamic> data = {
      'id': id,
      'name': name,
      'username': username,
      'password': password,
    };
    final String jsonData = json.encode(data);
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonData,
      );
      if (response.statusCode == 200) {
        print('Data uploaded successfully!');
      } else {
        print('Error uploading data: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.red[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _idController,
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
                      color: Color.fromRGBO(235, 31, 42, 1),
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  labelText: 'Enter ID',
                  prefixIcon: const Icon(
                    Icons.confirmation_number,
                    color: Color.fromRGBO(84, 87, 90, 0.5),
                  ),
                  border: new OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(84, 87, 90, 0.5),
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: 'ID',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an ID';
                  }
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: _nameController,
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
                  labelText: 'Enter Your Name',
                  prefixIcon: const Icon(
                    Icons.person_outline_outlined,
                    color: Color.fromRGBO(84, 87, 90, 0.5),
                  ),
                  border: new OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(84, 87, 90, 0.5),
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: 'Name',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Name';
                  }
                },
              ),SizedBox(height: 10,),
              TextFormField(
                controller: _usernameController,
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
                    Icons.supervised_user_circle_outlined,
                    color: Color.fromRGBO(84, 87, 90, 0.5),
                  ),
                  border: new OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(84, 87, 90, 0.5),
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: 'User Name',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Username';
                  }
                },
              ),SizedBox(height: 10,),
              TextFormField(
                controller: _passwordController,
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
                  labelText: 'Enter a Password',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Color.fromRGBO(84, 87, 90, 0.5),
                  ),
                  border: new OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(84, 87, 90, 0.5),
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Password';
                  }
                },
              ),SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  if (Form.of(context)!.validate()) {
                    _register();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                          title: 'My Custom Title',
                          key: null,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Submit',style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
