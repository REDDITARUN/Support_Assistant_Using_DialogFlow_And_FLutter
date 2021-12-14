import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bot/dialog_flow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Mukham Assist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.teal),
      ),
      home: FlutterFactsChatBot(),
    );
  }
}
