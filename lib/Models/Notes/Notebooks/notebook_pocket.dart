import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notebook_pocket.g.dart';

@JsonSerializable()
@Collection(inheritance: false)
class NotebookPocket {
  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  DateTime createdAt;

  String title;

  @Index()
  int? parentId;

  NotebookPocket({
    required this.createdAt,
    required this.title,
    required this.parentId
  });

  factory NotebookPocket.empty(Id parentId) => NotebookPocket(
      parentId: parentId,
      createdAt: DateTime.now(),
      title: "Empty Pocket");
}