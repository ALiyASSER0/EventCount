import 'package:flutter/material.dart';

class CustemTextField extends StatelessWidget {
  const CustemTextField(
      {super.key, required this.hint, this.maxlines = 1, this.onSaved, this.onChange});
  final String hint;
  final int maxlines;
  final void Function(String)? onChange;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        } else {
          return null;
        }
      },
      cursorColor: const Color.fromARGB(255, 0, 0, 0),
      maxLines: maxlines,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(const Color.fromARGB(255, 0, 0, 0))),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? const Color.fromARGB(255, 0, 0, 0)));
  }
}
