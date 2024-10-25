import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String endDate;

  @HiveField(3)
  String endTime;

  @HiveField(4)
  String timeNotification;

  @HiveField(5)
  String description;

  NoteModel({
    required this.id,
    required this.title,
    required this.endDate,
    required this.endTime,
    required this.timeNotification,
    required this.description,
  });
}
