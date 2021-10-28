import 'package:flutter/material.dart';



class TestTestScreen extends StatefulWidget {

  @override
  State<TestTestScreen> createState() => _TestTestScreenState();
}

class _TestTestScreenState extends State<TestTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("qdqsqd"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Test 1 test 0 test -1 "),
            Text("Text 2"),
            Text("Test 3"),


          ],
        ),
      ),
    );


  }
}