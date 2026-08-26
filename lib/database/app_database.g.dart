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
    with TableInfo<$ExerciseVariantsTable, ExerciseVariantRow> {
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
    Insertable<ExerciseVariantRow> instance, {
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
  ExerciseVariantRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseVariantRow(
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

class ExerciseVariantRow extends DataClass
    implements Insertable<ExerciseVariantRow> {
  final int id;
  final int variantIndex;
  final int? sets;
  final double amount;
  final String unit;
  const ExerciseVariantRow({
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

  factory ExerciseVariantRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseVariantRow(
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

  ExerciseVariantRow copyWith({
    int? id,
    int? variantIndex,
    Value<int?> sets = const Value.absent(),
    double? amount,
    String? unit,
  }) => ExerciseVariantRow(
    id: id ?? this.id,
    variantIndex: variantIndex ?? this.variantIndex,
    sets: sets.present ? sets.value : this.sets,
    amount: amount ?? this.amount,
    unit: unit ?? this.unit,
  );
  ExerciseVariantRow copyWithCompanion(ExerciseVariantsCompanion data) {
    return ExerciseVariantRow(
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
    return (StringBuffer('ExerciseVariantRow(')
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
      (other is ExerciseVariantRow &&
          other.id == this.id &&
          other.variantIndex == this.variantIndex &&
          other.sets == this.sets &&
          other.amount == this.amount &&
          other.unit == this.unit);
}

class ExerciseVariantsCompanion extends UpdateCompanion<ExerciseVariantRow> {
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
  static Insertable<ExerciseVariantRow> custom({
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
    with TableInfo<$ExercisesTable, ExerciseRow> {
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
    Insertable<ExerciseRow> instance, {
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
  ExerciseRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseRow(
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

class ExerciseRow extends DataClass implements Insertable<ExerciseRow> {
  final String id;
  final String name;
  const ExerciseRow({required this.id, required this.name});
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

  factory ExerciseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseRow(
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

  ExerciseRow copyWith({String? id, String? name}) =>
      ExerciseRow(id: id ?? this.id, name: name ?? this.name);
  ExerciseRow copyWithCompanion(ExercisesCompanion data) {
    return ExerciseRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseRow(')
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
      (other is ExerciseRow && other.id == this.id && other.name == this.name);
}

class ExercisesCompanion extends UpdateCompanion<ExerciseRow> {
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
  static Insertable<ExerciseRow> custom({
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

class $EquipmentItemsTable extends EquipmentItems
    with TableInfo<$EquipmentItemsTable, EquipmentItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentItemsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _rarityMeta = const VerificationMeta('rarity');
  @override
  late final GeneratedColumn<String> rarity = GeneratedColumn<String>(
    'rarity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<String> slot = GeneratedColumn<String>(
    'slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cooldownHoursMeta = const VerificationMeta(
    'cooldownHours',
  );
  @override
  late final GeneratedColumn<int> cooldownHours = GeneratedColumn<int>(
    'cooldown_hours',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, rarity, slot, cooldownHours];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<EquipmentItemRow> instance, {
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
    if (data.containsKey('rarity')) {
      context.handle(
        _rarityMeta,
        rarity.isAcceptableOrUnknown(data['rarity']!, _rarityMeta),
      );
    } else if (isInserting) {
      context.missing(_rarityMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
        _slotMeta,
        slot.isAcceptableOrUnknown(data['slot']!, _slotMeta),
      );
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    if (data.containsKey('cooldown_hours')) {
      context.handle(
        _cooldownHoursMeta,
        cooldownHours.isAcceptableOrUnknown(
          data['cooldown_hours']!,
          _cooldownHoursMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cooldownHoursMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  EquipmentItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      rarity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rarity'],
      )!,
      slot: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slot'],
      )!,
      cooldownHours: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cooldown_hours'],
      )!,
    );
  }

  @override
  $EquipmentItemsTable createAlias(String alias) {
    return $EquipmentItemsTable(attachedDatabase, alias);
  }
}

class EquipmentItemRow extends DataClass
    implements Insertable<EquipmentItemRow> {
  final String id;
  final String name;
  final String rarity;
  final String slot;
  final int cooldownHours;
  const EquipmentItemRow({
    required this.id,
    required this.name,
    required this.rarity,
    required this.slot,
    required this.cooldownHours,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['rarity'] = Variable<String>(rarity);
    map['slot'] = Variable<String>(slot);
    map['cooldown_hours'] = Variable<int>(cooldownHours);
    return map;
  }

  EquipmentItemsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentItemsCompanion(
      id: Value(id),
      name: Value(name),
      rarity: Value(rarity),
      slot: Value(slot),
      cooldownHours: Value(cooldownHours),
    );
  }

  factory EquipmentItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentItemRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      rarity: serializer.fromJson<String>(json['rarity']),
      slot: serializer.fromJson<String>(json['slot']),
      cooldownHours: serializer.fromJson<int>(json['cooldownHours']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'rarity': serializer.toJson<String>(rarity),
      'slot': serializer.toJson<String>(slot),
      'cooldownHours': serializer.toJson<int>(cooldownHours),
    };
  }

  EquipmentItemRow copyWith({
    String? id,
    String? name,
    String? rarity,
    String? slot,
    int? cooldownHours,
  }) => EquipmentItemRow(
    id: id ?? this.id,
    name: name ?? this.name,
    rarity: rarity ?? this.rarity,
    slot: slot ?? this.slot,
    cooldownHours: cooldownHours ?? this.cooldownHours,
  );
  EquipmentItemRow copyWithCompanion(EquipmentItemsCompanion data) {
    return EquipmentItemRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      rarity: data.rarity.present ? data.rarity.value : this.rarity,
      slot: data.slot.present ? data.slot.value : this.slot,
      cooldownHours: data.cooldownHours.present
          ? data.cooldownHours.value
          : this.cooldownHours,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentItemRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rarity: $rarity, ')
          ..write('slot: $slot, ')
          ..write('cooldownHours: $cooldownHours')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, rarity, slot, cooldownHours);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentItemRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.rarity == this.rarity &&
          other.slot == this.slot &&
          other.cooldownHours == this.cooldownHours);
}

class EquipmentItemsCompanion extends UpdateCompanion<EquipmentItemRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> rarity;
  final Value<String> slot;
  final Value<int> cooldownHours;
  final Value<int> rowid;
  const EquipmentItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rarity = const Value.absent(),
    this.slot = const Value.absent(),
    this.cooldownHours = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EquipmentItemsCompanion.insert({
    required String id,
    required String name,
    required String rarity,
    required String slot,
    required int cooldownHours,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       rarity = Value(rarity),
       slot = Value(slot),
       cooldownHours = Value(cooldownHours);
  static Insertable<EquipmentItemRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? rarity,
    Expression<String>? slot,
    Expression<int>? cooldownHours,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rarity != null) 'rarity': rarity,
      if (slot != null) 'slot': slot,
      if (cooldownHours != null) 'cooldown_hours': cooldownHours,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EquipmentItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? rarity,
    Value<String>? slot,
    Value<int>? cooldownHours,
    Value<int>? rowid,
  }) {
    return EquipmentItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      rarity: rarity ?? this.rarity,
      slot: slot ?? this.slot,
      cooldownHours: cooldownHours ?? this.cooldownHours,
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
    if (rarity.present) {
      map['rarity'] = Variable<String>(rarity.value);
    }
    if (slot.present) {
      map['slot'] = Variable<String>(slot.value);
    }
    if (cooldownHours.present) {
      map['cooldown_hours'] = Variable<int>(cooldownHours.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rarity: $rarity, ')
          ..write('slot: $slot, ')
          ..write('cooldownHours: $cooldownHours, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EquipmentItemExercisesTable extends EquipmentItemExercises
    with TableInfo<$EquipmentItemExercisesTable, EquipmentItemExerciseRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentItemExercisesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _equipmentItemIdMeta = const VerificationMeta(
    'equipmentItemId',
  );
  @override
  late final GeneratedColumn<String> equipmentItemId = GeneratedColumn<String>(
    'equipment_item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _maxVariantMeta = const VerificationMeta(
    'maxVariant',
  );
  @override
  late final GeneratedColumn<int> maxVariant = GeneratedColumn<int>(
    'max_variant',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    equipmentItemId,
    exerciseId,
    maxVariant,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_item_exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<EquipmentItemExerciseRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('equipment_item_id')) {
      context.handle(
        _equipmentItemIdMeta,
        equipmentItemId.isAcceptableOrUnknown(
          data['equipment_item_id']!,
          _equipmentItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_equipmentItemIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    if (data.containsKey('max_variant')) {
      context.handle(
        _maxVariantMeta,
        maxVariant.isAcceptableOrUnknown(data['max_variant']!, _maxVariantMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {equipmentItemId, exerciseId},
  ];
  @override
  EquipmentItemExerciseRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentItemExerciseRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      equipmentItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment_item_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
      )!,
      maxVariant: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_variant'],
      )!,
    );
  }

  @override
  $EquipmentItemExercisesTable createAlias(String alias) {
    return $EquipmentItemExercisesTable(attachedDatabase, alias);
  }
}

class EquipmentItemExerciseRow extends DataClass
    implements Insertable<EquipmentItemExerciseRow> {
  final int id;
  final String equipmentItemId;
  final String exerciseId;
  final int maxVariant;
  const EquipmentItemExerciseRow({
    required this.id,
    required this.equipmentItemId,
    required this.exerciseId,
    required this.maxVariant,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['equipment_item_id'] = Variable<String>(equipmentItemId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['max_variant'] = Variable<int>(maxVariant);
    return map;
  }

  EquipmentItemExercisesCompanion toCompanion(bool nullToAbsent) {
    return EquipmentItemExercisesCompanion(
      id: Value(id),
      equipmentItemId: Value(equipmentItemId),
      exerciseId: Value(exerciseId),
      maxVariant: Value(maxVariant),
    );
  }

  factory EquipmentItemExerciseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentItemExerciseRow(
      id: serializer.fromJson<int>(json['id']),
      equipmentItemId: serializer.fromJson<String>(json['equipmentItemId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
      maxVariant: serializer.fromJson<int>(json['maxVariant']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'equipmentItemId': serializer.toJson<String>(equipmentItemId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'maxVariant': serializer.toJson<int>(maxVariant),
    };
  }

  EquipmentItemExerciseRow copyWith({
    int? id,
    String? equipmentItemId,
    String? exerciseId,
    int? maxVariant,
  }) => EquipmentItemExerciseRow(
    id: id ?? this.id,
    equipmentItemId: equipmentItemId ?? this.equipmentItemId,
    exerciseId: exerciseId ?? this.exerciseId,
    maxVariant: maxVariant ?? this.maxVariant,
  );
  EquipmentItemExerciseRow copyWithCompanion(
    EquipmentItemExercisesCompanion data,
  ) {
    return EquipmentItemExerciseRow(
      id: data.id.present ? data.id.value : this.id,
      equipmentItemId: data.equipmentItemId.present
          ? data.equipmentItemId.value
          : this.equipmentItemId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
      maxVariant: data.maxVariant.present
          ? data.maxVariant.value
          : this.maxVariant,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentItemExerciseRow(')
          ..write('id: $id, ')
          ..write('equipmentItemId: $equipmentItemId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('maxVariant: $maxVariant')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, equipmentItemId, exerciseId, maxVariant);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentItemExerciseRow &&
          other.id == this.id &&
          other.equipmentItemId == this.equipmentItemId &&
          other.exerciseId == this.exerciseId &&
          other.maxVariant == this.maxVariant);
}

class EquipmentItemExercisesCompanion
    extends UpdateCompanion<EquipmentItemExerciseRow> {
  final Value<int> id;
  final Value<String> equipmentItemId;
  final Value<String> exerciseId;
  final Value<int> maxVariant;
  const EquipmentItemExercisesCompanion({
    this.id = const Value.absent(),
    this.equipmentItemId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.maxVariant = const Value.absent(),
  });
  EquipmentItemExercisesCompanion.insert({
    this.id = const Value.absent(),
    required String equipmentItemId,
    required String exerciseId,
    this.maxVariant = const Value.absent(),
  }) : equipmentItemId = Value(equipmentItemId),
       exerciseId = Value(exerciseId);
  static Insertable<EquipmentItemExerciseRow> custom({
    Expression<int>? id,
    Expression<String>? equipmentItemId,
    Expression<String>? exerciseId,
    Expression<int>? maxVariant,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (equipmentItemId != null) 'equipment_item_id': equipmentItemId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (maxVariant != null) 'max_variant': maxVariant,
    });
  }

  EquipmentItemExercisesCompanion copyWith({
    Value<int>? id,
    Value<String>? equipmentItemId,
    Value<String>? exerciseId,
    Value<int>? maxVariant,
  }) {
    return EquipmentItemExercisesCompanion(
      id: id ?? this.id,
      equipmentItemId: equipmentItemId ?? this.equipmentItemId,
      exerciseId: exerciseId ?? this.exerciseId,
      maxVariant: maxVariant ?? this.maxVariant,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (equipmentItemId.present) {
      map['equipment_item_id'] = Variable<String>(equipmentItemId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (maxVariant.present) {
      map['max_variant'] = Variable<int>(maxVariant.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentItemExercisesCompanion(')
          ..write('id: $id, ')
          ..write('equipmentItemId: $equipmentItemId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('maxVariant: $maxVariant')
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
  late final $EquipmentItemsTable equipmentItems = $EquipmentItemsTable(this);
  late final $EquipmentItemExercisesTable equipmentItemExercises =
      $EquipmentItemExercisesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    testEntries,
    exerciseVariants,
    exercises,
    exerciseVariantLinks,
    equipmentItems,
    equipmentItemExercises,
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
          ExerciseVariantRow,
          $$ExerciseVariantsTableFilterComposer,
          $$ExerciseVariantsTableOrderingComposer,
          $$ExerciseVariantsTableAnnotationComposer,
          $$ExerciseVariantsTableCreateCompanionBuilder,
          $$ExerciseVariantsTableUpdateCompanionBuilder,
          (
            ExerciseVariantRow,
            BaseReferences<
              _$AppDatabase,
              $ExerciseVariantsTable,
              ExerciseVariantRow
            >,
          ),
          ExerciseVariantRow,
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
      ExerciseVariantRow,
      $$ExerciseVariantsTableFilterComposer,
      $$ExerciseVariantsTableOrderingComposer,
      $$ExerciseVariantsTableAnnotationComposer,
      $$ExerciseVariantsTableCreateCompanionBuilder,
      $$ExerciseVariantsTableUpdateCompanionBuilder,
      (
        ExerciseVariantRow,
        BaseReferences<
          _$AppDatabase,
          $ExerciseVariantsTable,
          ExerciseVariantRow
        >,
      ),
      ExerciseVariantRow,
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
          ExerciseRow,
          $$ExercisesTableFilterComposer,
          $$ExercisesTableOrderingComposer,
          $$ExercisesTableAnnotationComposer,
          $$ExercisesTableCreateCompanionBuilder,
          $$ExercisesTableUpdateCompanionBuilder,
          (
            ExerciseRow,
            BaseReferences<_$AppDatabase, $ExercisesTable, ExerciseRow>,
          ),
          ExerciseRow,
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
      ExerciseRow,
      $$ExercisesTableFilterComposer,
      $$ExercisesTableOrderingComposer,
      $$ExercisesTableAnnotationComposer,
      $$ExercisesTableCreateCompanionBuilder,
      $$ExercisesTableUpdateCompanionBuilder,
      (
        ExerciseRow,
        BaseReferences<_$AppDatabase, $ExercisesTable, ExerciseRow>,
      ),
      ExerciseRow,
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
typedef $$EquipmentItemsTableCreateCompanionBuilder =
    EquipmentItemsCompanion Function({
      required String id,
      required String name,
      required String rarity,
      required String slot,
      required int cooldownHours,
      Value<int> rowid,
    });
typedef $$EquipmentItemsTableUpdateCompanionBuilder =
    EquipmentItemsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> rarity,
      Value<String> slot,
      Value<int> cooldownHours,
      Value<int> rowid,
    });

class $$EquipmentItemsTableFilterComposer
    extends Composer<_$AppDatabase, $EquipmentItemsTable> {
  $$EquipmentItemsTableFilterComposer({
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

  ColumnFilters<String> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cooldownHours => $composableBuilder(
    column: $table.cooldownHours,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EquipmentItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $EquipmentItemsTable> {
  $$EquipmentItemsTableOrderingComposer({
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

  ColumnOrderings<String> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cooldownHours => $composableBuilder(
    column: $table.cooldownHours,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EquipmentItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EquipmentItemsTable> {
  $$EquipmentItemsTableAnnotationComposer({
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

  GeneratedColumn<String> get rarity =>
      $composableBuilder(column: $table.rarity, builder: (column) => column);

  GeneratedColumn<String> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  GeneratedColumn<int> get cooldownHours => $composableBuilder(
    column: $table.cooldownHours,
    builder: (column) => column,
  );
}

class $$EquipmentItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EquipmentItemsTable,
          EquipmentItemRow,
          $$EquipmentItemsTableFilterComposer,
          $$EquipmentItemsTableOrderingComposer,
          $$EquipmentItemsTableAnnotationComposer,
          $$EquipmentItemsTableCreateCompanionBuilder,
          $$EquipmentItemsTableUpdateCompanionBuilder,
          (
            EquipmentItemRow,
            BaseReferences<
              _$AppDatabase,
              $EquipmentItemsTable,
              EquipmentItemRow
            >,
          ),
          EquipmentItemRow,
          PrefetchHooks Function()
        > {
  $$EquipmentItemsTableTableManager(
    _$AppDatabase db,
    $EquipmentItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EquipmentItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EquipmentItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EquipmentItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> rarity = const Value.absent(),
                Value<String> slot = const Value.absent(),
                Value<int> cooldownHours = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EquipmentItemsCompanion(
                id: id,
                name: name,
                rarity: rarity,
                slot: slot,
                cooldownHours: cooldownHours,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String rarity,
                required String slot,
                required int cooldownHours,
                Value<int> rowid = const Value.absent(),
              }) => EquipmentItemsCompanion.insert(
                id: id,
                name: name,
                rarity: rarity,
                slot: slot,
                cooldownHours: cooldownHours,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EquipmentItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EquipmentItemsTable,
      EquipmentItemRow,
      $$EquipmentItemsTableFilterComposer,
      $$EquipmentItemsTableOrderingComposer,
      $$EquipmentItemsTableAnnotationComposer,
      $$EquipmentItemsTableCreateCompanionBuilder,
      $$EquipmentItemsTableUpdateCompanionBuilder,
      (
        EquipmentItemRow,
        BaseReferences<_$AppDatabase, $EquipmentItemsTable, EquipmentItemRow>,
      ),
      EquipmentItemRow,
      PrefetchHooks Function()
    >;
typedef $$EquipmentItemExercisesTableCreateCompanionBuilder =
    EquipmentItemExercisesCompanion Function({
      Value<int> id,
      required String equipmentItemId,
      required String exerciseId,
      Value<int> maxVariant,
    });
typedef $$EquipmentItemExercisesTableUpdateCompanionBuilder =
    EquipmentItemExercisesCompanion Function({
      Value<int> id,
      Value<String> equipmentItemId,
      Value<String> exerciseId,
      Value<int> maxVariant,
    });

class $$EquipmentItemExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $EquipmentItemExercisesTable> {
  $$EquipmentItemExercisesTableFilterComposer({
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

  ColumnFilters<String> get equipmentItemId => $composableBuilder(
    column: $table.equipmentItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxVariant => $composableBuilder(
    column: $table.maxVariant,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EquipmentItemExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $EquipmentItemExercisesTable> {
  $$EquipmentItemExercisesTableOrderingComposer({
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

  ColumnOrderings<String> get equipmentItemId => $composableBuilder(
    column: $table.equipmentItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxVariant => $composableBuilder(
    column: $table.maxVariant,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EquipmentItemExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EquipmentItemExercisesTable> {
  $$EquipmentItemExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get equipmentItemId => $composableBuilder(
    column: $table.equipmentItemId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxVariant => $composableBuilder(
    column: $table.maxVariant,
    builder: (column) => column,
  );
}

class $$EquipmentItemExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EquipmentItemExercisesTable,
          EquipmentItemExerciseRow,
          $$EquipmentItemExercisesTableFilterComposer,
          $$EquipmentItemExercisesTableOrderingComposer,
          $$EquipmentItemExercisesTableAnnotationComposer,
          $$EquipmentItemExercisesTableCreateCompanionBuilder,
          $$EquipmentItemExercisesTableUpdateCompanionBuilder,
          (
            EquipmentItemExerciseRow,
            BaseReferences<
              _$AppDatabase,
              $EquipmentItemExercisesTable,
              EquipmentItemExerciseRow
            >,
          ),
          EquipmentItemExerciseRow,
          PrefetchHooks Function()
        > {
  $$EquipmentItemExercisesTableTableManager(
    _$AppDatabase db,
    $EquipmentItemExercisesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EquipmentItemExercisesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$EquipmentItemExercisesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$EquipmentItemExercisesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> equipmentItemId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int> maxVariant = const Value.absent(),
              }) => EquipmentItemExercisesCompanion(
                id: id,
                equipmentItemId: equipmentItemId,
                exerciseId: exerciseId,
                maxVariant: maxVariant,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String equipmentItemId,
                required String exerciseId,
                Value<int> maxVariant = const Value.absent(),
              }) => EquipmentItemExercisesCompanion.insert(
                id: id,
                equipmentItemId: equipmentItemId,
                exerciseId: exerciseId,
                maxVariant: maxVariant,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EquipmentItemExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EquipmentItemExercisesTable,
      EquipmentItemExerciseRow,
      $$EquipmentItemExercisesTableFilterComposer,
      $$EquipmentItemExercisesTableOrderingComposer,
      $$EquipmentItemExercisesTableAnnotationComposer,
      $$EquipmentItemExercisesTableCreateCompanionBuilder,
      $$EquipmentItemExercisesTableUpdateCompanionBuilder,
      (
        EquipmentItemExerciseRow,
        BaseReferences<
          _$AppDatabase,
          $EquipmentItemExercisesTable,
          EquipmentItemExerciseRow
        >,
      ),
      EquipmentItemExerciseRow,
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
  $$EquipmentItemsTableTableManager get equipmentItems =>
      $$EquipmentItemsTableTableManager(_db, _db.equipmentItems);
  $$EquipmentItemExercisesTableTableManager get equipmentItemExercises =>
      $$EquipmentItemExercisesTableTableManager(
        _db,
        _db.equipmentItemExercises,
      );
}
