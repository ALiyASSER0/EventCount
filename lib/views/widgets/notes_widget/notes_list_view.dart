import 'package:event_count_downar/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:event_count_downar/cubits/notes_cubit/notes_cubit.dart';
import 'package:event_count_downar/models/note_model.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custem_note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        
        if (notes.isEmpty) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset('assets/images/break.png'),
              ),
              const Text(
                "Take a break!",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Pacifico',
                ),
              ),
            ],
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(notes[index].id), 
                  onDismissed: (direction) {
                    final deletedNote = notes[index]; 
                    deletedNote.delete(); 
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes(); 

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${deletedNote.title} dismissed'),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            BlocProvider.of<AddNoteCubit>(context).addNote(deletedNote);
                            BlocProvider.of<NotesCubit>(context).fetchAllNotes(); 

                          },
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: NoteItem(note: notes[index]),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
