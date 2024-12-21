import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
part 'database.g.dart';

class HeroPosted extends Table {
  TextColumn get name => text().named('name')();
  TextColumn get fullName => text().named('fullName')();
  TextColumn get gender => text().named('gender')();
  TextColumn get intelligence => text().named('intelligence')();
  TextColumn get image => text().named('image')();
}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
@DriftDatabase(tables: [HeroPosted])
class AppDatabase extends _$AppDatabase{
  AppDatabase(NativeDatabase nativeDatabase) : super(openConnection());
  @override
  int get schemaVersion => 1;

  Future<int> insertHero(HeroPostedCompanion heroCompanion) async{
    return into(heroPosted).insert(heroCompanion);
  }
  Future<List<HeroPostedData>> getAllHeroes() async{
    return select(heroPosted).get();
  }
  Future<HeroPostedData?> getHeroByName(String name) async {
    return (select(heroPosted)..where((tbl) => tbl.name.equals(name))).getSingleOrNull();
  }
}