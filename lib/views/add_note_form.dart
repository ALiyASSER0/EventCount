import 'dart:developer';

import 'package:event_count_downar/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:event_count_downar/events/date_selector.dart';
import 'package:event_count_downar/events/notification_selector.dart';
import 'package:event_count_downar/events/time_selector.dart';
import 'package:event_count_downar/helpers/notification.dart';
import 'package:event_count_downar/models/note_model.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custem_btn.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custem_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? endDate, endTime;
  DateTime? wholedate;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedNotification = "1 day before";

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _onTimeSelected(TimeOfDay? time) {
    setState(() {
      selectedTime = time;
    });
  }

  void _onNotificationChanged(String? notification) {
    setState(() {
      selectedNotification = notification;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),
                  CustemTextField(
                    label: "العنوان",
                    controller: titleController,
                  ),
                  const SizedBox(height: 20),
                  DateSelector(onDateSelected: _onDateSelected),
                  const SizedBox(height: 20),
                  TimeSelector(onTimeSelected: _onTimeSelected),
                  const SizedBox(height: 10),
                  NotificationSelector(
                    selectedNotification: selectedNotification,
                    onNotificationChanged: _onNotificationChanged,
                  ),
                  const SizedBox(height: 20),
                  CustemTextField(
                    label: "الوصف",
                    maxlines: 5,
                    controller: descriptionController,
                  ),
                  const SizedBox(height: 40),
                  BlocBuilder<AddNoteCubit, AddNoteState>(
                    builder: (BuildContext context, state) {
                      return CustemBtn(
                        isLoading: state is AddNotesLoading,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            var noteModel = NoteModel(
                              title: titleController.text,
                              description: descriptionController.text,
                              endDate: DateFormat('yyyy-MM-dd')
                                  .format(selectedDate ?? DateTime.now()),
                              endTime: selectedTime.toString(),
                              timeNotification: selectedNotification!,
                              id: const Uuid().v4(),
                            );
                            wholedate = DateTime(
                              selectedDate!.year,
                              selectedDate!.month,
                              selectedDate!.day,
                              selectedTime!.hour,
                              selectedTime!.minute,
                            );
                            switch (selectedNotification) {
                              case "1 day before":
                                scheduleNotification1day(wholedate!);
                                break;
                              case "1 hour before":
                                scheduleNotification1hour(wholedate!);
                                break;
                              case "10 minutes before":
                                scheduleNotification10min(wholedate!);
                                break;
                              default:
                                log('Exception: default value from notification selector');
                                break;
                            }
                            BlocProvider.of<AddNoteCubit>(context)
                                .addNote(noteModel);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
