import 'package:vizeodevi/models/Kullanici.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbUtils {
  static final DbUtils _dbUtils = DbUtils._internal();

  DbUtils._internal();

  factory DbUtils() {
    return _dbUtils;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'kullanicilar_database.db');
    var dbKullanicilar =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return dbKullanicilar;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE kullanicilar(telefon INTEGER PRIMARY KEY, adi TEXT, adres TEXT)");
  }

  Future<void> deleteTable() async {
    final Database db = await this.db;
    db.delete('kullanicilar');
  }

  Future<void> insertDog(Kullanici kullanici) async {
    final Database db = await this.db;
    await db.insert(
      'kullanicilar',
      kullanici.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Kullanici>> kullanicilar() async {
    final Database db = await this.db;
    final List<Map<String, dynamic>> maps = await db.query('kullanicilar');
    return List.generate(maps.length, (i) {
      return Kullanici(
        adi: maps[i]['adi'],
        adres: maps[i]['adres'],
        telefon: maps[i]['telefon'],
      );
    });
  }

  Future<void> updateDog(Kullanici kullanici) async {
    final db = await this.db;
    await db.update(
      'kullanicilar',
      kullanici.toMap(),
      where: "telefon = ?",
      whereArgs: [kullanici.telefon],
    );
  }

  Future<void> deleteDog(int id) async {
    final db = await this.db;
    await db.delete(
      'dogs',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
