import 'package:event_count_downar/cubits/notes_cubit/notes_cubit.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custem_app_bar.dart';
import 'package:event_count_downar/views/widgets/notes_widget/notes_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class NotesViewBody extends StatefulWidget {
     NotesViewBody({super.key,required this.color});
  String color;

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          const CustomAppBar(
            title: 'الاحداث القادمه',
          image:  AssetImage("assets/images/mlogo.png"),
          ),
          Expanded(child: NotesListView(color:widget.color)),
          
        ],
      ),
    );
  }
}
