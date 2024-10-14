import 'package:event_count_downar/cubits/notes_cubit/notes_cubit.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custem_app_bar.dart';
import 'package:event_count_downar/views/widgets/notes_widget/notes_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          CustomAppBar(
            title: 'الاحداث القادمه',
          image:  AssetImage("assets/images/mlogo.png"),
          ),
          Expanded(child: NotesListView()),
          
        ],
      ),
    );
  }
}
