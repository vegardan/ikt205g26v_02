import 'package:flutter/material.dart';
import 'package:ikt205g26v_02/storage/note_service.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});

  @override
  State<StatefulWidget> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 6, title: Text('New Note')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  maxLines: 1,
                  decoration: const InputDecoration(labelText: 'Title', border: OutlineInputBorder()),
                  validator: (value) => value == null || value.isEmpty ? 'Title required' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _textController,
                  maxLines: 20,
                  decoration: const InputDecoration(labelText: 'Text', border: OutlineInputBorder(), alignLabelWithHint: true),
                  validator: (value) => value == null || value.isEmpty ? 'Text required' : null,
                ),
                const SizedBox(height: 12),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    await NoteService().createNote(_titleController.text.trim(), _textController.text.trim());

                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.save),
                  label: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
