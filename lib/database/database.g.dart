// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class HeroPostedData extends DataClass implements Insertable<HeroPostedData> {
  final String name;
  final String fullName;
  final String gender;
  final String intelligence;
  final String image;
  HeroPostedData(
      {required this.name,
      required this.fullName,
      required this.gender,
      required this.intelligence,
      required this.image});
  factory HeroPostedData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HeroPostedData(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      fullName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fullName'])!,
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender'])!,
      intelligence: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}intelligence'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['fullName'] = Variable<String>(fullName);
    map['gender'] = Variable<String>(gender);
    map['intelligence'] = Variable<String>(intelligence);
    map['image'] = Variable<String>(image);
    return map;
  }

  HeroPostedCompanion toCompanion(bool nullToAbsent) {
    return HeroPostedCompanion(
      name: Value(name),
      fullName: Value(fullName),
      gender: Value(gender),
      intelligence: Value(intelligence),
      image: Value(image),
    );
  }

  factory HeroPostedData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HeroPostedData(
      name: serializer.fromJson<String>(json['name']),
      fullName: serializer.fromJson<String>(json['fullName']),
      gender: serializer.fromJson<String>(json['gender']),
      intelligence: serializer.fromJson<String>(json['intelligence']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'fullName': serializer.toJson<String>(fullName),
      'gender': serializer.toJson<String>(gender),
      'intelligence': serializer.toJson<String>(intelligence),
      'image': serializer.toJson<String>(image),
    };
  }

  HeroPostedData copyWith(
          {String? name,
          String? fullName,
          String? gender,
          String? intelligence,
          String? image}) =>
      HeroPostedData(
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        gender: gender ?? this.gender,
        intelligence: intelligence ?? this.intelligence,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('HeroPostedData(')
          ..write('name: $name, ')
          ..write('fullName: $fullName, ')
          ..write('gender: $gender, ')
          ..write('intelligence: $intelligence, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, fullName, gender, intelligence, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HeroPostedData &&
          other.name == this.name &&
          other.fullName == this.fullName &&
          other.gender == this.gender &&
          other.intelligence == this.intelligence &&
          other.image == this.image);
}

class HeroPostedCompanion extends UpdateCompanion<HeroPostedData> {
  final Value<String> name;
  final Value<String> fullName;
  final Value<String> gender;
  final Value<String> intelligence;
  final Value<String> image;
  const HeroPostedCompanion({
    this.name = const Value.absent(),
    this.fullName = const Value.absent(),
    this.gender = const Value.absent(),
    this.intelligence = const Value.absent(),
    this.image = const Value.absent(),
  });
  HeroPostedCompanion.insert({
    required String name,
    required String fullName,
    required String gender,
    required String intelligence,
    required String image,
  })  : name = Value(name),
        fullName = Value(fullName),
        gender = Value(gender),
        intelligence = Value(intelligence),
        image = Value(image);
  static Insertable<HeroPostedData> custom({
    Expression<String>? name,
    Expression<String>? fullName,
    Expression<String>? gender,
    Expression<String>? intelligence,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (fullName != null) 'fullName': fullName,
      if (gender != null) 'gender': gender,
      if (intelligence != null) 'intelligence': intelligence,
      if (image != null) 'image': image,
    });
  }

  HeroPostedCompanion copyWith(
      {Value<String>? name,
      Value<String>? fullName,
      Value<String>? gender,
      Value<String>? intelligence,
      Value<String>? image}) {
    return HeroPostedCompanion(
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      intelligence: intelligence ?? this.intelligence,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (fullName.present) {
      map['fullName'] = Variable<String>(fullName.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (intelligence.present) {
      map['intelligence'] = Variable<String>(intelligence.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HeroPostedCompanion(')
          ..write('name: $name, ')
          ..write('fullName: $fullName, ')
          ..write('gender: $gender, ')
          ..write('intelligence: $intelligence, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $HeroPostedTable extends HeroPosted
    with TableInfo<$HeroPostedTable, HeroPostedData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HeroPostedTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _fullNameMeta = const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String?> fullName = GeneratedColumn<String?>(
      'fullName', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _intelligenceMeta =
      const VerificationMeta('intelligence');
  @override
  late final GeneratedColumn<String?> intelligence = GeneratedColumn<String?>(
      'intelligence', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [name, fullName, gender, intelligence, image];
  @override
  String get aliasedName => _alias ?? 'hero_posted';
  @override
  String get actualTableName => 'hero_posted';
  @override
  VerificationContext validateIntegrity(Insertable<HeroPostedData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('fullName')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['fullName']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('intelligence')) {
      context.handle(
          _intelligenceMeta,
          intelligence.isAcceptableOrUnknown(
              data['intelligence']!, _intelligenceMeta));
    } else if (isInserting) {
      context.missing(_intelligenceMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  HeroPostedData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return HeroPostedData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HeroPostedTable createAlias(String alias) {
    return $HeroPostedTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $HeroPostedTable heroPosted = $HeroPostedTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [heroPosted];
}
