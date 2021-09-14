// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_data_local_data_source.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Meal extends DataClass implements Insertable<Meal> {
  final String mealsId;
  final String mealsName;
  final String mealsPictURL;
  final String mealsTags;
  final String mealsDesc;
  final int mealsFavourite;
  Meal(
      {required this.mealsId,
      required this.mealsName,
      required this.mealsPictURL,
      required this.mealsTags,
      required this.mealsDesc,
      required this.mealsFavourite});
  factory Meal.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Meal(
      mealsId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meals_id'])!,
      mealsName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meals_name'])!,
      mealsPictURL: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meals_pict_u_r_l'])!,
      mealsTags: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meals_tags'])!,
      mealsDesc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meals_desc'])!,
      mealsFavourite: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meals_favourite'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['meals_id'] = Variable<String>(mealsId);
    map['meals_name'] = Variable<String>(mealsName);
    map['meals_pict_u_r_l'] = Variable<String>(mealsPictURL);
    map['meals_tags'] = Variable<String>(mealsTags);
    map['meals_desc'] = Variable<String>(mealsDesc);
    map['meals_favourite'] = Variable<int>(mealsFavourite);
    return map;
  }

  MealsCompanion toCompanion(bool nullToAbsent) {
    return MealsCompanion(
      mealsId: Value(mealsId),
      mealsName: Value(mealsName),
      mealsPictURL: Value(mealsPictURL),
      mealsTags: Value(mealsTags),
      mealsDesc: Value(mealsDesc),
      mealsFavourite: Value(mealsFavourite),
    );
  }

  factory Meal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Meal(
      mealsId: serializer.fromJson<String>(json['mealsId']),
      mealsName: serializer.fromJson<String>(json['mealsName']),
      mealsPictURL: serializer.fromJson<String>(json['mealsPictURL']),
      mealsTags: serializer.fromJson<String>(json['mealsTags']),
      mealsDesc: serializer.fromJson<String>(json['mealsDesc']),
      mealsFavourite: serializer.fromJson<int>(json['mealsFavourite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mealsId': serializer.toJson<String>(mealsId),
      'mealsName': serializer.toJson<String>(mealsName),
      'mealsPictURL': serializer.toJson<String>(mealsPictURL),
      'mealsTags': serializer.toJson<String>(mealsTags),
      'mealsDesc': serializer.toJson<String>(mealsDesc),
      'mealsFavourite': serializer.toJson<int>(mealsFavourite),
    };
  }

  Meal copyWith(
          {String? mealsId,
          String? mealsName,
          String? mealsPictURL,
          String? mealsTags,
          String? mealsDesc,
          int? mealsFavourite}) =>
      Meal(
        mealsId: mealsId ?? this.mealsId,
        mealsName: mealsName ?? this.mealsName,
        mealsPictURL: mealsPictURL ?? this.mealsPictURL,
        mealsTags: mealsTags ?? this.mealsTags,
        mealsDesc: mealsDesc ?? this.mealsDesc,
        mealsFavourite: mealsFavourite ?? this.mealsFavourite,
      );
  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('mealsId: $mealsId, ')
          ..write('mealsName: $mealsName, ')
          ..write('mealsPictURL: $mealsPictURL, ')
          ..write('mealsTags: $mealsTags, ')
          ..write('mealsDesc: $mealsDesc, ')
          ..write('mealsFavourite: $mealsFavourite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      mealsId.hashCode,
      $mrjc(
          mealsName.hashCode,
          $mrjc(
              mealsPictURL.hashCode,
              $mrjc(mealsTags.hashCode,
                  $mrjc(mealsDesc.hashCode, mealsFavourite.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          other.mealsId == this.mealsId &&
          other.mealsName == this.mealsName &&
          other.mealsPictURL == this.mealsPictURL &&
          other.mealsTags == this.mealsTags &&
          other.mealsDesc == this.mealsDesc &&
          other.mealsFavourite == this.mealsFavourite);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<String> mealsId;
  final Value<String> mealsName;
  final Value<String> mealsPictURL;
  final Value<String> mealsTags;
  final Value<String> mealsDesc;
  final Value<int> mealsFavourite;
  const MealsCompanion({
    this.mealsId = const Value.absent(),
    this.mealsName = const Value.absent(),
    this.mealsPictURL = const Value.absent(),
    this.mealsTags = const Value.absent(),
    this.mealsDesc = const Value.absent(),
    this.mealsFavourite = const Value.absent(),
  });
  MealsCompanion.insert({
    required String mealsId,
    required String mealsName,
    required String mealsPictURL,
    this.mealsTags = const Value.absent(),
    this.mealsDesc = const Value.absent(),
    this.mealsFavourite = const Value.absent(),
  })  : mealsId = Value(mealsId),
        mealsName = Value(mealsName),
        mealsPictURL = Value(mealsPictURL);
  static Insertable<Meal> custom({
    Expression<String>? mealsId,
    Expression<String>? mealsName,
    Expression<String>? mealsPictURL,
    Expression<String>? mealsTags,
    Expression<String>? mealsDesc,
    Expression<int>? mealsFavourite,
  }) {
    return RawValuesInsertable({
      if (mealsId != null) 'meals_id': mealsId,
      if (mealsName != null) 'meals_name': mealsName,
      if (mealsPictURL != null) 'meals_pict_u_r_l': mealsPictURL,
      if (mealsTags != null) 'meals_tags': mealsTags,
      if (mealsDesc != null) 'meals_desc': mealsDesc,
      if (mealsFavourite != null) 'meals_favourite': mealsFavourite,
    });
  }

  MealsCompanion copyWith(
      {Value<String>? mealsId,
      Value<String>? mealsName,
      Value<String>? mealsPictURL,
      Value<String>? mealsTags,
      Value<String>? mealsDesc,
      Value<int>? mealsFavourite}) {
    return MealsCompanion(
      mealsId: mealsId ?? this.mealsId,
      mealsName: mealsName ?? this.mealsName,
      mealsPictURL: mealsPictURL ?? this.mealsPictURL,
      mealsTags: mealsTags ?? this.mealsTags,
      mealsDesc: mealsDesc ?? this.mealsDesc,
      mealsFavourite: mealsFavourite ?? this.mealsFavourite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mealsId.present) {
      map['meals_id'] = Variable<String>(mealsId.value);
    }
    if (mealsName.present) {
      map['meals_name'] = Variable<String>(mealsName.value);
    }
    if (mealsPictURL.present) {
      map['meals_pict_u_r_l'] = Variable<String>(mealsPictURL.value);
    }
    if (mealsTags.present) {
      map['meals_tags'] = Variable<String>(mealsTags.value);
    }
    if (mealsDesc.present) {
      map['meals_desc'] = Variable<String>(mealsDesc.value);
    }
    if (mealsFavourite.present) {
      map['meals_favourite'] = Variable<int>(mealsFavourite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealsCompanion(')
          ..write('mealsId: $mealsId, ')
          ..write('mealsName: $mealsName, ')
          ..write('mealsPictURL: $mealsPictURL, ')
          ..write('mealsTags: $mealsTags, ')
          ..write('mealsDesc: $mealsDesc, ')
          ..write('mealsFavourite: $mealsFavourite')
          ..write(')'))
        .toString();
  }
}

class $MealsTable extends Meals with TableInfo<$MealsTable, Meal> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MealsTable(this._db, [this._alias]);
  final VerificationMeta _mealsIdMeta = const VerificationMeta('mealsId');
  late final GeneratedColumn<String?> mealsId = GeneratedColumn<String?>(
      'meals_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _mealsNameMeta = const VerificationMeta('mealsName');
  late final GeneratedColumn<String?> mealsName = GeneratedColumn<String?>(
      'meals_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _mealsPictURLMeta =
      const VerificationMeta('mealsPictURL');
  late final GeneratedColumn<String?> mealsPictURL = GeneratedColumn<String?>(
      'meals_pict_u_r_l', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1, maxTextLength: 1000),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _mealsTagsMeta = const VerificationMeta('mealsTags');
  late final GeneratedColumn<String?> mealsTags = GeneratedColumn<String?>(
      'meals_tags', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  final VerificationMeta _mealsDescMeta = const VerificationMeta('mealsDesc');
  late final GeneratedColumn<String?> mealsDesc = GeneratedColumn<String?>(
      'meals_desc', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 9999),
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  final VerificationMeta _mealsFavouriteMeta =
      const VerificationMeta('mealsFavourite');
  late final GeneratedColumn<int?> mealsFavourite = GeneratedColumn<int?>(
      'meals_favourite', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [mealsId, mealsName, mealsPictURL, mealsTags, mealsDesc, mealsFavourite];
  @override
  String get aliasedName => _alias ?? 'meals';
  @override
  String get actualTableName => 'meals';
  @override
  VerificationContext validateIntegrity(Insertable<Meal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('meals_id')) {
      context.handle(_mealsIdMeta,
          mealsId.isAcceptableOrUnknown(data['meals_id']!, _mealsIdMeta));
    } else if (isInserting) {
      context.missing(_mealsIdMeta);
    }
    if (data.containsKey('meals_name')) {
      context.handle(_mealsNameMeta,
          mealsName.isAcceptableOrUnknown(data['meals_name']!, _mealsNameMeta));
    } else if (isInserting) {
      context.missing(_mealsNameMeta);
    }
    if (data.containsKey('meals_pict_u_r_l')) {
      context.handle(
          _mealsPictURLMeta,
          mealsPictURL.isAcceptableOrUnknown(
              data['meals_pict_u_r_l']!, _mealsPictURLMeta));
    } else if (isInserting) {
      context.missing(_mealsPictURLMeta);
    }
    if (data.containsKey('meals_tags')) {
      context.handle(_mealsTagsMeta,
          mealsTags.isAcceptableOrUnknown(data['meals_tags']!, _mealsTagsMeta));
    }
    if (data.containsKey('meals_desc')) {
      context.handle(_mealsDescMeta,
          mealsDesc.isAcceptableOrUnknown(data['meals_desc']!, _mealsDescMeta));
    }
    if (data.containsKey('meals_favourite')) {
      context.handle(
          _mealsFavouriteMeta,
          mealsFavourite.isAcceptableOrUnknown(
              data['meals_favourite']!, _mealsFavouriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Meal map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Meal.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MealsTable createAlias(String alias) {
    return $MealsTable(_db, alias);
  }
}

abstract class _$FoodtopiaDatabase extends GeneratedDatabase {
  _$FoodtopiaDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $MealsTable meals = $MealsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [meals];
}
