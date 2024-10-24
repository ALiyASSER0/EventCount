import 'package:flutter/material.dart';
import 'package:flutter_application_1/date_selector.dart';
import 'package:flutter_application_1/notification_selector.dart';
import 'package:flutter_application_1/stander_faild.dart';
import 'package:flutter_application_1/time_selector.dart';
import 'package:flutter_application_1/viewtaskspage.dart';
import 'package:hive/hive.dart';
//import 'package:intl/intl.dart';


class TasksDetails extends StatefulWidget 
{
  @override
  _TasksDetailsState createState() => _TasksDetailsState();
}

class _TasksDetailsState extends State<TasksDetails> 
{
  // تعريف المتغيرات التي ستحفظ البيانات المدخلة
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


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
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [ 
                SizedBox(height: 150,),
                StanderFaild(controler: titleController,label: "العنوان",),
                SizedBox(height: 20),
            
                DateSelector(), 
                SizedBox(height: 20),
            
                TimeSelector(),
                SizedBox(height: 10),
            
                NotificationSelector(selectedNotification: selectedNotification,),
                SizedBox(height: 20,),
            
                StanderFaild(controler: descriptionController,label: "الوصف",maxLines: 5,),
                SizedBox(height: 40),
                    
                
                // الأزرار
                Row
                (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: 
                  [
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
                    ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewTasksPage()),
    );
  },
  child: Text('عرض المهام'),
),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
