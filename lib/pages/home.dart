import 'package:flutter/material.dart';
import 'package:ikt205g26v_02/pages/new_note.dart';
import 'package:ikt205g26v_02/widgets/note_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Key _listKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 6, title: Text('CloudNotes')),
      body: NoteListWidget(key: _listKey),
      floatingActionButton: FloatingActionButton(
        tooltip: 'New note',
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewNotePage()));
          setState(() {
            _listKey = UniqueKey();
          });
        },
        child: Icon(Icons.note_add),
      ),
    );
  }
}
