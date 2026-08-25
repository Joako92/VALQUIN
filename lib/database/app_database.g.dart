// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TestEntriesTable extends TestEntries
    with TableInfo<$TestEntriesTable, TestEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TestEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $TestEntriesTable createAlias(String alias) {
    return $TestEntriesTable(attachedDatabase, alias);
  }
}

class TestEntry extends DataClass implements Insertable<TestEntry> {
  final int id;
  final String name;
  final int value;
  const TestEntry({required this.id, required this.name, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['value'] = Variable<int>(value);
    return map;
  }

  TestEntriesCompanion toCompanion(bool nullToAbsent) {
    return TestEntriesCompanion(
      id: Value(id),
      name: Value(name),
      value: Value(value),
    );
  }

  factory TestEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestEntry(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<int>(value),
    };
  }

  TestEntry copyWith({int? id, String? name, int? value}) => TestEntry(
    id: id ?? this.id,
    name: name ?? this.name,
    value: value ?? this.value,
  );
  TestEntry copyWithCompanion(TestEntriesCompanion data) {
    return TestEntry(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestEntry(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestEntry &&
          other.id == this.id &&
          other.name == this.name &&
          other.value == this.value);
}

class TestEntriesCompanion extends UpdateCompanion<TestEntry> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> value;
  const TestEntriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.value = const Value.absent(),
  });
  TestEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int value,
  }) : name = Value(name),
       value = Value(value);
  static Insertable<TestEntry> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    });
  }

  TestEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? value,
  }) {
    return TestEntriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestEntriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $ExerciseVariantsTable extends ExerciseVariants
    with TableInfo<$ExerciseVariantsTable, ExerciseVariant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseVariantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _variantIndexMeta = const VerificationMeta(
    'variantIndex',
  );
  @override
  late final GeneratedColumn<int> variantIndex = GeneratedColumn<int>(
    'variant_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _setsMeta = const VerificationMeta('sets');
  @override
  late final GeneratedColumn<int> sets = GeneratedColumn<int>(
    'sets',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, variantIndex, sets, amount, unit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_variants';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseVariant> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('variant_index')) {
      context.handle(
        _variantIndexMeta,
        variantIndex.isAcceptableOrUnknown(
          data['variant_index']!,
          _variantIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_variantIndexMeta);
    }
    if (data.containsKey('sets')) {
      context.handle(
        _setsMeta,
        sets.isAcceptableOrUnknown(data['sets']!, _setsMeta),
      );
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseVariant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseVariant(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      variantIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}variant_index'],
      )!,
      sets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sets'],
      ),
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
    );
  }

  @override
  $ExerciseVariantsTable createAlias(String alias) {
    return $ExerciseVariantsTable(attachedDatabase, alias);
  }
}

class ExerciseVariant extends DataClass implements Insertable<ExerciseVariant> {
  final int id;
  final int variantIndex;
  final int? sets;
  final double amount;
  final String unit;
  const ExerciseVariant({
    required this.id,
    required this.variantIndex,
    this.sets,
    required this.amount,
    required this.unit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['variant_index'] = Variable<int>(variantIndex);
    if (!nullToAbsent || sets != null) {
      map['sets'] = Variable<int>(sets);
    }
    map['amount'] = Variable<double>(amount);
    map['unit'] = Variable<String>(unit);
    return map;
  }

  ExerciseVariantsCompanion toCompanion(bool nullToAbsent) {
    return ExerciseVariantsCompanion(
      id: Value(id),
      variantIndex: Value(variantIndex),
      sets: sets == null && nullToAbsent ? const Value.absent() : Value(sets),
      amount: Value(amount),
      unit: Value(unit),
    );
  }

  factory ExerciseVariant.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseVariant(
      id: serializer.fromJson<int>(json['id']),
      variantIndex: serializer.fromJson<int>(json['variantIndex']),
      sets: serializer.fromJson<int?>(json['sets']),
      amount: serializer.fromJson<double>(json['amount']),
      unit: serializer.fromJson<String>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'variantIndex': serializer.toJson<int>(variantIndex),
      'sets': serializer.toJson<int?>(sets),
      'amount': serializer.toJson<double>(amount),
      'unit': serializer.toJson<String>(unit),
    };
  }

  ExerciseVariant copyWith({
    int? id,
    int? variantIndex,
    Value<int?> sets = const Value.absent(),
    double? amount,
    String? unit,
  }) => ExerciseVariant(
    id: id ?? this.id,
    variantIndex: variantIndex ?? this.variantIndex,
    sets: sets.present ? sets.value : this.sets,
    amount: amount ?? this.amount,
    unit: unit ?? this.unit,
  );
  ExerciseVariant copyWithCompanion(ExerciseVariantsCompanion data) {
    return ExerciseVariant(
      id: data.id.present ? data.id.value : this.id,
      variantIndex: data.variantIndex.present
          ? data.variantIndex.value
          : this.variantIndex,
      sets: data.sets.present ? data.sets.value : this.sets,
      amount: data.amount.present ? data.amount.value : this.amount,
      unit: data.unit.present ? data.unit.value : this.unit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseVariant(')
          ..write('id: $id, ')
          ..write('variantIndex: $variantIndex, ')
          ..write('sets: $sets, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, variantIndex, sets, amount, unit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseVariant &&
          other.id == this.id &&
          other.variantIndex == this.variantIndex &&
          other.sets == this.sets &&
          other.amount == this.amount &&
          other.unit == this.unit);
}

class ExerciseVariantsCompanion extends UpdateCompanion<ExerciseVariant> {
  final Value<int> id;
  final Value<int> variantIndex;
  final Value<int?> sets;
  final Value<double> amount;
  final Value<String> unit;
  const ExerciseVariantsCompanion({
    this.id = const Value.absent(),
    this.variantIndex = const Value.absent(),
    this.sets = const Value.absent(),
    this.amount = const Value.absent(),
    this.unit = const Value.absent(),
  });
  ExerciseVariantsCompanion.insert({
    this.id = const Value.absent(),
    required int variantIndex,
    this.sets = const Value.absent(),
    required double amount,
    required String unit,
  }) : variantIndex = Value(variantIndex),
       amount = Value(amount),
       unit = Value(unit);
  static Insertable<ExerciseVariant> custom({
    Expression<int>? id,
    Expression<int>? variantIndex,
    Expression<int>? sets,
    Expression<double>? amount,
    Expression<String>? unit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (variantIndex != null) 'variant_index': variantIndex,
      if (sets != null) 'sets': sets,
      if (amount != null) 'amount': amount,
      if (unit != null) 'unit': unit,
    });
  }

  ExerciseVariantsCompanion copyWith({
    Value<int>? id,
    Value<int>? variantIndex,
    Value<int?>? sets,
    Value<double>? amount,
    Value<String>? unit,
  }) {
    return ExerciseVariantsCompanion(
      id: id ?? this.id,
      variantIndex: variantIndex ?? this.variantIndex,
      sets: sets ?? this.sets,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (variantIndex.present) {
      map['variant_index'] = Variable<int>(variantIndex.value);
    }
    if (sets.present) {
      map['sets'] = Variable<int>(sets.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseVariantsCompanion(')
          ..write('id: $id, ')
          ..write('variantIndex: $variantIndex, ')
          ..write('sets: $sets, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, Exercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<Exercise> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Exercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Exercise(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class Exercise extends DataClass implements Insertable<Exercise> {
  final String id;
  final String name;
  const Exercise({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(id: Value(id), name: Value(name));
  }

  factory Exercise.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Exercise(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Exercise copyWith({String? id, String? name}) =>
      Exercise(id: id ?? this.id, name: name ?? this.name);
  Exercise copyWithCompanion(ExercisesCompanion data) {
    return Exercise(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Exercise(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Exercise && other.id == this.id && other.name == this.name);
}

class ExercisesCompanion extends UpdateCompanion<Exercise> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExercisesCompanion.insert({
    required String id,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Exercise> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExercisesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return ExercisesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExerciseVariantLinksTable extends ExerciseVariantLinks
    with TableInfo<$ExerciseVariantLinksTable, ExerciseVariantLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExerciseVariantLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _exerciseIdMeta = const VerificationMeta(
    'exerciseId',
  );
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
    'exercise_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _variantIdMeta = const VerificationMeta(
    'variantId',
  );
  @override
  late final GeneratedColumn<int> variantId = GeneratedColumn<int>(
    'variant_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, exerciseId, variantId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exercise_variant_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExerciseVariantLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('variant_id')) {
      context.handle(
        _variantIdMeta,
        variantId.isAcceptableOrUnknown(data['variant_id']!, _variantIdMeta),
      );
    } else if (isInserting) {
      context.missing(_variantIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {exerciseId, variantId},
  ];
  @override
  ExerciseVariantLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseVariantLink(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      variantId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}variant_id'],
      )!,
    );
  }

  @override
  $ExerciseVariantLinksTable createAlias(String alias) {
    return $ExerciseVariantLinksTable(attachedDatabase, alias);
  }
}

class ExerciseVariantLink extends DataClass
    implements Insertable<ExerciseVariantLink> {
  final int id;
  final String exerciseId;
  final int variantId;
  const ExerciseVariantLink({
    required this.id,
    required this.exerciseId,
    required this.variantId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['variant_id'] = Variable<int>(variantId);
    return map;
  }

  ExerciseVariantLinksCompanion toCompanion(bool nullToAbsent) {
    return ExerciseVariantLinksCompanion(
      id: Value(id),
      exerciseId: Value(exerciseId),
      variantId: Value(variantId),
    );
  }

  factory ExerciseVariantLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseVariantLink(
      id: serializer.fromJson<int>(json['id']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      variantId: serializer.fromJson<int>(json['variantId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'variantId': serializer.toJson<int>(variantId),
    };
  }

  ExerciseVariantLink copyWith({int? id, String? exerciseId, int? variantId}) =>
      ExerciseVariantLink(
        id: id ?? this.id,
        exerciseId: exerciseId ?? this.exerciseId,
        variantId: variantId ?? this.variantId,
      );
  ExerciseVariantLink copyWithCompanion(ExerciseVariantLinksCompanion data) {
    return ExerciseVariantLink(
      id: data.id.present ? data.id.value : this.id,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      variantId: data.variantId.present ? data.variantId.value : this.variantId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseVariantLink(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('variantId: $variantId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, exerciseId, variantId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseVariantLink &&
          other.id == this.id &&
          other.exerciseId == this.exerciseId &&
          other.variantId == this.variantId);
}

class ExerciseVariantLinksCompanion
    extends UpdateCompanion<ExerciseVariantLink> {
  final Value<int> id;
  final Value<String> exerciseId;
  final Value<int> variantId;
  const ExerciseVariantLinksCompanion({
    this.id = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.variantId = const Value.absent(),
  });
  ExerciseVariantLinksCompanion.insert({
    this.id = const Value.absent(),
    required String exerciseId,
    required int variantId,
  }) : exerciseId = Value(exerciseId),
       variantId = Value(variantId);
  static Insertable<ExerciseVariantLink> custom({
    Expression<int>? id,
    Expression<String>? exerciseId,
    Expression<int>? variantId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (variantId != null) 'variant_id': variantId,
    });
  }

  ExerciseVariantLinksCompanion copyWith({
    Value<int>? id,
    Value<String>? exerciseId,
    Value<int>? variantId,
  }) {
    return ExerciseVariantLinksCompanion(
      id: id ?? this.id,
      exerciseId: exerciseId ?? this.exerciseId,
      variantId: variantId ?? this.variantId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (variantId.present) {
      map['variant_id'] = Variable<int>(variantId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseVariantLinksCompanion(')
          ..write('id: $id, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('variantId: $variantId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TestEntriesTable testEntries = $TestEntriesTable(this);
  late final $ExerciseVariantsTable exerciseVariants = $ExerciseVariantsTable(
    this,
  );
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $ExerciseVariantLinksTable exerciseVariantLinks =
      $ExerciseVariantLinksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    testEntries,
    exerciseVariants,
    exercises,
    exerciseVariantLinks,
  ];
}

typedef $$TestEntriesTableCreateCompanionBuilder =
    TestEntriesCompanion Function({
      Value<int> id,
      required String name,
      required int value,
    });
typedef $$TestEntriesTableUpdateCompanionBuilder =
    TestEntriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> value,
    });

class $$TestEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $TestEntriesTable> {
  $$TestEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TestEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TestEntriesTable> {
  $$TestEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TestEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestEntriesTable> {
  $$TestEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$TestEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestEntriesTable,
          TestEntry,
          $$TestEntriesTableFilterComposer,
          $$TestEntriesTableOrderingComposer,
          $$TestEntriesTableAnnotationComposer,
          $$TestEntriesTableCreateCompanionBuilder,
          $$TestEntriesTableUpdateCompanionBuilder,
          (
            TestEntry,
            BaseReferences<_$AppDatabase, $TestEntriesTable, TestEntry>,
          ),
          TestEntry,
          PrefetchHooks Function()
        > {
  $$TestEntriesTableTableManager(_$AppDatabase db, $TestEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TestEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TestEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TestEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> value = const Value.absent(),
              }) => TestEntriesCompanion(id: id, name: name, value: value),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int value,
              }) =>
                  TestEntriesCompanion.insert(id: id, name: name, value: value),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TestEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestEntriesTable,
      TestEntry,
      $$TestEntriesTableFilterComposer,
      $$TestEntriesTableOrderingComposer,
      $$TestEntriesTableAnnotationComposer,
      $$TestEntriesTableCreateCompanionBuilder,
      $$TestEntriesTableUpdateCompanionBuilder,
      (TestEntry, BaseReferences<_$AppDatabase, $TestEntriesTable, TestEntry>),
      TestEntry,
      PrefetchHooks Function()
    >;
typedef $$ExerciseVariantsTableCreateCompanionBuilder =
    ExerciseVariantsCompanion Function({
      Value<int> id,
      required int variantIndex,
      Value<int?> sets,
      required double amount,
      required String unit,
    });
typedef $$ExerciseVariantsTableUpdateCompanionBuilder =
    ExerciseVariantsCompanion Function({
      Value<int> id,
      Value<int> variantIndex,
      Value<int?> sets,
      Value<double> amount,
      Value<String> unit,
    });

class $$ExerciseVariantsTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseVariantsTable> {
  $$ExerciseVariantsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get variantIndex => $composableBuilder(
    column: $table.variantIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExerciseVariantsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseVariantsTable> {
  $$ExerciseVariantsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get variantIndex => $composableBuilder(
    column: $table.variantIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sets => $composableBuilder(
    column: $table.sets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExerciseVariantsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseVariantsTable> {
  $$ExerciseVariantsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get variantIndex => $composableBuilder(
    column: $table.variantIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sets =>
      $composableBuilder(column: $table.sets, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);
}

class $$ExerciseVariantsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseVariantsTable,
          ExerciseVariant,
          $$ExerciseVariantsTableFilterComposer,
          $$ExerciseVariantsTableOrderingComposer,
          $$ExerciseVariantsTableAnnotationComposer,
          $$ExerciseVariantsTableCreateCompanionBuilder,
          $$ExerciseVariantsTableUpdateCompanionBuilder,
          (
            ExerciseVariant,
            BaseReferences<
              _$AppDatabase,
              $ExerciseVariantsTable,
              ExerciseVariant
            >,
          ),
          ExerciseVariant,
          PrefetchHooks Function()
        > {
  $$ExerciseVariantsTableTableManager(
    _$AppDatabase db,
    $ExerciseVariantsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseVariantsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseVariantsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExerciseVariantsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> variantIndex = const Value.absent(),
                Value<int?> sets = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> unit = const Value.absent(),
              }) => ExerciseVariantsCompanion(
                id: id,
                variantIndex: variantIndex,
                sets: sets,
                amount: amount,
                unit: unit,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int variantIndex,
                Value<int?> sets = const Value.absent(),
                required double amount,
                required String unit,
              }) => ExerciseVariantsCompanion.insert(
                id: id,
                variantIndex: variantIndex,
                sets: sets,
                amount: amount,
                unit: unit,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExerciseVariantsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseVariantsTable,
      ExerciseVariant,
      $$ExerciseVariantsTableFilterComposer,
      $$ExerciseVariantsTableOrderingComposer,
      $$ExerciseVariantsTableAnnotationComposer,
      $$ExerciseVariantsTableCreateCompanionBuilder,
      $$ExerciseVariantsTableUpdateCompanionBuilder,
      (
        ExerciseVariant,
        BaseReferences<_$AppDatabase, $ExerciseVariantsTable, ExerciseVariant>,
      ),
      ExerciseVariant,
      PrefetchHooks Function()
    >;
typedef $$ExercisesTableCreateCompanionBuilder =
    ExercisesCompanion Function({
      required String id,
      required String name,
      Value<int> rowid,
    });
typedef $$ExercisesTableUpdateCompanionBuilder =
    ExercisesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> rowid,
    });

class $$ExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExercisesTable> {
  $$ExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$ExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExercisesTable,
          Exercise,
          $$ExercisesTableFilterComposer,
          $$ExercisesTableOrderingComposer,
          $$ExercisesTableAnnotationComposer,
          $$ExercisesTableCreateCompanionBuilder,
          $$ExercisesTableUpdateCompanionBuilder,
          (Exercise, BaseReferences<_$AppDatabase, $ExercisesTable, Exercise>),
          Exercise,
          PrefetchHooks Function()
        > {
  $$ExercisesTableTableManager(_$AppDatabase db, $ExercisesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExercisesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExercisesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExercisesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion(id: id, name: name, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => ExercisesCompanion.insert(id: id, name: name, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExercisesTable,
      Exercise,
      $$ExercisesTableFilterComposer,
      $$ExercisesTableOrderingComposer,
      $$ExercisesTableAnnotationComposer,
      $$ExercisesTableCreateCompanionBuilder,
      $$ExercisesTableUpdateCompanionBuilder,
      (Exercise, BaseReferences<_$AppDatabase, $ExercisesTable, Exercise>),
      Exercise,
      PrefetchHooks Function()
    >;
typedef $$ExerciseVariantLinksTableCreateCompanionBuilder =
    ExerciseVariantLinksCompanion Function({
      Value<int> id,
      required String exerciseId,
      required int variantId,
    });
typedef $$ExerciseVariantLinksTableUpdateCompanionBuilder =
    ExerciseVariantLinksCompanion Function({
      Value<int> id,
      Value<String> exerciseId,
      Value<int> variantId,
    });

class $$ExerciseVariantLinksTableFilterComposer
    extends Composer<_$AppDatabase, $ExerciseVariantLinksTable> {
  $$ExerciseVariantLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExerciseVariantLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $ExerciseVariantLinksTable> {
  $$ExerciseVariantLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get variantId => $composableBuilder(
    column: $table.variantId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExerciseVariantLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExerciseVariantLinksTable> {
  $$ExerciseVariantLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get variantId =>
      $composableBuilder(column: $table.variantId, builder: (column) => column);
}

class $$ExerciseVariantLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExerciseVariantLinksTable,
          ExerciseVariantLink,
          $$ExerciseVariantLinksTableFilterComposer,
          $$ExerciseVariantLinksTableOrderingComposer,
          $$ExerciseVariantLinksTableAnnotationComposer,
          $$ExerciseVariantLinksTableCreateCompanionBuilder,
          $$ExerciseVariantLinksTableUpdateCompanionBuilder,
          (
            ExerciseVariantLink,
            BaseReferences<
              _$AppDatabase,
              $ExerciseVariantLinksTable,
              ExerciseVariantLink
            >,
          ),
          ExerciseVariantLink,
          PrefetchHooks Function()
        > {
  $$ExerciseVariantLinksTableTableManager(
    _$AppDatabase db,
    $ExerciseVariantLinksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExerciseVariantLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExerciseVariantLinksTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ExerciseVariantLinksTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int> variantId = const Value.absent(),
              }) => ExerciseVariantLinksCompanion(
                id: id,
                exerciseId: exerciseId,
                variantId: variantId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String exerciseId,
                required int variantId,
              }) => ExerciseVariantLinksCompanion.insert(
                id: id,
                exerciseId: exerciseId,
                variantId: variantId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExerciseVariantLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExerciseVariantLinksTable,
      ExerciseVariantLink,
      $$ExerciseVariantLinksTableFilterComposer,
      $$ExerciseVariantLinksTableOrderingComposer,
      $$ExerciseVariantLinksTableAnnotationComposer,
      $$ExerciseVariantLinksTableCreateCompanionBuilder,
      $$ExerciseVariantLinksTableUpdateCompanionBuilder,
      (
        ExerciseVariantLink,
        BaseReferences<
          _$AppDatabase,
          $ExerciseVariantLinksTable,
          ExerciseVariantLink
        >,
      ),
      ExerciseVariantLink,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TestEntriesTableTableManager get testEntries =>
      $$TestEntriesTableTableManager(_db, _db.testEntries);
  $$ExerciseVariantsTableTableManager get exerciseVariants =>
      $$ExerciseVariantsTableTableManager(_db, _db.exerciseVariants);
  $$ExercisesTableTableManager get exercises =>
      $$ExercisesTableTableManager(_db, _db.exercises);
  $$ExerciseVariantLinksTableTableManager get exerciseVariantLinks =>
      $$ExerciseVariantLinksTableTableManager(_db, _db.exerciseVariantLinks);
}
