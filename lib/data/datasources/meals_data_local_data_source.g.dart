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
  Meal(
      {required this.mealsId,
      required this.mealsName,
      required this.mealsPictURL,
      required this.mealsTags,
      required this.mealsDesc});
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
    return map;
  }

  MealsCompanion toCompanion(bool nullToAbsent) {
    return MealsCompanion(
      mealsId: Value(mealsId),
      mealsName: Value(mealsName),
      mealsPictURL: Value(mealsPictURL),
      mealsTags: Value(mealsTags),
      mealsDesc: Value(mealsDesc),
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
    };
  }

  Meal copyWith(
          {String? mealsId,
          String? mealsName,
          String? mealsPictURL,
          String? mealsTags,
          String? mealsDesc}) =>
      Meal(
        mealsId: mealsId ?? this.mealsId,
        mealsName: mealsName ?? this.mealsName,
        mealsPictURL: mealsPictURL ?? this.mealsPictURL,
        mealsTags: mealsTags ?? this.mealsTags,
        mealsDesc: mealsDesc ?? this.mealsDesc,
      );
  @override
  String toString() {
    return (StringBuffer('Meal(')
          ..write('mealsId: $mealsId, ')
          ..write('mealsName: $mealsName, ')
          ..write('mealsPictURL: $mealsPictURL, ')
          ..write('mealsTags: $mealsTags, ')
          ..write('mealsDesc: $mealsDesc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      mealsId.hashCode,
      $mrjc(
          mealsName.hashCode,
          $mrjc(mealsPictURL.hashCode,
              $mrjc(mealsTags.hashCode, mealsDesc.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meal &&
          other.mealsId == this.mealsId &&
          other.mealsName == this.mealsName &&
          other.mealsPictURL == this.mealsPictURL &&
          other.mealsTags == this.mealsTags &&
          other.mealsDesc == this.mealsDesc);
}

class MealsCompanion extends UpdateCompanion<Meal> {
  final Value<String> mealsId;
  final Value<String> mealsName;
  final Value<String> mealsPictURL;
  final Value<String> mealsTags;
  final Value<String> mealsDesc;
  const MealsCompanion({
    this.mealsId = const Value.absent(),
    this.mealsName = const Value.absent(),
    this.mealsPictURL = const Value.absent(),
    this.mealsTags = const Value.absent(),
    this.mealsDesc = const Value.absent(),
  });
  MealsCompanion.insert({
    required String mealsId,
    required String mealsName,
    required String mealsPictURL,
    required String mealsTags,
    required String mealsDesc,
  })  : mealsId = Value(mealsId),
        mealsName = Value(mealsName),
        mealsPictURL = Value(mealsPictURL),
        mealsTags = Value(mealsTags),
        mealsDesc = Value(mealsDesc);
  static Insertable<Meal> custom({
    Expression<String>? mealsId,
    Expression<String>? mealsName,
    Expression<String>? mealsPictURL,
    Expression<String>? mealsTags,
    Expression<String>? mealsDesc,
  }) {
    return RawValuesInsertable({
      if (mealsId != null) 'meals_id': mealsId,
      if (mealsName != null) 'meals_name': mealsName,
      if (mealsPictURL != null) 'meals_pict_u_r_l': mealsPictURL,
      if (mealsTags != null) 'meals_tags': mealsTags,
      if (mealsDesc != null) 'meals_desc': mealsDesc,
    });
  }

  MealsCompanion copyWith(
      {Value<String>? mealsId,
      Value<String>? mealsName,
      Value<String>? mealsPictURL,
      Value<String>? mealsTags,
      Value<String>? mealsDesc}) {
    return MealsCompanion(
      mealsId: mealsId ?? this.mealsId,
      mealsName: mealsName ?? this.mealsName,
      mealsPictURL: mealsPictURL ?? this.mealsPictURL,
      mealsTags: mealsTags ?? this.mealsTags,
      mealsDesc: mealsDesc ?? this.mealsDesc,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealsCompanion(')
          ..write('mealsId: $mealsId, ')
          ..write('mealsName: $mealsName, ')
          ..write('mealsPictURL: $mealsPictURL, ')
          ..write('mealsTags: $mealsTags, ')
          ..write('mealsDesc: $mealsDesc')
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
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _mealsDescMeta = const VerificationMeta('mealsDesc');
  late final GeneratedColumn<String?> mealsDesc = GeneratedColumn<String?>(
      'meals_desc', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1, maxTextLength: 1000),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [mealsId, mealsName, mealsPictURL, mealsTags, mealsDesc];
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
    } else if (isInserting) {
      context.missing(_mealsTagsMeta);
    }
    if (data.containsKey('meals_desc')) {
      context.handle(_mealsDescMeta,
          mealsDesc.isAcceptableOrUnknown(data['meals_desc']!, _mealsDescMeta));
    } else if (isInserting) {
      context.missing(_mealsDescMeta);
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

class FavoriteMeal extends DataClass implements Insertable<FavoriteMeal> {
  final String mealsId;
  FavoriteMeal({required this.mealsId});
  factory FavoriteMeal.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FavoriteMeal(
      mealsId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meals_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['meals_id'] = Variable<String>(mealsId);
    return map;
  }

  FavoriteMealsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteMealsCompanion(
      mealsId: Value(mealsId),
    );
  }

  factory FavoriteMeal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FavoriteMeal(
      mealsId: serializer.fromJson<String>(json['mealsId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mealsId': serializer.toJson<String>(mealsId),
    };
  }

  FavoriteMeal copyWith({String? mealsId}) => FavoriteMeal(
        mealsId: mealsId ?? this.mealsId,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteMeal(')
          ..write('mealsId: $mealsId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(mealsId.hashCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteMeal && other.mealsId == this.mealsId);
}

class FavoriteMealsCompanion extends UpdateCompanion<FavoriteMeal> {
  final Value<String> mealsId;
  const FavoriteMealsCompanion({
    this.mealsId = const Value.absent(),
  });
  FavoriteMealsCompanion.insert({
    required String mealsId,
  }) : mealsId = Value(mealsId);
  static Insertable<FavoriteMeal> custom({
    Expression<String>? mealsId,
  }) {
    return RawValuesInsertable({
      if (mealsId != null) 'meals_id': mealsId,
    });
  }

  FavoriteMealsCompanion copyWith({Value<String>? mealsId}) {
    return FavoriteMealsCompanion(
      mealsId: mealsId ?? this.mealsId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mealsId.present) {
      map['meals_id'] = Variable<String>(mealsId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMealsCompanion(')
          ..write('mealsId: $mealsId')
          ..write(')'))
        .toString();
  }
}

class $FavoriteMealsTable extends FavoriteMeals
    with TableInfo<$FavoriteMealsTable, FavoriteMeal> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FavoriteMealsTable(this._db, [this._alias]);
  final VerificationMeta _mealsIdMeta = const VerificationMeta('mealsId');
  late final GeneratedColumn<String?> mealsId = GeneratedColumn<String?>(
      'meals_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [mealsId];
  @override
  String get aliasedName => _alias ?? 'favorite_meals';
  @override
  String get actualTableName => 'favorite_meals';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteMeal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('meals_id')) {
      context.handle(_mealsIdMeta,
          mealsId.isAcceptableOrUnknown(data['meals_id']!, _mealsIdMeta));
    } else if (isInserting) {
      context.missing(_mealsIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  FavoriteMeal map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FavoriteMeal.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FavoriteMealsTable createAlias(String alias) {
    return $FavoriteMealsTable(_db, alias);
  }
}

abstract class _$FoodtopiaDatabase extends GeneratedDatabase {
  _$FoodtopiaDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $MealsTable meals = $MealsTable(this);
  late final $FavoriteMealsTable favoriteMeals = $FavoriteMealsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [meals, favoriteMeals];
}
