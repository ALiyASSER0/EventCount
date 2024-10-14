import 'package:event_count_downar/models/note_model.dart';
import 'package:event_count_downar/views/widgets/edit_widget/edit_view_body.dart';
import 'package:flutter/material.dart';


class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditNoteViewBody(note: note,),
    );
  }
}
