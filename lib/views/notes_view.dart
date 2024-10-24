import 'package:event_count_downar/events/Tasks_details.dart';
import 'package:event_count_downar/routing/routes.dart';
import 'package:event_count_downar/views/widgets/bottom_sheet/add_note_bottom_sheet.dart';
import 'package:event_count_downar/views/widgets/notes_widget/notes_view_body.dart';
import 'package:flutter/material.dart';


class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
       FloatingActionButton(
        foregroundColor: const Color.fromARGB(255, 45, 137, 213),
        backgroundColor:Colors.white,
        onPressed: ()
        {
          Navigator.pushNamed(context,Routes.addEvent);
        },
        child:const Icon(Icons.add)),
      body: const NotesViewBody(),
    );
  }
}
