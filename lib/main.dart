import 'package:flutter/material.dart';
import 'package:ikt205g26v_02/pages/home.dart';
import 'package:ikt205g26v_02/storage/shared_notes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedNotes().init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CloudNotes',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.light),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
