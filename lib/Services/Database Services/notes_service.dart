import 'dart:developer';

import 'package:chisel/Models/Notes/Notebooks/notebook.dart';
import 'package:chisel/Models/Notes/Notebooks/notebook_pocket.dart';
import 'package:chisel/Services/Interface/database.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../Models/Notes/note.dart';

class NotesService extends DatabaseService {
  static final NotesService _singleton = NotesService._internal();

  /// Default constructor.
  factory NotesService() {
    return _singleton;
  }

  NotesService._internal();

  @override
  late final String databaseDirectory;

  @override
  late final Isar database;

  /// Ensures the notes service is initialized.
  @override
  Future<void> ensureInitialized() async {
    databaseDirectory = (await getApplicationDocumentsDirectory()).path;
    database = await Isar.open(
      [NoteSchema, NotebookSchema, NotebookPocketSchema],
      name: databaseName,
      directory: databaseDirectory,
    );
  }

  Future<void> putNote(Note note) async {
    await database.writeTxn(() async {
      await database.notes.put(note);
    });
  }

  Future<void> putNotebook(Notebook notebook) async {
    await database.writeTxn(() async {
      log("PUTTING NOTEBOOK, ${notebook.password}");
     log("NOTEBOOK WITH ID PLACED: ${await database.notebooks.put(notebook)}");
    });
  }

  Future<List<Note>> getAllNotes({int? parentId, int? parentType}) async {
    var base = database.notes.where();
    if(parentId == null) {
      return await base
          .parentIdIsNullAnyParentType()
          .sortByLastEditedAt().findAll();
    }
    else {
      return await base
          .parentIdParentTypeEqualTo(parentId, parentType)
          .sortByLastEditedAt().findAll();
    }
  }

  Future<List<Notebook>> getAllNotebooks() async {
    return await database.notebooks.where().sortByTitle().findAll();
  }

  Stream<List<Note>> watchNotes({int? parentId, int? parentType}) {
    var base = database.notes.where();
    if(parentId == null) {
      return base
          .parentIdIsNullAnyParentType()
          .sortByLastEditedAt().watch();
    }
    else {
      return base
          .parentIdParentTypeEqualTo(parentId, parentType)
          .sortByLastEditedAt().watch();
    }
  }

  Stream<List<Notebook>> watchNotebooks() {
    return database.notebooks.where().sortByTitle().watch();
  }

  Future<void> deleteNote(Note note) async {
    await database.writeTxn(() async {
      await database.notes.delete(note.id);
    });
  }

  Future<void> deleteNotebook(Notebook notebook) async {
    await database.writeTxn(() async {
      await database.notebooks.delete(notebook.id);
    });

    var notes = await getAllNotes(parentId: notebook.id, parentType: 0);
    for(final n in notes){
      deleteNote(n);
    }
  }
}