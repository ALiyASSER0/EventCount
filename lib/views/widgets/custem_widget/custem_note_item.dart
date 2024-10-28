import 'package:event_count_downar/events/editTasks.dart';
import 'package:event_count_downar/models/note_model.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoteItem extends StatefulWidget {
  NoteItem({super.key, required this.note, required this.color});
  String color;
  final NoteModel note;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  AssetImage themeApp(String color) {
    switch (color) {
      case "card2":
        return const AssetImage("assets/images/card2.png");
      case "card3":
        return const AssetImage("assets/images/card3.png");  
      default:
        return const AssetImage("assets/images/imag.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24, top: 24, left: 10),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: themeApp(widget.color), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              widget.note.title,
              style: const TextStyle(color: Colors.white, fontSize: 26),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(widget.note.description,
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: EditTasks(
                            note: widget.note,
                          ),
                        );
                      }),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 25,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(widget.note.endDate,
                style: const TextStyle(color: Colors.white, fontSize: 16)),
          )
        ],
      ),
    );
  }
}
