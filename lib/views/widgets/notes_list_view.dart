import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/providers/notes/notes_provider.dart';
import 'package:notes_app/providers/notes/notes_state.dart';
import 'package:notes_app/views/widgets/note_item.dart';

class NotesListView extends ConsumerWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesState = ref.watch(notesProvider);

    if (notesState is GetNotesSuccess) {
      final notes = notesState.notes;
      if (notes.isEmpty) {
        return const Center(
          child: Text('No Notes Yet, Add one'),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(note: notes.elementAt(index)),
                );
              }),
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}
