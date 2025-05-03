
import 'package:flutter/cupertino.dart';
import 'package:notes/note.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNote(String content) {
    final newNote = Note(id: DateTime.now().toString(), content: content);
    _notes.add(newNote);
    notifyListeners();
  }

  void removeNote(String id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }
}