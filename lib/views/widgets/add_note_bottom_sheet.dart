import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/providers/notes/notes_provider.dart';
import 'package:notes_app/providers/notes/notes_state.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends ConsumerWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(notesProvider, (_, currentState) {
      if (currentState is AddNoteSuccess) {
        Navigator.of(context).pop();
      }
    });

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: const AddNoteForm(),
    );
  }
}

class AddNoteForm extends ConsumerStatefulWidget {
  const AddNoteForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends ConsumerState<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(notesProvider) is NotesLoading ? true : false;
    
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AbsorbPointer(
          absorbing: isLoading,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                  onSaved: (value) {
                    title = value;
                  },
                  hint: 'Title'),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                onSaved: (value) {
                  subTitle = value;
                },
                hint: 'Content',
                maxLines: 3,
              ),
              const SizedBox(
                height: 16,
              ),
              const ColorsListView(),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final color = ref.watch(colorsProvider);
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      final note = Note(
                        title: title!,
                        subTitle: subTitle!,
                        date: getFormattedCurrentDate(),
                        color: color,
                      );
                      await ref.read(notesProvider.notifier).addNote(note);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: primaryColor,
                  ),
                  child: ModalProgressHUD(
                    inAsyncCall: isLoading,
                    child: const Text(
                      'Add',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getFormattedCurrentDate() {
    final currentDate = DateTime.now();
    return DateFormat('dd-mm-yyyy').format(currentDate);
  }
}
