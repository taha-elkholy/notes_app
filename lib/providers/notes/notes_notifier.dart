import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/providers/notes/notes_state.dart';

const String _errorMessage = 'Something went wrong...';

class NotesNotifier extends StateNotifier<NotesState> {
  NotesNotifier() : super(NotesInitial()) {
    getNotes();
  }

  void getNotes() {
    var notesBox = Hive.box<Note>(noteBoxKey);
    final notes = notesBox.values;
    state = GetNotesSuccess(
      notes: notes.toList().reversed,
    );
  }

  Future<void> addNote(Note note) async {
    state = NotesLoading();
    try {
      var noteBox = Hive.box<Note>(noteBoxKey);
      await noteBox.add(note);
      state = AddNoteSuccess();
    } catch (e) {
      state = NotesFailure(
        failureMessage: '$_errorMessage\n$e',
      );
    }
  }

  Future<void> updateNote(key, Note note) async {
    state = NotesLoading();
    try {
      var noteBox = Hive.box<Note>(noteBoxKey);
      await noteBox.put(key, note);
      state = UpdateNoteSuccess();
    } catch (e) {
      state = NotesFailure(
        failureMessage: '$_errorMessage\n$e',
      );
    }
  }
}
