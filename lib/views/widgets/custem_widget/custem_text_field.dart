import 'package:flutter/material.dart';

class CustemTextField extends StatelessWidget 
{
  const CustemTextField
  (
      {super.key,  this.hint, this.maxlines = 1, this.onSaved, this.onChange,required this.label});
  final String ? hint,label;
  final int maxlines;
  final void Function(String)? onChange;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField
    (
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
      decoration: InputDecoration
      (
        labelText: label,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(Colors.blue)),

    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: color ?? const Color.fromARGB(255, 0, 0, 0)));
  }
}
