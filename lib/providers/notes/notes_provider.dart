import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/providers/notes/notes_notifier.dart';
import 'package:notes_app/providers/notes/notes_state.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, NotesState>((_) {
  return NotesNotifier();
});
