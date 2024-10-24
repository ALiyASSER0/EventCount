import 'package:event_count_downar/events/Tasks_details.dart';
import 'package:event_count_downar/events/editTasks.dart';
import 'package:event_count_downar/models/note_model.dart';
import 'package:event_count_downar/routing/routes.dart';
import 'package:event_count_downar/views/edit_note_view.dart';
import 'package:flutter/material.dart';


class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) 
  {
    return Container(
      padding: const EdgeInsets.only(bottom: 24, top: 24, left: 10),
      decoration: BoxDecoration(
          image: const DecorationImage(
          image: AssetImage("assets/images/imag.png"), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              note.title,
              style: const TextStyle(color: Colors.white, fontSize: 26),
            ),
            subtitle: Padding
            (
              padding: const EdgeInsets.only(top: 10),
              child: Text(note.description,
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
            ),
      
            trailing: Padding
            (
              padding: const EdgeInsets.only(bottom: 20),
              child: IconButton(
                  onPressed: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) 
                    {
                      return EditTasks
                      (
                        note: note,
                      );
                    }),
                  );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 25,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(note.endDate,
                style: const TextStyle(color: Colors.white, fontSize: 16)),
          )
        ],
      ),
    );
  }
}
