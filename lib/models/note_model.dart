import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)



class NoteModel extends HiveObject
{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String endDate;
  @HiveField(2)
  final String endTime;
  @HiveField(3)
  final String timeNotification;
  @HiveField(4)
  final String description;
  
  NoteModel
  (
      {required this.title,
      required this.endDate,
      required this.endTime,
      required this.timeNotification,
      required this.description});
}
