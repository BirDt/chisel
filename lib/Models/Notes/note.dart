import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

// ignore_for_file: must_be_immutable

@JsonSerializable()
@Collection(inheritance: false)
class Note {
  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  String internalContent;

  DateTime createdAt;

  DateTime lastEditedAt;

  Note({
    required this.createdAt,
    required this.lastEditedAt,
    required this.internalContent,
  });

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  factory Note.blank() => Note(
    createdAt: DateTime.now(),
    lastEditedAt: DateTime.now(),
    internalContent: jsonEncode(Document().toDelta().toJson()),
  );

  @ignore
  @JsonKey(includeFromJson: false, includeToJson: false)
  Document get document {
    return Document.fromJson(jsonDecode(internalContent));
  }

  set document (Document doc) {
    internalContent = jsonEncode(doc.toDelta().toJson());
  }

  @ignore
  String get titleText {
    final plainText = document.getPlainText(0, document.length).split("\n")
        .where((e) => e.trim().isNotEmpty).toList();

    if (plainText.isEmpty) {
      return "Blank Note";
    }
    else if (plainText[0].length < 26){
      return plainText[0];
    }
    else {
      return "${plainText[0].substring(0, 26)}...";
    }
  }

  @ignore
  String? get previewText {
    final plainText = document.getPlainText(0, document.length).split("\n")
        .where((e) => e.trim().isNotEmpty).toList();

    if(plainText.length < 2){
      return null;
    }
    else if (plainText[1].length < 48){
      return plainText[1];
    }
    else {
      return "${plainText[1].substring(0, 48)}...";
    }
  }
}