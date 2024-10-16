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
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, builder: (context){
            
          return const AddNoteBottomSheet();
          });
        },
        child:const Icon(Icons.add)),
      body: const NotesViewBody(),
    );
  }
}
