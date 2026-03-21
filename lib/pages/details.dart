import 'package:flutter/material.dart';
import 'package:ikt205g26v_02/pages/edit_note.dart';
import 'package:ikt205g26v_02/storage/note.dart';

class DetailsPage extends StatefulWidget {
  final Note note;

  const DetailsPage(this.note, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 6,
        title: Text(widget.note.title),
        actions: [
          IconButton(
            onPressed: () async {
              bool updated = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditNotePage(widget.note)));

              if (updated) {
                setState(() {});
              }
            },
            icon: Icon(Icons.edit_note),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16), child: Text(widget.note.text)),
      ),
    );
  }
}
