import 'package:flutter/material.dart';
import 'package:ikt205g26v_02/storage/note.dart';

class DetailsPage extends StatelessWidget {
  final Note note;

  const DetailsPage(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 6, title: Text(note.title)),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16), child: Text(note.description)),
      ),
    );
  }
}
