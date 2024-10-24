import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ViewTasksPage extends StatefulWidget 
{
  @override
  _ViewTasksPageState createState() => _ViewTasksPageState();
}

class _ViewTasksPageState extends State<ViewTasksPage> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('tasksBox');  // الحصول على صندوق المهام

    return Scaffold(
      appBar: AppBar(
        title: Text('المهام المحفوظة'),
      ),
      body: ListView.builder(
        itemCount: box.length,  // عدد المهام المخزنة
        itemBuilder: (context, index) {
          var task = box.getAt(index);  // الحصول على المهمة في هذا الفهرس
          return ListTile(
            title: Text(task['title'] ?? 'بدون عنوان'),
            subtitle: Text(task['description'] ?? 'بدون وصف'),
            trailing: Text(task['date'] ?? 'بدون تاريخ'),
          );
        },
      ),
    );
  }
}
