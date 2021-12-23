import 'package:flutter/material.dart';
import 'package:interview_test/show_image_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context)=> const ShowImageScreen(url: "https://dog.ceo/api/breeds/image/random")));
          }, child: const Text("Fetch"),
        ),
      ),
    );
  }
}
