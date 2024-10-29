import 'package:event_count_downar/views/installments_view.dart';
import 'package:event_count_downar/views/notes_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> 
{
  List<Widget> screen =  [NotesView(color: "card1",), const InstallmentsView()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
        setState(() {
          currentIndex = index;
        });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "الاحداث"),
          BottomNavigationBarItem(icon: Icon(Icons.payments), label: "الاقساط"),
        ],
      ),
    
    );
  }
}
