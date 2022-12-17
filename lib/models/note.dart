import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  Note({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });
  Note copyWith({
    String? title,
    String? subTitle,
    String? date,
    int? color,
  }) { 
    return Note(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      date: date ?? this.date,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return '(Note: title = $title, subTitle = $subTitle, date = $date, color = $color)';
  }
}
