import 'package:isar/isar.dart';

// Database service interface
abstract class DatabaseService {
  final databaseName = "chiseldb";

  abstract String databaseDirectory;

  abstract Isar database;

  Future<void> ensureInitialized();
}