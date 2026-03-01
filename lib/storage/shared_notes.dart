import 'package:ikt205g26v_02/storage/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedNotes {
  static final SharedNotes _instance = SharedNotes._internal();
  late final SharedPreferences _prefs;

  factory SharedNotes() => _instance;

  SharedNotes._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveNotes(List<Note> notes) async {
    List<String> titles = notes.map((note) => note.title).toList(growable: false);
    List<String> descriptions = notes.map((note) => note.description).toList(growable: false);

    await _prefs.setStringList('note_title', titles);
    await _prefs.setStringList('note_description', descriptions);
  }

  Future<List<Note>> loadNotes() async {
    List<Note> notes = [];

    try {
      List<String>? titles = _prefs.getStringList('note_title');
      List<String>? descriptions = _prefs.getStringList('note_description');

      if (titles == null || descriptions == null) {
        return notes;
      }

      for (int i = 0; i < titles.length; i++) {
        notes.add(Note(titles.elementAt(i), descriptions.elementAt(i)));
      }

      return notes;
    } catch (ignore) {
      return notes;
    }
  }

  Future<void> addNote(Note note) async {
    List<Note> notes = await loadNotes();
    notes.add(note);
    await saveNotes(notes);
  }

  Future<void> deleteNote(int index) async {
    List<Note> notes = await loadNotes();
    notes.removeAt(index);
    await saveNotes(notes);
  }
}
