import 'package:flutter/material.dart';

class Abc extends StatefulWidget {
  const Abc({Key? key}) : super(key: key);

  @override
  _AbcState createState() => _AbcState();
}

class _AbcState extends State<Abc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Abc",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
