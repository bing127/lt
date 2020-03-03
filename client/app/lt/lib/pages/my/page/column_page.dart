import 'package:flutter/material.dart';

class ColumnPage extends StatefulWidget {
  @override
  _ColumnPageState createState() => _ColumnPageState();
}

class _ColumnPageState extends State<ColumnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            "专栏作者"
        ),
      ),
    );
  }
}
