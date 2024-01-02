import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  final String uname;
  HomePage({Key? key, required this.uname}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String greeting = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${widget.uname}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Hello, ${widget.uname}!",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  greeting = 'Have a great day!';
                });
              },
              child: Text('Say Hello'),
            ),
            SizedBox(height: 20),
            if (greeting.isNotEmpty)
              Center(
                child: Text(
                  greeting,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            SizedBox(height: 20),
            Image.network(
              'https://t3.ftcdn.net/jpg/03/67/35/72/360_F_367357209_BG07SVnnB4HSHSaMiHajfZhrZZAE859A.jpg',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
