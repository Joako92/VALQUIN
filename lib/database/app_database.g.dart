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

class $EquipmentItemStatsTable extends EquipmentItemStats
    with TableInfo<$EquipmentItemStatsTable, EquipmentItemStatRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentItemStatsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _statMeta = const VerificationMeta('stat');
  @override
  late final GeneratedColumn<String> stat = GeneratedColumn<String>(
    'stat',
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
  List<GeneratedColumn> get $columns => [id, equipmentItemId, stat, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_item_stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<EquipmentItemStatRow> instance, {
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
    if (data.containsKey('stat')) {
      context.handle(
        _statMeta,
        stat.isAcceptableOrUnknown(data['stat']!, _statMeta),
      );
    } else if (isInserting) {
      context.missing(_statMeta);
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
  EquipmentItemStatRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentItemStatRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      equipmentItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment_item_id'],
      )!,
      stat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stat'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $EquipmentItemStatsTable createAlias(String alias) {
    return $EquipmentItemStatsTable(attachedDatabase, alias);
  }
}

class EquipmentItemStatRow extends DataClass
    implements Insertable<EquipmentItemStatRow> {
  final int id;
  final String equipmentItemId;
  final String stat;
  final int value;
  const EquipmentItemStatRow({
    required this.id,
    required this.equipmentItemId,
    required this.stat,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['equipment_item_id'] = Variable<String>(equipmentItemId);
    map['stat'] = Variable<String>(stat);
    map['value'] = Variable<int>(value);
    return map;
  }

  EquipmentItemStatsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentItemStatsCompanion(
      id: Value(id),
      equipmentItemId: Value(equipmentItemId),
      stat: Value(stat),
      value: Value(value),
    );
  }

  factory EquipmentItemStatRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentItemStatRow(
      id: serializer.fromJson<int>(json['id']),
      equipmentItemId: serializer.fromJson<String>(json['equipmentItemId']),
      stat: serializer.fromJson<String>(json['stat']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'equipmentItemId': serializer.toJson<String>(equipmentItemId),
      'stat': serializer.toJson<String>(stat),
      'value': serializer.toJson<int>(value),
    };
  }

  EquipmentItemStatRow copyWith({
    int? id,
    String? equipmentItemId,
    String? stat,
    int? value,
  }) => EquipmentItemStatRow(
    id: id ?? this.id,
    equipmentItemId: equipmentItemId ?? this.equipmentItemId,
    stat: stat ?? this.stat,
    value: value ?? this.value,
  );
  EquipmentItemStatRow copyWithCompanion(EquipmentItemStatsCompanion data) {
    return EquipmentItemStatRow(
      id: data.id.present ? data.id.value : this.id,
      equipmentItemId: data.equipmentItemId.present
          ? data.equipmentItemId.value
          : this.equipmentItemId,
      stat: data.stat.present ? data.stat.value : this.stat,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentItemStatRow(')
          ..write('id: $id, ')
          ..write('equipmentItemId: $equipmentItemId, ')
          ..write('stat: $stat, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, equipmentItemId, stat, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentItemStatRow &&
          other.id == this.id &&
          other.equipmentItemId == this.equipmentItemId &&
          other.stat == this.stat &&
          other.value == this.value);
}

class EquipmentItemStatsCompanion
    extends UpdateCompanion<EquipmentItemStatRow> {
  final Value<int> id;
  final Value<String> equipmentItemId;
  final Value<String> stat;
  final Value<int> value;
  const EquipmentItemStatsCompanion({
    this.id = const Value.absent(),
    this.equipmentItemId = const Value.absent(),
    this.stat = const Value.absent(),
    this.value = const Value.absent(),
  });
  EquipmentItemStatsCompanion.insert({
    this.id = const Value.absent(),
    required String equipmentItemId,
    required String stat,
    required int value,
  }) : equipmentItemId = Value(equipmentItemId),
       stat = Value(stat),
       value = Value(value);
  static Insertable<EquipmentItemStatRow> custom({
    Expression<int>? id,
    Expression<String>? equipmentItemId,
    Expression<String>? stat,
    Expression<int>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (equipmentItemId != null) 'equipment_item_id': equipmentItemId,
      if (stat != null) 'stat': stat,
      if (value != null) 'value': value,
    });
  }

  EquipmentItemStatsCompanion copyWith({
    Value<int>? id,
    Value<String>? equipmentItemId,
    Value<String>? stat,
    Value<int>? value,
  }) {
    return EquipmentItemStatsCompanion(
      id: id ?? this.id,
      equipmentItemId: equipmentItemId ?? this.equipmentItemId,
      stat: stat ?? this.stat,
      value: value ?? this.value,
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
    if (stat.present) {
      map['stat'] = Variable<String>(stat.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentItemStatsCompanion(')
          ..write('id: $id, ')
          ..write('equipmentItemId: $equipmentItemId, ')
          ..write('stat: $stat, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $EquipmentItemUnlockRequirementsTable
    extends EquipmentItemUnlockRequirements
    with
        TableInfo<
          $EquipmentItemUnlockRequirementsTable,
          EquipmentItemUnlockRequirementRow
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentItemUnlockRequirementsTable(this.attachedDatabase, [this._alias]);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES equipment_items (id)',
    ),
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
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
  List<GeneratedColumn> get $columns => [id, equipmentItemId, condition, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_item_unlock_requirements';
  @override
  VerificationContext validateIntegrity(
    Insertable<EquipmentItemUnlockRequirementRow> instance, {
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
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    } else if (isInserting) {
      context.missing(_conditionMeta);
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
  EquipmentItemUnlockRequirementRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentItemUnlockRequirementRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      equipmentItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment_item_id'],
      )!,
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $EquipmentItemUnlockRequirementsTable createAlias(String alias) {
    return $EquipmentItemUnlockRequirementsTable(attachedDatabase, alias);
  }
}

class EquipmentItemUnlockRequirementRow extends DataClass
    implements Insertable<EquipmentItemUnlockRequirementRow> {
  final int id;
  final String equipmentItemId;
  final String condition;
  final int value;
  const EquipmentItemUnlockRequirementRow({
    required this.id,
    required this.equipmentItemId,
    required this.condition,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['equipment_item_id'] = Variable<String>(equipmentItemId);
    map['condition'] = Variable<String>(condition);
    map['value'] = Variable<int>(value);
    return map;
  }

  EquipmentItemUnlockRequirementsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentItemUnlockRequirementsCompanion(
      id: Value(id),
      equipmentItemId: Value(equipmentItemId),
      condition: Value(condition),
      value: Value(value),
    );
  }

  factory EquipmentItemUnlockRequirementRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentItemUnlockRequirementRow(
      id: serializer.fromJson<int>(json['id']),
      equipmentItemId: serializer.fromJson<String>(json['equipmentItemId']),
      condition: serializer.fromJson<String>(json['condition']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'equipmentItemId': serializer.toJson<String>(equipmentItemId),
      'condition': serializer.toJson<String>(condition),
      'value': serializer.toJson<int>(value),
    };
  }

  EquipmentItemUnlockRequirementRow copyWith({
    int? id,
    String? equipmentItemId,
    String? condition,
    int? value,
  }) => EquipmentItemUnlockRequirementRow(
    id: id ?? this.id,
    equipmentItemId: equipmentItemId ?? this.equipmentItemId,
    condition: condition ?? this.condition,
    value: value ?? this.value,
  );
  EquipmentItemUnlockRequirementRow copyWithCompanion(
    EquipmentItemUnlockRequirementsCompanion data,
  ) {
    return EquipmentItemUnlockRequirementRow(
      id: data.id.present ? data.id.value : this.id,
      equipmentItemId: data.equipmentItemId.present
          ? data.equipmentItemId.value
          : this.equipmentItemId,
      condition: data.condition.present ? data.condition.value : this.condition,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentItemUnlockRequirementRow(')
          ..write('id: $id, ')
          ..write('equipmentItemId: $equipmentItemId, ')
          ..write('condition: $condition, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, equipmentItemId, condition, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentItemUnlockRequirementRow &&
          other.id == this.id &&
          other.equipmentItemId == this.equipmentItemId &&
          other.condition == this.condition &&
          other.value == this.value);
}

class EquipmentItemUnlockRequirementsCompanion
    extends UpdateCompanion<EquipmentItemUnlockRequirementRow> {
  final Value<int> id;
  final Value<String> equipmentItemId;
  final Value<String> condition;
  final Value<int> value;
  const EquipmentItemUnlockRequirementsCompanion({
    this.id = const Value.absent(),
    this.equipmentItemId = const Value.absent(),
    this.condition = const Value.absent(),
    this.value = const Value.absent(),
  });
  EquipmentItemUnlockRequirementsCompanion.insert({
    this.id = const Value.absent(),
    required String equipmentItemId,
    required String condition,
    required int value,
  }) : equipmentItemId = Value(equipmentItemId),
       condition = Value(condition),
       value = Value(value);
  static Insertable<EquipmentItemUnlockRequirementRow> custom({
    Expression<int>? id,
    Expression<String>? equipmentItemId,
    Expression<String>? condition,
    Expression<int>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (equipmentItemId != null) 'equipment_item_id': equipmentItemId,
      if (condition != null) 'condition': condition,
      if (value != null) 'value': value,
    });
  }

  EquipmentItemUnlockRequirementsCompanion copyWith({
    Value<int>? id,
    Value<String>? equipmentItemId,
    Value<String>? condition,
    Value<int>? value,
  }) {
    return EquipmentItemUnlockRequirementsCompanion(
      id: id ?? this.id,
      equipmentItemId: equipmentItemId ?? this.equipmentItemId,
      condition: condition ?? this.condition,
      value: value ?? this.value,
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
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentItemUnlockRequirementsCompanion(')
          ..write('id: $id, ')
          ..write('equipmentItemId: $equipmentItemId, ')
          ..write('condition: $condition, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $EquipmentItemEquipRequirementsTable
    extends EquipmentItemEquipRequirements
    with
        TableInfo<
          $EquipmentItemEquipRequirementsTable,
          EquipmentItemEquipRequirementRow
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentItemEquipRequirementsTable(this.attachedDatabase, [this._alias]);
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
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES equipment_items (id)',
    ),
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
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
  List<GeneratedColumn> get $columns => [id, equipmentItemId, condition, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment_item_equip_requirements';
  @override
  VerificationContext validateIntegrity(
    Insertable<EquipmentItemEquipRequirementRow> instance, {
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
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    } else if (isInserting) {
      context.missing(_conditionMeta);
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
  EquipmentItemEquipRequirementRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentItemEquipRequirementRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      equipmentItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}equipment_item_id'],
      )!,
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $EquipmentItemEquipRequirementsTable createAlias(String alias) {
    return $EquipmentItemEquipRequirementsTable(attachedDatabase, alias);
  }
}

class EquipmentItemEquipRequirementRow extends DataClass
    implements Insertable<EquipmentItemEquipRequirementRow> {
  final int id;
  final String equipmentItemId;
  final String condition;
  final int value;
  const EquipmentItemEquipRequirementRow({
    required this.id,
    required this.equipmentItemId,
    required this.condition,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['equipment_item_id'] = Variable<String>(equipmentItemId);
    map['condition'] = Variable<String>(condition);
    map['value'] = Variable<int>(value);
    return map;
  }

  EquipmentItemEquipRequirementsCompanion toCompanion(bool nullToAbsent) {
    return EquipmentItemEquipRequirementsCompanion(
      id: Value(id),
      equipmentItemId: Value(equipmentItemId),
      condition: Value(condition),
      value: Value(value),
    );
  }

  factory EquipmentItemEquipRequirementRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentItemEquipRequirementRow(
      id: serializer.fromJson<int>(json['id']),
      equipmentItemId: serializer.fromJson<String>(json['equipmentItemId']),
      condition: serializer.fromJson<String>(json['condition']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'equipmentItemId': serializer.toJson<String>(equipmentItemId),
      'condition': serializer.toJson<String>(condition),
      'value': serializer.toJson<int>(value),
    };
  }

  EquipmentItemEquipRequirementRow copyWith({
    int? id,
    String? equipmentItemId,
    String? condition,
    int? value,
  }) => EquipmentItemEquipRequirementRow(
    id: id ?? this.id,
    equipmentItemId: equipmentItemId ?? this.equipmentItemId,
    condition: condition ?? this.condition,
    value: value ?? this.value,
  );
  EquipmentItemEquipRequirementRow copyWithCompanion(
    EquipmentItemEquipRequirementsCompanion data,
  ) {
    return EquipmentItemEquipRequirementRow(
      id: data.id.present ? data.id.value : this.id,
      equipmentItemId: data.equipmentItemId.present
          ? data.equipmentItemId.value
          : this.equipmentItemId,
      condition: data.condition.present ? data.condition.value : this.condition,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentItemEquipRequirementRow(')
          ..write('id: $id, ')
          ..write('equipmentItemId: $equipmentItemId, ')
          ..write('condition: $condition, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, equipmentItemId, condition, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentItemEquipRequirementRow &&
          other.id == this.id &&
          other.equipmentItemId == this.equipmentItemId &&
          other.condition == this.condition &&
          other.value == this.value);
}

class EquipmentItemEquipRequirementsCompanion
    extends UpdateCompanion<EquipmentItemEquipRequirementRow> {
  final Value<int> id;
  final Value<String> equipmentItemId;
  final Value<String> condition;
  final Value<int> value;
  const EquipmentItemEquipRequirementsCompanion({
    this.id = const Value.absent(),
    this.equipmentItemId = const Value.absent(),
    this.condition = const Value.absent(),
    this.value = const Value.absent(),
  });
  EquipmentItemEquipRequirementsCompanion.insert({
    this.id = const Value.absent(),
    required String equipmentItemId,
    required String condition,
    required int value,
  }) : equipmentItemId = Value(equipmentItemId),
       condition = Value(condition),
       value = Value(value);
  static Insertable<EquipmentItemEquipRequirementRow> custom({
    Expression<int>? id,
    Expression<String>? equipmentItemId,
    Expression<String>? condition,
    Expression<int>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (equipmentItemId != null) 'equipment_item_id': equipmentItemId,
      if (condition != null) 'condition': condition,
      if (value != null) 'value': value,
    });
  }

  EquipmentItemEquipRequirementsCompanion copyWith({
    Value<int>? id,
    Value<String>? equipmentItemId,
    Value<String>? condition,
    Value<int>? value,
  }) {
    return EquipmentItemEquipRequirementsCompanion(
      id: id ?? this.id,
      equipmentItemId: equipmentItemId ?? this.equipmentItemId,
      condition: condition ?? this.condition,
      value: value ?? this.value,
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
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentItemEquipRequirementsCompanion(')
          ..write('id: $id, ')
          ..write('equipmentItemId: $equipmentItemId, ')
          ..write('condition: $condition, ')
          ..write('value: $value')
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
  late final $EquipmentItemStatsTable equipmentItemStats =
      $EquipmentItemStatsTable(this);
  late final $EquipmentItemUnlockRequirementsTable
  equipmentItemUnlockRequirements = $EquipmentItemUnlockRequirementsTable(this);
  late final $EquipmentItemEquipRequirementsTable
  equipmentItemEquipRequirements = $EquipmentItemEquipRequirementsTable(this);
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
    equipmentItemStats,
    equipmentItemUnlockRequirements,
    equipmentItemEquipRequirements,
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

final class $$EquipmentItemsTableReferences
    extends
        BaseReferences<_$AppDatabase, $EquipmentItemsTable, EquipmentItemRow> {
  $$EquipmentItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $EquipmentItemUnlockRequirementsTable,
    List<EquipmentItemUnlockRequirementRow>
  >
  _equipmentItemUnlockRequirementsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.equipmentItemUnlockRequirements,
    aliasName:
        'equipment_items__id__equipment_item_unlock_requirements__equipment_item_id',
  );

  $$EquipmentItemUnlockRequirementsTableProcessedTableManager
  get equipmentItemUnlockRequirementsRefs {
    final manager =
        $$EquipmentItemUnlockRequirementsTableTableManager(
          $_db,
          $_db.equipmentItemUnlockRequirements,
        ).filter(
          (f) => f.equipmentItemId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _equipmentItemUnlockRequirementsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $EquipmentItemEquipRequirementsTable,
    List<EquipmentItemEquipRequirementRow>
  >
  _equipmentItemEquipRequirementsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.equipmentItemEquipRequirements,
    aliasName:
        'equipment_items__id__equipment_item_equip_requirements__equipment_item_id',
  );

  $$EquipmentItemEquipRequirementsTableProcessedTableManager
  get equipmentItemEquipRequirementsRefs {
    final manager =
        $$EquipmentItemEquipRequirementsTableTableManager(
          $_db,
          $_db.equipmentItemEquipRequirements,
        ).filter(
          (f) => f.equipmentItemId.id.sqlEquals($_itemColumn<String>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _equipmentItemEquipRequirementsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> equipmentItemUnlockRequirementsRefs(
    Expression<bool> Function(
      $$EquipmentItemUnlockRequirementsTableFilterComposer f,
    )
    f,
  ) {
    final $$EquipmentItemUnlockRequirementsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.equipmentItemUnlockRequirements,
          getReferencedColumn: (t) => t.equipmentItemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EquipmentItemUnlockRequirementsTableFilterComposer(
                $db: $db,
                $table: $db.equipmentItemUnlockRequirements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> equipmentItemEquipRequirementsRefs(
    Expression<bool> Function(
      $$EquipmentItemEquipRequirementsTableFilterComposer f,
    )
    f,
  ) {
    final $$EquipmentItemEquipRequirementsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.equipmentItemEquipRequirements,
          getReferencedColumn: (t) => t.equipmentItemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EquipmentItemEquipRequirementsTableFilterComposer(
                $db: $db,
                $table: $db.equipmentItemEquipRequirements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
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

  Expression<T> equipmentItemUnlockRequirementsRefs<T extends Object>(
    Expression<T> Function(
      $$EquipmentItemUnlockRequirementsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$EquipmentItemUnlockRequirementsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.equipmentItemUnlockRequirements,
          getReferencedColumn: (t) => t.equipmentItemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EquipmentItemUnlockRequirementsTableAnnotationComposer(
                $db: $db,
                $table: $db.equipmentItemUnlockRequirements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> equipmentItemEquipRequirementsRefs<T extends Object>(
    Expression<T> Function(
      $$EquipmentItemEquipRequirementsTableAnnotationComposer a,
    )
    f,
  ) {
    final $$EquipmentItemEquipRequirementsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.equipmentItemEquipRequirements,
          getReferencedColumn: (t) => t.equipmentItemId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$EquipmentItemEquipRequirementsTableAnnotationComposer(
                $db: $db,
                $table: $db.equipmentItemEquipRequirements,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
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
          (EquipmentItemRow, $$EquipmentItemsTableReferences),
          EquipmentItemRow,
          PrefetchHooks Function({
            bool equipmentItemUnlockRequirementsRefs,
            bool equipmentItemEquipRequirementsRefs,
          })
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
              .map(
                (e) => (
                  e.readTable(table),
                  $$EquipmentItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                equipmentItemUnlockRequirementsRefs = false,
                equipmentItemEquipRequirementsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (equipmentItemUnlockRequirementsRefs)
                      db.equipmentItemUnlockRequirements,
                    if (equipmentItemEquipRequirementsRefs)
                      db.equipmentItemEquipRequirements,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (equipmentItemUnlockRequirementsRefs)
                        await $_getPrefetchedData<
                          EquipmentItemRow,
                          $EquipmentItemsTable,
                          EquipmentItemUnlockRequirementRow
                        >(
                          currentTable: table,
                          referencedTable: $$EquipmentItemsTableReferences
                              ._equipmentItemUnlockRequirementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EquipmentItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).equipmentItemUnlockRequirementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.equipmentItemId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (equipmentItemEquipRequirementsRefs)
                        await $_getPrefetchedData<
                          EquipmentItemRow,
                          $EquipmentItemsTable,
                          EquipmentItemEquipRequirementRow
                        >(
                          currentTable: table,
                          referencedTable: $$EquipmentItemsTableReferences
                              ._equipmentItemEquipRequirementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EquipmentItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).equipmentItemEquipRequirementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.equipmentItemId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
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
      (EquipmentItemRow, $$EquipmentItemsTableReferences),
      EquipmentItemRow,
      PrefetchHooks Function({
        bool equipmentItemUnlockRequirementsRefs,
        bool equipmentItemEquipRequirementsRefs,
      })
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
typedef $$EquipmentItemStatsTableCreateCompanionBuilder =
    EquipmentItemStatsCompanion Function({
      Value<int> id,
      required String equipmentItemId,
      required String stat,
      required int value,
    });
typedef $$EquipmentItemStatsTableUpdateCompanionBuilder =
    EquipmentItemStatsCompanion Function({
      Value<int> id,
      Value<String> equipmentItemId,
      Value<String> stat,
      Value<int> value,
    });

class $$EquipmentItemStatsTableFilterComposer
    extends Composer<_$AppDatabase, $EquipmentItemStatsTable> {
  $$EquipmentItemStatsTableFilterComposer({
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

  ColumnFilters<String> get stat => $composableBuilder(
    column: $table.stat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EquipmentItemStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $EquipmentItemStatsTable> {
  $$EquipmentItemStatsTableOrderingComposer({
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

  ColumnOrderings<String> get stat => $composableBuilder(
    column: $table.stat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EquipmentItemStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EquipmentItemStatsTable> {
  $$EquipmentItemStatsTableAnnotationComposer({
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

  GeneratedColumn<String> get stat =>
      $composableBuilder(column: $table.stat, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$EquipmentItemStatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EquipmentItemStatsTable,
          EquipmentItemStatRow,
          $$EquipmentItemStatsTableFilterComposer,
          $$EquipmentItemStatsTableOrderingComposer,
          $$EquipmentItemStatsTableAnnotationComposer,
          $$EquipmentItemStatsTableCreateCompanionBuilder,
          $$EquipmentItemStatsTableUpdateCompanionBuilder,
          (
            EquipmentItemStatRow,
            BaseReferences<
              _$AppDatabase,
              $EquipmentItemStatsTable,
              EquipmentItemStatRow
            >,
          ),
          EquipmentItemStatRow,
          PrefetchHooks Function()
        > {
  $$EquipmentItemStatsTableTableManager(
    _$AppDatabase db,
    $EquipmentItemStatsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EquipmentItemStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EquipmentItemStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EquipmentItemStatsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> equipmentItemId = const Value.absent(),
                Value<String> stat = const Value.absent(),
                Value<int> value = const Value.absent(),
              }) => EquipmentItemStatsCompanion(
                id: id,
                equipmentItemId: equipmentItemId,
                stat: stat,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String equipmentItemId,
                required String stat,
                required int value,
              }) => EquipmentItemStatsCompanion.insert(
                id: id,
                equipmentItemId: equipmentItemId,
                stat: stat,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EquipmentItemStatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EquipmentItemStatsTable,
      EquipmentItemStatRow,
      $$EquipmentItemStatsTableFilterComposer,
      $$EquipmentItemStatsTableOrderingComposer,
      $$EquipmentItemStatsTableAnnotationComposer,
      $$EquipmentItemStatsTableCreateCompanionBuilder,
      $$EquipmentItemStatsTableUpdateCompanionBuilder,
      (
        EquipmentItemStatRow,
        BaseReferences<
          _$AppDatabase,
          $EquipmentItemStatsTable,
          EquipmentItemStatRow
        >,
      ),
      EquipmentItemStatRow,
      PrefetchHooks Function()
    >;
typedef $$EquipmentItemUnlockRequirementsTableCreateCompanionBuilder =
    EquipmentItemUnlockRequirementsCompanion Function({
      Value<int> id,
      required String equipmentItemId,
      required String condition,
      required int value,
    });
typedef $$EquipmentItemUnlockRequirementsTableUpdateCompanionBuilder =
    EquipmentItemUnlockRequirementsCompanion Function({
      Value<int> id,
      Value<String> equipmentItemId,
      Value<String> condition,
      Value<int> value,
    });

final class $$EquipmentItemUnlockRequirementsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EquipmentItemUnlockRequirementsTable,
          EquipmentItemUnlockRequirementRow
        > {
  $$EquipmentItemUnlockRequirementsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EquipmentItemsTable _equipmentItemIdTable(
    _$AppDatabase db,
  ) => db.equipmentItems.createAlias(
    'equipment_item_unlock_requirements__equipment_item_id__equipment_items__id',
  );

  $$EquipmentItemsTableProcessedTableManager get equipmentItemId {
    final $_column = $_itemColumn<String>('equipment_item_id')!;

    final manager = $$EquipmentItemsTableTableManager(
      $_db,
      $_db.equipmentItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_equipmentItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EquipmentItemUnlockRequirementsTableFilterComposer
    extends Composer<_$AppDatabase, $EquipmentItemUnlockRequirementsTable> {
  $$EquipmentItemUnlockRequirementsTableFilterComposer({
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

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$EquipmentItemsTableFilterComposer get equipmentItemId {
    final $$EquipmentItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.equipmentItemId,
      referencedTable: $db.equipmentItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentItemsTableFilterComposer(
            $db: $db,
            $table: $db.equipmentItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentItemUnlockRequirementsTableOrderingComposer
    extends Composer<_$AppDatabase, $EquipmentItemUnlockRequirementsTable> {
  $$EquipmentItemUnlockRequirementsTableOrderingComposer({
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

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$EquipmentItemsTableOrderingComposer get equipmentItemId {
    final $$EquipmentItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.equipmentItemId,
      referencedTable: $db.equipmentItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentItemsTableOrderingComposer(
            $db: $db,
            $table: $db.equipmentItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentItemUnlockRequirementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EquipmentItemUnlockRequirementsTable> {
  $$EquipmentItemUnlockRequirementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$EquipmentItemsTableAnnotationComposer get equipmentItemId {
    final $$EquipmentItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.equipmentItemId,
      referencedTable: $db.equipmentItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.equipmentItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentItemUnlockRequirementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EquipmentItemUnlockRequirementsTable,
          EquipmentItemUnlockRequirementRow,
          $$EquipmentItemUnlockRequirementsTableFilterComposer,
          $$EquipmentItemUnlockRequirementsTableOrderingComposer,
          $$EquipmentItemUnlockRequirementsTableAnnotationComposer,
          $$EquipmentItemUnlockRequirementsTableCreateCompanionBuilder,
          $$EquipmentItemUnlockRequirementsTableUpdateCompanionBuilder,
          (
            EquipmentItemUnlockRequirementRow,
            $$EquipmentItemUnlockRequirementsTableReferences,
          ),
          EquipmentItemUnlockRequirementRow,
          PrefetchHooks Function({bool equipmentItemId})
        > {
  $$EquipmentItemUnlockRequirementsTableTableManager(
    _$AppDatabase db,
    $EquipmentItemUnlockRequirementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EquipmentItemUnlockRequirementsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$EquipmentItemUnlockRequirementsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$EquipmentItemUnlockRequirementsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> equipmentItemId = const Value.absent(),
                Value<String> condition = const Value.absent(),
                Value<int> value = const Value.absent(),
              }) => EquipmentItemUnlockRequirementsCompanion(
                id: id,
                equipmentItemId: equipmentItemId,
                condition: condition,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String equipmentItemId,
                required String condition,
                required int value,
              }) => EquipmentItemUnlockRequirementsCompanion.insert(
                id: id,
                equipmentItemId: equipmentItemId,
                condition: condition,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EquipmentItemUnlockRequirementsTableReferences(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({equipmentItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (equipmentItemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.equipmentItemId,
                                referencedTable:
                                    $$EquipmentItemUnlockRequirementsTableReferences
                                        ._equipmentItemIdTable(db),
                                referencedColumn:
                                    $$EquipmentItemUnlockRequirementsTableReferences
                                        ._equipmentItemIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EquipmentItemUnlockRequirementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EquipmentItemUnlockRequirementsTable,
      EquipmentItemUnlockRequirementRow,
      $$EquipmentItemUnlockRequirementsTableFilterComposer,
      $$EquipmentItemUnlockRequirementsTableOrderingComposer,
      $$EquipmentItemUnlockRequirementsTableAnnotationComposer,
      $$EquipmentItemUnlockRequirementsTableCreateCompanionBuilder,
      $$EquipmentItemUnlockRequirementsTableUpdateCompanionBuilder,
      (
        EquipmentItemUnlockRequirementRow,
        $$EquipmentItemUnlockRequirementsTableReferences,
      ),
      EquipmentItemUnlockRequirementRow,
      PrefetchHooks Function({bool equipmentItemId})
    >;
typedef $$EquipmentItemEquipRequirementsTableCreateCompanionBuilder =
    EquipmentItemEquipRequirementsCompanion Function({
      Value<int> id,
      required String equipmentItemId,
      required String condition,
      required int value,
    });
typedef $$EquipmentItemEquipRequirementsTableUpdateCompanionBuilder =
    EquipmentItemEquipRequirementsCompanion Function({
      Value<int> id,
      Value<String> equipmentItemId,
      Value<String> condition,
      Value<int> value,
    });

final class $$EquipmentItemEquipRequirementsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EquipmentItemEquipRequirementsTable,
          EquipmentItemEquipRequirementRow
        > {
  $$EquipmentItemEquipRequirementsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EquipmentItemsTable _equipmentItemIdTable(
    _$AppDatabase db,
  ) => db.equipmentItems.createAlias(
    'equipment_item_equip_requirements__equipment_item_id__equipment_items__id',
  );

  $$EquipmentItemsTableProcessedTableManager get equipmentItemId {
    final $_column = $_itemColumn<String>('equipment_item_id')!;

    final manager = $$EquipmentItemsTableTableManager(
      $_db,
      $_db.equipmentItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_equipmentItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EquipmentItemEquipRequirementsTableFilterComposer
    extends Composer<_$AppDatabase, $EquipmentItemEquipRequirementsTable> {
  $$EquipmentItemEquipRequirementsTableFilterComposer({
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

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$EquipmentItemsTableFilterComposer get equipmentItemId {
    final $$EquipmentItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.equipmentItemId,
      referencedTable: $db.equipmentItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentItemsTableFilterComposer(
            $db: $db,
            $table: $db.equipmentItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentItemEquipRequirementsTableOrderingComposer
    extends Composer<_$AppDatabase, $EquipmentItemEquipRequirementsTable> {
  $$EquipmentItemEquipRequirementsTableOrderingComposer({
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

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$EquipmentItemsTableOrderingComposer get equipmentItemId {
    final $$EquipmentItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.equipmentItemId,
      referencedTable: $db.equipmentItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentItemsTableOrderingComposer(
            $db: $db,
            $table: $db.equipmentItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentItemEquipRequirementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EquipmentItemEquipRequirementsTable> {
  $$EquipmentItemEquipRequirementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$EquipmentItemsTableAnnotationComposer get equipmentItemId {
    final $$EquipmentItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.equipmentItemId,
      referencedTable: $db.equipmentItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EquipmentItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.equipmentItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EquipmentItemEquipRequirementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EquipmentItemEquipRequirementsTable,
          EquipmentItemEquipRequirementRow,
          $$EquipmentItemEquipRequirementsTableFilterComposer,
          $$EquipmentItemEquipRequirementsTableOrderingComposer,
          $$EquipmentItemEquipRequirementsTableAnnotationComposer,
          $$EquipmentItemEquipRequirementsTableCreateCompanionBuilder,
          $$EquipmentItemEquipRequirementsTableUpdateCompanionBuilder,
          (
            EquipmentItemEquipRequirementRow,
            $$EquipmentItemEquipRequirementsTableReferences,
          ),
          EquipmentItemEquipRequirementRow,
          PrefetchHooks Function({bool equipmentItemId})
        > {
  $$EquipmentItemEquipRequirementsTableTableManager(
    _$AppDatabase db,
    $EquipmentItemEquipRequirementsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EquipmentItemEquipRequirementsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$EquipmentItemEquipRequirementsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$EquipmentItemEquipRequirementsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> equipmentItemId = const Value.absent(),
                Value<String> condition = const Value.absent(),
                Value<int> value = const Value.absent(),
              }) => EquipmentItemEquipRequirementsCompanion(
                id: id,
                equipmentItemId: equipmentItemId,
                condition: condition,
                value: value,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String equipmentItemId,
                required String condition,
                required int value,
              }) => EquipmentItemEquipRequirementsCompanion.insert(
                id: id,
                equipmentItemId: equipmentItemId,
                condition: condition,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EquipmentItemEquipRequirementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({equipmentItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (equipmentItemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.equipmentItemId,
                                referencedTable:
                                    $$EquipmentItemEquipRequirementsTableReferences
                                        ._equipmentItemIdTable(db),
                                referencedColumn:
                                    $$EquipmentItemEquipRequirementsTableReferences
                                        ._equipmentItemIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EquipmentItemEquipRequirementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EquipmentItemEquipRequirementsTable,
      EquipmentItemEquipRequirementRow,
      $$EquipmentItemEquipRequirementsTableFilterComposer,
      $$EquipmentItemEquipRequirementsTableOrderingComposer,
      $$EquipmentItemEquipRequirementsTableAnnotationComposer,
      $$EquipmentItemEquipRequirementsTableCreateCompanionBuilder,
      $$EquipmentItemEquipRequirementsTableUpdateCompanionBuilder,
      (
        EquipmentItemEquipRequirementRow,
        $$EquipmentItemEquipRequirementsTableReferences,
      ),
      EquipmentItemEquipRequirementRow,
      PrefetchHooks Function({bool equipmentItemId})
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
  $$EquipmentItemStatsTableTableManager get equipmentItemStats =>
      $$EquipmentItemStatsTableTableManager(_db, _db.equipmentItemStats);
  $$EquipmentItemUnlockRequirementsTableTableManager
  get equipmentItemUnlockRequirements =>
      $$EquipmentItemUnlockRequirementsTableTableManager(
        _db,
        _db.equipmentItemUnlockRequirements,
      );
  $$EquipmentItemEquipRequirementsTableTableManager
  get equipmentItemEquipRequirements =>
      $$EquipmentItemEquipRequirementsTableTableManager(
        _db,
        _db.equipmentItemEquipRequirements,
      );
}
