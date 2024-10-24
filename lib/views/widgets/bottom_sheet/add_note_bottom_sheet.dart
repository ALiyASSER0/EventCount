// import 'package:event_count_downar/cubits/add_note_cubit/add_note_cubit.dart';
// import 'package:event_count_downar/cubits/notes_cubit/notes_cubit.dart';
// import 'package:flutter/material.dart';

// import 'add_note_form.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AddNoteBottomSheet extends StatelessWidget {
//   const AddNoteBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context)=>AddNoteCubit(),
//       child: BlocConsumer<AddNoteCubit, AddNoteState>(
//           listener: (context, state) {
//         if (state is AddNotesSuccess) {
//           BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//           Navigator.pop(context);
//         }
//         if (state is AddNotesFailure) {
//           print("failed ${state.errMessage}");
//         }
//       }, builder: (context, state) {
//         return AbsorbPointer(
//           absorbing: state is AddNotesLoading ? true : false,
//           child:  Padding(
//           padding: EdgeInsets.only(
//             left: 16,
//             right: 16,
//             bottom: MediaQuery.of(context).viewInsets.bottom
//           ),
//             child: const SingleChildScrollView(
//               child: AddNoteForm()
//               ),
//           ),
//         );
//       }),
//     );
//   }
// }
