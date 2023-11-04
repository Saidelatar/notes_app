
import 'package:hive/hive.dart';

part 'notes_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveType(typeId: 0)
   String title;

  @HiveType(typeId: 1)
   String subtitle;

  @HiveType(typeId: 2)
  final String date;

  @HiveType(typeId: 3)
   int color;

  NoteModel({required this.title,required this.subtitle,required this.date,required this.color});
}
