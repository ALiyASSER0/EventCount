import 'package:event_count_downar/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:event_count_downar/models/note_model.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custem_btn.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custem_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          CustemTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustemTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'Content',
            maxlines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (BuildContext context, state) {
            return CustemBtn(
              isLoading: state is AddNotesLoading ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var currentDate = DateTime.now();
                  var formattedCurrentDate =  DateFormat("dd-mm-yyyy").format(currentDate);
                  var noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: formattedCurrentDate,
                      color: const Color.fromARGB(255, 2, 58, 103).value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          }),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
