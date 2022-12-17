import 'package:notes_app/models/note.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class AddNoteSuccess extends NotesState {}

class UpdateNoteSuccess extends NotesState {}

class GetNotesSuccess extends NotesState {
  final Iterable<Note> notes;

  GetNotesSuccess({required this.notes});
}

class NotesFailure extends NotesState {
  final String failureMessage;

  NotesFailure({required this.failureMessage});
}
