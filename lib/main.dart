import 'package:flutter/material.dart';
import 'package:notes_app/views/notes_view.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 28),
          titleMedium: TextStyle(fontSize: 26),
          titleSmall: TextStyle(fontSize: 18),
        ),
      ),
      home: const NotesView(),
    );
  }
}
