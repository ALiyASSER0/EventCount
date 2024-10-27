import 'package:event_count_downar/cubits/notes_cubit/notes_cubit.dart';
import 'package:event_count_downar/events/date_selector.dart';
import 'package:event_count_downar/events/notification_selector.dart';
import 'package:event_count_downar/events/time_selector.dart';
import 'package:event_count_downar/models/note_model.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custem_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EditTasks extends StatefulWidget {
  const EditTasks({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditTasks> createState() => _EditTasksState();
}

class _EditTasksState extends State<EditTasks> {
  // تعريف المتغيرات التي ستحفظ البيانات المدخلة
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? timeNotification;

  ///////////////////////////
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedNotification = "1 day before";

  void _onDateSelected(DateTime? date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _onTimeSelected(TimeOfDay? time) {
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              CustemTextField(
                label: "العنوان",
                hint: widget.note.title,
                controller: titleController,
              ),

              SizedBox(height: 20),

              DateSelector(onDateSelected: _onDateSelected),
              SizedBox(height: 20),

              TimeSelector(
                onTimeSelected: _onTimeSelected,
              ),
              SizedBox(height: 10),

              NotificationSelector(
                selectedNotification: selectedNotification, onNotificationChanged: (String? value) {  },
              ),
              SizedBox(
                height: 20,
              ),

              CustemTextField(
                hint: widget.note.description,
                label: "الوصف",
                controller: descriptionController,
                maxlines: 5,
              ),
              SizedBox(height: 40),

              // الأزرار
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      widget.note.title = titleController.text;
                      widget.note.description =
                          descriptionController.text;
                      widget.note.endDate = DateFormat('yyyy-MM-dd')
                          .format(selectedDate ?? DateTime.now());
                      widget.note.endTime = selectedTime.toString();
                      widget.note.timeNotification =
                          selectedNotification ?? widget.note.timeNotification;
                      widget.note.save();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(color: Colors.white),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Update'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.note.delete();
                      Navigator.pop(context);
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
