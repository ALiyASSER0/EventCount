import 'package:event_count_downar/routing/routes.dart';
import 'package:event_count_downar/views/my_drawer_list.dart';
import 'package:event_count_downar/views/widgets/notes_widget/notes_view_body.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class NotesView extends StatefulWidget {
     NotesView({super.key,required this.color});
  String color;

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
       FloatingActionButton(
        foregroundColor: const Color.fromARGB(255, 45, 137, 213),
        backgroundColor:Colors.white,
        onPressed: ()
        {
          Navigator.pushNamed(context,Routes.addEvent);
        },
        child:const Icon(Icons.add)),
      body:  NotesViewBody(color:widget.color),
      drawer: const Drawer(
        backgroundColor: Colors.white,
         width: 290, 
        child: MyDrawerList(),
      ),
    );
  }
}
