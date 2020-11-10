// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FavoriteMealData extends DataClass
    implements Insertable<FavoriteMealData> {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  FavoriteMealData(
      {@required this.idMeal,
      @required this.strMeal,
      @required this.strMealThumb});
  factory FavoriteMealData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return FavoriteMealData(
      idMeal:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}id_meal']),
      strMeal: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_name']),
      strMealThumb: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_img']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || idMeal != null) {
      map['id_meal'] = Variable<String>(idMeal);
    }
    if (!nullToAbsent || strMeal != null) {
      map['meal_name'] = Variable<String>(strMeal);
    }
    if (!nullToAbsent || strMealThumb != null) {
      map['meal_img'] = Variable<String>(strMealThumb);
    }
    return map;
  }

  FavoriteMealCompanion toCompanion(bool nullToAbsent) {
    return FavoriteMealCompanion(
      idMeal:
          idMeal == null && nullToAbsent ? const Value.absent() : Value(idMeal),
      strMeal: strMeal == null && nullToAbsent
          ? const Value.absent()
          : Value(strMeal),
      strMealThumb: strMealThumb == null && nullToAbsent
          ? const Value.absent()
          : Value(strMealThumb),
    );
  }

  factory FavoriteMealData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FavoriteMealData(
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String>(json['strMeal']),
      strMealThumb: serializer.fromJson<String>(json['strMealThumb']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String>(strMeal),
      'strMealThumb': serializer.toJson<String>(strMealThumb),
    };
  }

  FavoriteMealData copyWith(
          {String idMeal, String strMeal, String strMealThumb}) =>
      FavoriteMealData(
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal ?? this.strMeal,
        strMealThumb: strMealThumb ?? this.strMealThumb,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteMealData(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(idMeal.hashCode, $mrjc(strMeal.hashCode, strMealThumb.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FavoriteMealData &&
          other.idMeal == this.idMeal &&
          other.strMeal == this.strMeal &&
          other.strMealThumb == this.strMealThumb);
}

class FavoriteMealCompanion extends UpdateCompanion<FavoriteMealData> {
  final Value<String> idMeal;
  final Value<String> strMeal;
  final Value<String> strMealThumb;
  const FavoriteMealCompanion({
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strMealThumb = const Value.absent(),
  });
  FavoriteMealCompanion.insert({
    @required String idMeal,
    @required String strMeal,
    @required String strMealThumb,
  })  : idMeal = Value(idMeal),
        strMeal = Value(strMeal),
        strMealThumb = Value(strMealThumb);
  static Insertable<FavoriteMealData> custom({
    Expression<String> idMeal,
    Expression<String> strMeal,
    Expression<String> strMealThumb,
  }) {
    return RawValuesInsertable({
      if (idMeal != null) 'id_meal': idMeal,
      if (strMeal != null) 'meal_name': strMeal,
      if (strMealThumb != null) 'meal_img': strMealThumb,
    });
  }

  FavoriteMealCompanion copyWith(
      {Value<String> idMeal,
      Value<String> strMeal,
      Value<String> strMealThumb}) {
    return FavoriteMealCompanion(
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (strMeal.present) {
      map['meal_name'] = Variable<String>(strMeal.value);
    }
    if (strMealThumb.present) {
      map['meal_img'] = Variable<String>(strMealThumb.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMealCompanion(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb')
          ..write(')'))
        .toString();
  }
}

class $FavoriteMealTable extends FavoriteMeal
    with TableInfo<$FavoriteMealTable, FavoriteMealData> {
  final GeneratedDatabase _db;
  final String _alias;
  $FavoriteMealTable(this._db, [this._alias]);
  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  GeneratedTextColumn _idMeal;
  @override
  GeneratedTextColumn get idMeal => _idMeal ??= _constructIdMeal();
  GeneratedTextColumn _constructIdMeal() {
    return GeneratedTextColumn(
      'id_meal',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strMealMeta = const VerificationMeta('strMeal');
  GeneratedTextColumn _strMeal;
  @override
  GeneratedTextColumn get strMeal => _strMeal ??= _constructStrMeal();
  GeneratedTextColumn _constructStrMeal() {
    return GeneratedTextColumn(
      'meal_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  GeneratedTextColumn _strMealThumb;
  @override
  GeneratedTextColumn get strMealThumb =>
      _strMealThumb ??= _constructStrMealThumb();
  GeneratedTextColumn _constructStrMealThumb() {
    return GeneratedTextColumn(
      'meal_img',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [idMeal, strMeal, strMealThumb];
  @override
  $FavoriteMealTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'favorite_meal';
  @override
  final String actualTableName = 'favorite_meal';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteMealData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal'], _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('meal_name')) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableOrUnknown(data['meal_name'], _strMealMeta));
    } else if (isInserting) {
      context.missing(_strMealMeta);
    }
    if (data.containsKey('meal_img')) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableOrUnknown(
              data['meal_img'], _strMealThumbMeta));
    } else if (isInserting) {
      context.missing(_strMealThumbMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMeal};
  @override
  FavoriteMealData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FavoriteMealData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FavoriteMealTable createAlias(String alias) {
    return $FavoriteMealTable(_db, alias);
  }
}

abstract class _$MealsDatabase extends GeneratedDatabase {
  _$MealsDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FavoriteMealTable _favoriteMeal;
  $FavoriteMealTable get favoriteMeal =>
      _favoriteMeal ??= $FavoriteMealTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteMeal];
}
