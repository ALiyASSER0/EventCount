import 'package:event_count_downar/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:event_count_downar/events/date_selector.dart';
import 'package:event_count_downar/events/notification_selector.dart';
import 'package:event_count_downar/events/stander_faild.dart';
import 'package:event_count_downar/events/time_selector.dart';
import 'package:event_count_downar/models/note_model.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custem_btn.dart';
import 'package:event_count_downar/views/widgets/custem_widget/custem_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive/hive.dart';
//import 'package:intl/intl.dart';


class EditTasks extends StatefulWidget 
{
  final NoteModel note;
  EditTasks({required this.note});
  @override
  _TasksDetailsState createState() => _TasksDetailsState();
}

class _TasksDetailsState extends State<EditTasks> 
{
  // تعريف المتغيرات التي ستحفظ البيانات المدخلة
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, description,endDate,endTime,timeNotification;

  ///////////////////////////
  DateTime? selectedDate;
  TimeOfDay ? selectedTime;
  String? selectedNotification = "1 day before";
  
  

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: Directionality
      (
        textDirection: TextDirection.rtl,
        child: Padding
        (
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView
          (
            child: Form
            (
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                [ 
                  SizedBox(height: 150,),
                  //StanderFaild(controler: titleController,label: "العنوان",),
                  CustemTextField
                  (
                    label: "العنوان",
                    onSaved: (value) 
                    {
                      title = value;
                    },
                    //hint: "العنوان",
                  ),
                  SizedBox(height: 20),
              
                  DateSelector(), 
                  SizedBox(height: 20),
              
                  TimeSelector(),
                  SizedBox(height: 10),
              
                  NotificationSelector(selectedNotification: selectedNotification,),
                  SizedBox(height: 20,),
              
                  //StanderFaild(controler: descriptionController,label: "الوصف",maxLines: 5,),
                  CustemTextField
                  (
                    label: "الوصف",
                    onSaved: (value) 
                    {
                      description = value;
                    },
                    //hint: "الوصف",
                    maxlines: 5,
                  ),
                  SizedBox(height: 40),
                      
                  
                  // الأزرار
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: 
                    [
                      BlocBuilder<AddNoteCubit, AddNoteState>
                      (
                        builder: (BuildContext context, state) 
                        {
                          return CustemBtn
                          (
                            isLoading: state is AddNotesLoading ? true : false,
                            onTap: () 
                            {
                              if (formKey.currentState!.validate()) 
                              {
                                formKey.currentState!.save();
                                var noteModel = NoteModel
                                (
                                    title: title!,
                                    description:description! ,
                                    endDate: selectedDate.toString() ,
                                    endTime: selectedTime.toString(),
                                    timeNotification: selectedNotification!,
                                );
                                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                          );
                        }
                      ),
                      ElevatedButton
                      (

                        onPressed: () async 
                        {
                          var box = Hive.box('tasksBox');
                          await box.add
                          (
                            {
                              'title': titleController.text,
                              'description': descriptionController.text,
                              'date': selectedDate != null ? selectedDate!.toIso8601String() : '',
                              'time': selectedTime != null ? selectedTime!.format(context) : '',  // حفظ الوقت
                              'notification': selectedNotification,
                            }
                          );
                          print('تم الحفظ');
                        },
                        child: Text('Save'),
                      ),
                      ElevatedButton(
                        onPressed: () 
                        {
                          // هنا نكتب الكود الخاص بحذف البيانات
                          print('تم الحذف');
                          // يمكننا أيضًا تفريغ الحقول هنا
                          titleController.clear();
                          descriptionController.clear();
                          selectedDate=null;
                          selectedTime=null;
                          selectedNotification = "1 day before";
                        },
                        child: Text('Delete'),
                      ),
                      
                    ],
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
