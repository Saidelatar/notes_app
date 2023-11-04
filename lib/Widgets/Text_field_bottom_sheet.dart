import 'package:flutter/material.dart';

class TextFieldBottomSheet extends StatelessWidget {
  final String hint;
  final Function(String?)? onSaved;
  final int maxLines;
  final Function(String)? onChanged ;
  const TextFieldBottomSheet(
      {super.key, required this.hint, this.onSaved, this.maxLines = 1, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data?.isEmpty ?? true) {
          return 'Field is requierd';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      onSaved: onSaved,
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: hint,
          //  hintStyle: TextStyle(color: Color(0xffffcc80)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          )),
    );
  }
}
