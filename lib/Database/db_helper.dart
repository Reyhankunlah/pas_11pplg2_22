import 'package:pas_mobile_11pplg2_22/Models/favoriteShow_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorite.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE show (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            genre TEXT,
            imageUrl TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertShow(FavoriteshowModel show) async {
    final dbClient = await db;
    return await dbClient.insert('show', {
      'title': show.title,
      'genre': show.genre,
      'imageUrl': show.imageUrl,
    });
  }

  Future<List<FavoriteshowModel>> getShows() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query('show');

    return List.generate(maps.length, (i) {
      final data = maps[i];
      return FavoriteshowModel(
        id: data['id'],
        title: data['title'],
        genre: data['genre'],
        imageUrl: data['imageUrl'],
      );
    });
  }

  Future<int> deleteShow(int id) async {
    final dbClient = await db;
    return await dbClient.delete('show', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearShows() async {
    final dbClient = await db;
    await dbClient.delete('show');
  }
}
