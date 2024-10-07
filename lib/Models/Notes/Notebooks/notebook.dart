import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notebook.g.dart';

@JsonSerializable()
@Collection(inheritance: false)
class Notebook {
  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  DateTime createdAt;

  String title;

  String? password;

  Notebook({
    required this.createdAt,
    required this.title
  });

  factory Notebook.empty() => Notebook(
    createdAt: DateTime.now(),
    title: "Empty Notebook"
  );
}
