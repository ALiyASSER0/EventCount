import 'package:event_count_downar/cubits/notes_cubit/notes_cubit.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custem_app_bar.dart';
import 'package:event_count_downar/views/widgets/installments_widget/installments_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstallmentsViewBody extends StatefulWidget {
  const InstallmentsViewBody({super.key});

  @override
  State<InstallmentsViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<InstallmentsViewBody> {
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
            title: 'الاقساط القادمه',
          image:  AssetImage("assets/images/mlogo.png"),
          ),
          Expanded(child: InstallmentsListView()),
          
        ],
      ),
    );
  }
}
