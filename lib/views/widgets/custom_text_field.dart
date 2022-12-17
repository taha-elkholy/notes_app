import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.maxLines,
      this.onSaved,
      this.onChanged,
      this.content});
  final String hint;
  final String? content;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: primaryColor,
      maxLines: maxLines,
      onSaved: onSaved,
      onChanged: onChanged,
      controller: TextEditingController(text: content),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This Field Required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(color: primaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
