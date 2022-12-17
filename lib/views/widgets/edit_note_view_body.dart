import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/providers/notes/notes_provider.dart';
import 'package:notes_app/providers/notes/notes_state.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends ConsumerStatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends ConsumerState<EditNoteViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    ref.listen(notesProvider, (_, current) {
      if (current is UpdateNoteSuccess) {
        Navigator.of(context).pop();
      }
    });
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onTap: () async {
              if (title != widget.note.title ||
                  subTitle != widget.note.subTitle) {
                final note =
                    widget.note.copyWith(title: title, subTitle: subTitle);
                await ref.read(notesProvider.notifier).updateNote(
                      widget.note.key,
                      note,
                    );
              }
            },
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            hint: 'Title',
            content: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'Content',
            content: widget.note.subTitle,
            onChanged: (value) {
              subTitle = value;
            },
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
