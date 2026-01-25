import 'dart:convert';

import 'package:myqrcode/core/model/recent_model.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseService {
  final databaseName = "my_database_v4.db";
  final databaseVersion = 2;

  final tableRecent = 'recent';

  Database? database;
  Future<Database> databaseMain() async {
    if (database != null) return database!;
    database = await initDatabase();
    return database!;
  }

  Future initDatabase() async {
    Directory documensDirectory = await getApplicationDocumentsDirectory();
    String path = join(documensDirectory.path, databaseName);
    return openDatabase(
      path,
      version: databaseVersion,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: create,
    );
  }

  Future create(Database db, int version) async {
    // TABLE USER
    await db.execute('''
    CREATE TABLE $tableRecent (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      data TEXT,
      title TEXT,
      type TEXT,
      color TEXT,
      action TEXT,
      icon TEXT
    )
  ''');
  }

  Future<List<RecentModel?>> getRecent(int page) async {
    try {
      final offset = (page - 1) * 10;
      final data = await database!.query(
        tableRecent,
        orderBy: 'id DESC',
        limit: 10,
        offset: offset,
      );
      if (data.isEmpty) {
        return [];
      } else {
        return data.map((e) => RecentModel.fromJson(e)).toList();
      }
    } catch (e) {
      return [];
    }
  }

  Future<bool> addRecent(RecentModel data) async {
    try {
      await database!.insert(tableRecent, {
        "data": data.data,
        "title": data.title,
        "type": data.type,
        "color": data.color,
        "action": data.action,
        "icon": json.encode(data.icon),
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteRecent(int id) async {
    try {
      await database!.delete(tableRecent, where: 'id = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteAllRecent() async {
    try {
      await database!.delete(tableRecent);
      return true;
    } catch (e) {
      return false;
    }
  }
}
