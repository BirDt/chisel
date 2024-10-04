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
      [NoteSchema],
      name: databaseName,
      directory: databaseDirectory,
    );
  }

  Future<void> put(Note note) async {
    await database.writeTxn(() async {
      await database.notes.put(note);
    });
  }

  Future<List<Note>> getAll() async {
    return await database.notes.where().sortByLastEditedAt().findAll();
  }

  Stream<List<Note>> watch() {
    return database.notes.where().sortByLastEditedAt().watch();
  }

  Future<void> delete(Note note) async {
    await database.writeTxn(() async {
      await database.notes.delete(note.id);
    });
  }
}