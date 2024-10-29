import 'package:event_count_downar/constants/colors.dart';
import 'package:event_count_downar/models/note_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  fetchAllNotes() async {
    var noteBox = Hive.box<NoteModel>(kNoteBox);
    notes = noteBox.values.toList();

    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');

    notes?.sort((a, b) {
      final aDateTime = dateFormat.parse('${a.endDate} ${a.endTime}');
      final bDateTime = dateFormat.parse('${b.endDate} ${b.endTime}');
      return aDateTime.compareTo(bDateTime);
    });

    emit(NotesSuccess());
  }
}
