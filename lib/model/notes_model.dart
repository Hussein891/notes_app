import 'package:hive/hive.dart';

part 'notes_model.g.dart'; // <-- هذا مهم جداً

@HiveType(typeId: 0)
class NotesModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  @HiveField(2)
  String content;

  @HiveField(3)
  int color;

  NotesModel(this.subtitle, this.color,
      {required this.title, required this.content});
}
