import 'dart:async';

import 'package:event_count_downar/events/editTasks.dart';
import 'package:event_count_downar/models/note_model.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl ;

// ignore: must_be_immutable
class NoteItem extends StatefulWidget {
  NoteItem({super.key, required this.note, required this.color});
  String color;
  final NoteModel note;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  late DateTime endDateTime;
  late Timer _timer;
  Duration remainingTime = Duration.zero;

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
  void initState() {
    super.initState();

    endDateTime = intl.DateFormat('yyyy-MM-dd HH:mm').parse("${widget.note.endDate} ${widget.note.endTime}");
    _startCountdown();
  }

  // Timer to update remaining time every second
  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        remainingTime = endDateTime.difference(DateTime.now());
        if (remainingTime.isNegative) {
          _timer.cancel();
          remainingTime = Duration.zero;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Format remaining time with a dynamic display based on time left
  String formatRemainingTime(Duration duration) {
    if (duration.isNegative) {
      return 'Event has started!';
    }

    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    if (days > 0) {
      return '$days يوم $hours ساعة $minutes دقيقة $seconds ثانية';
    } else if (hours > 0) {
      return '$hours ساعة $minutes دقيقة $seconds ثانية';
    } else if (minutes > 0) {
      return '$minutes دقيقة $seconds ثانية';
    } else if (seconds > 0) {
      return '$seconds ثانية';
    } else if (seconds == 0) {
      return 'قد بدأ الحدث بالفعل !!';
    } else {
      return '0 ثانية';
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
          Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              title: Text(
                widget.note.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 26 ,fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(widget.note.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'الوقت المتبقي: ${formatRemainingTime(remainingTime)}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              child: Text(widget.note.endDate,
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            ),
          )
        ],
      ),
    );
  }
}
