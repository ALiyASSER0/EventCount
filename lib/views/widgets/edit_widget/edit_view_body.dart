// import 'package:event_count_downar/cubits/notes_cubit/notes_cubit.dart';
// import 'package:event_count_downar/models/note_model.dart';
// import 'package:event_count_downar/views/widgets/custem_widget/custem_app_bar.dart';
// import 'package:event_count_downar/views/widgets/custem_widget/custem_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class EditNoteViewBody extends StatefulWidget {
//   const EditNoteViewBody({super.key, required this.note});
//   final NoteModel note;

//   @override
//   State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
// }

// class _EditNoteViewBodyState extends State<EditNoteViewBody> {
//   String? title, content;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 45,
//           ),
//           CustomAppBar(
//             title: 'EditNote',
//            icon: Icons.check,
//             onPressed: () {
//               widget.note.title = title ?? widget.note.title;
//               widget.note.subTitle = content ?? widget.note.subTitle;
//               widget.note.save();
//               BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//               Navigator.pop(context);
//             },
//           ),
//           const SizedBox(
//             height: 45,
//           ),
//           CustemTextField(
//             hint: widget.note.title,
//             onChange: (value) {
//               title = value;
//             },
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           CustemTextField(
//             hint: widget.note.subTitle,
//             onChange: (value) {
//               content = value;
//             },
//             maxlines: 5,
//           )

//         ],
//       ),
//     );
//   }
// }
