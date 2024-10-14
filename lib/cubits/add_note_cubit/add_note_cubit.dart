import 'package:event_count_downar/constants/colors.dart';
import 'package:event_count_downar/models/note_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_notes_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNotesInitial());

  addNote(NoteModel note) async {
      emit(AddNotesLoading());
    try {
  var noteBox = Hive.box<NoteModel>(kNoteBox);
  await noteBox.add(note);
  emit(AddNotesSuccess());
}  catch (e) {
  emit(AddNotesFailure(e.toString()));
}
  }
}
