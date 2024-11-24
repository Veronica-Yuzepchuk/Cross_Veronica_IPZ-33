import 'package:flutter/material.dart';
import './page.dart';
import './theme-config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getTheme(),
      home: NotesPage(),
    );
  }
}