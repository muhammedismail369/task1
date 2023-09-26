import 'package:flutter/material.dart';
import 'package:task_1/data/dummydata.dart';

class MyForm2 extends StatefulWidget {
  const MyForm2({super.key});

  @override
  State<MyForm2> createState() => _MyForm2State();
}

class _MyForm2State extends State<MyForm2> {
  List<Map<String, dynamic>> userData = DummyData.users;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
