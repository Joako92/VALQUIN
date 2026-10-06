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
  static const VerificationMeta _familyIdMeta = const VerificationMeta(
    'familyId',
  );
  @override
  late final GeneratedColumn<String> familyId = GeneratedColumn<String>(
    'family_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    familyId,
    variantIndex,
    sets,
    amount,
  ];
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
    if (data.containsKey('family_id')) {
      context.handle(
        _familyIdMeta,
        familyId.isAcceptableOrUnknown(data['family_id']!, _familyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_familyIdMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {familyId, variantIndex},
  ];
  @override
  ExerciseVariantRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExerciseVariantRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      familyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}family_id'],
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
  final String familyId;
  final int variantIndex;
  final int? sets;
  final double amount;
  const ExerciseVariantRow({
    required this.id,
    required this.familyId,
    required this.variantIndex,
    this.sets,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['family_id'] = Variable<String>(familyId);
    map['variant_index'] = Variable<int>(variantIndex);
    if (!nullToAbsent || sets != null) {
      map['sets'] = Variable<int>(sets);
    }
    map['amount'] = Variable<double>(amount);
    return map;
  }

  ExerciseVariantsCompanion toCompanion(bool nullToAbsent) {
    return ExerciseVariantsCompanion(
      id: Value(id),
      familyId: Value(familyId),
      variantIndex: Value(variantIndex),
      sets: sets == null && nullToAbsent ? const Value.absent() : Value(sets),
      amount: Value(amount),
    );
  }

  factory ExerciseVariantRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseVariantRow(
      id: serializer.fromJson<int>(json['id']),
      familyId: serializer.fromJson<String>(json['familyId']),
      variantIndex: serializer.fromJson<int>(json['variantIndex']),
      sets: serializer.fromJson<int?>(json['sets']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'familyId': serializer.toJson<String>(familyId),
      'variantIndex': serializer.toJson<int>(variantIndex),
      'sets': serializer.toJson<int?>(sets),
      'amount': serializer.toJson<double>(amount),
    };
  }

  ExerciseVariantRow copyWith({
    int? id,
    String? familyId,
    int? variantIndex,
    Value<int?> sets = const Value.absent(),
    double? amount,
  }) => ExerciseVariantRow(
    id: id ?? this.id,
    familyId: familyId ?? this.familyId,
    variantIndex: variantIndex ?? this.variantIndex,
    sets: sets.present ? sets.value : this.sets,
    amount: amount ?? this.amount,
  );
  ExerciseVariantRow copyWithCompanion(ExerciseVariantsCompanion data) {
    return ExerciseVariantRow(
      id: data.id.present ? data.id.value : this.id,
      familyId: data.familyId.present ? data.familyId.value : this.familyId,
      variantIndex: data.variantIndex.present
          ? data.variantIndex.value
          : this.variantIndex,
      sets: data.sets.present ? data.sets.value : this.sets,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseVariantRow(')
          ..write('id: $id, ')
          ..write('familyId: $familyId, ')
          ..write('variantIndex: $variantIndex, ')
          ..write('sets: $sets, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, familyId, variantIndex, sets, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseVariantRow &&
          other.id == this.id &&
          other.familyId == this.familyId &&
          other.variantIndex == this.variantIndex &&
          other.sets == this.sets &&
          other.amount == this.amount);
}

class ExerciseVariantsCompanion extends UpdateCompanion<ExerciseVariantRow> {
  final Value<int> id;
  final Value<String> familyId;
  final Value<int> variantIndex;
  final Value<int?> sets;
  final Value<double> amount;
  const ExerciseVariantsCompanion({
    this.id = const Value.absent(),
    this.familyId = const Value.absent(),
    this.variantIndex = const Value.absent(),
    this.sets = const Value.absent(),
    this.amount = const Value.absent(),
  });
  ExerciseVariantsCompanion.insert({
    this.id = const Value.absent(),
    required String familyId,
    required int variantIndex,
    this.sets = const Value.absent(),
    required double amount,
  }) : familyId = Value(familyId),
       variantIndex = Value(variantIndex),
       amount = Value(amount);
  static Insertable<ExerciseVariantRow> custom({
    Expression<int>? id,
    Expression<String>? familyId,
    Expression<int>? variantIndex,
    Expression<int>? sets,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (familyId != null) 'family_id': familyId,
      if (variantIndex != null) 'variant_index': variantIndex,
      if (sets != null) 'sets': sets,
      if (amount != null) 'amount': amount,
    });
  }

  ExerciseVariantsCompanion copyWith({
    Value<int>? id,
    Value<String>? familyId,
    Value<int>? variantIndex,
    Value<int?>? sets,
    Value<double>? amount,
  }) {
    return ExerciseVariantsCompanion(
      id: id ?? this.id,
      familyId: familyId ?? this.familyId,
      variantIndex: variantIndex ?? this.variantIndex,
      sets: sets ?? this.sets,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (familyId.present) {
      map['family_id'] = Variable<String>(familyId.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExerciseVariantsCompanion(')
          ..write('id: $id, ')
          ..write('familyId: $familyId, ')
          ..write('variantIndex: $variantIndex, ')
          ..write('sets: $sets, ')
          ..write('amount: $amount')
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
  Set<GeneratedColumn> get $primaryKey => {id};
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

class $VariantFamiliesTable extends VariantFamilies
    with TableInfo<$VariantFamiliesTable, VariantFamilyRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VariantFamiliesTable(this.attachedDatabase, [this._alias]);
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
  List<GeneratedColumn> get $columns => [id, name, unit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'variant_families';
  @override
  VerificationContext validateIntegrity(
    Insertable<VariantFamilyRow> instance, {
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
  VariantFamilyRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VariantFamilyRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
    );
  }

  @override
  $VariantFamiliesTable createAlias(String alias) {
    return $VariantFamiliesTable(attachedDatabase, alias);
  }
}

class VariantFamilyRow extends DataClass
    implements Insertable<VariantFamilyRow> {
  final String id;
  final String name;
  final String unit;
  const VariantFamilyRow({
    required this.id,
    required this.name,
    required this.unit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['unit'] = Variable<String>(unit);
    return map;
  }

  VariantFamiliesCompanion toCompanion(bool nullToAbsent) {
    return VariantFamiliesCompanion(
      id: Value(id),
      name: Value(name),
      unit: Value(unit),
    );
  }

  factory VariantFamilyRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VariantFamilyRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      unit: serializer.fromJson<String>(json['unit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'unit': serializer.toJson<String>(unit),
    };
  }

  VariantFamilyRow copyWith({String? id, String? name, String? unit}) =>
      VariantFamilyRow(
        id: id ?? this.id,
        name: name ?? this.name,
        unit: unit ?? this.unit,
      );
  VariantFamilyRow copyWithCompanion(VariantFamiliesCompanion data) {
    return VariantFamilyRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      unit: data.unit.present ? data.unit.value : this.unit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VariantFamilyRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, unit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VariantFamilyRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.unit == this.unit);
}

class VariantFamiliesCompanion extends UpdateCompanion<VariantFamilyRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> unit;
  final Value<int> rowid;
  const VariantFamiliesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.unit = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VariantFamiliesCompanion.insert({
    required String id,
    required String name,
    required String unit,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       unit = Value(unit);
  static Insertable<VariantFamilyRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? unit,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (unit != null) 'unit': unit,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VariantFamiliesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? unit,
    Value<int>? rowid,
  }) {
    return VariantFamiliesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      unit: unit ?? this.unit,
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
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VariantFamiliesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _variantFamilyIdMeta = const VerificationMeta(
    'variantFamilyId',
  );
  @override
  late final GeneratedColumn<String> variantFamilyId = GeneratedColumn<String>(
    'variant_family_id',
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
    variantFamilyId,
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
    if (data.containsKey('variant_family_id')) {
      context.handle(
        _variantFamilyIdMeta,
        variantFamilyId.isAcceptableOrUnknown(
          data['variant_family_id']!,
          _variantFamilyIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_variantFamilyIdMeta);
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
      variantFamilyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}variant_family_id'],
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
  final String variantFamilyId;
  final int maxVariant;
  const EquipmentItemExerciseRow({
    required this.id,
    required this.equipmentItemId,
    required this.exerciseId,
    required this.variantFamilyId,
    required this.maxVariant,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['equipment_item_id'] = Variable<String>(equipmentItemId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['variant_family_id'] = Variable<String>(variantFamilyId);
    map['max_variant'] = Variable<int>(maxVariant);
    return map;
  }

  EquipmentItemExercisesCompanion toCompanion(bool nullToAbsent) {
    return EquipmentItemExercisesCompanion(
      id: Value(id),
      equipmentItemId: Value(equipmentItemId),
      exerciseId: Value(exerciseId),
      variantFamilyId: Value(variantFamilyId),
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
      variantFamilyId: serializer.fromJson<String>(json['variantFamilyId']),
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
      'variantFamilyId': serializer.toJson<String>(variantFamilyId),
      'maxVariant': serializer.toJson<int>(maxVariant),
    };
  }

  EquipmentItemExerciseRow copyWith({
    int? id,
    String? equipmentItemId,
    String? exerciseId,
    String? variantFamilyId,
    int? maxVariant,
  }) => EquipmentItemExerciseRow(
    id: id ?? this.id,
    equipmentItemId: equipmentItemId ?? this.equipmentItemId,
    exerciseId: exerciseId ?? this.exerciseId,
    variantFamilyId: variantFamilyId ?? this.variantFamilyId,
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
      variantFamilyId: data.variantFamilyId.present
          ? data.variantFamilyId.value
          : this.variantFamilyId,
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
          ..write('variantFamilyId: $variantFamilyId, ')
          ..write('maxVariant: $maxVariant')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, equipmentItemId, exerciseId, variantFamilyId, maxVariant);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentItemExerciseRow &&
          other.id == this.id &&
          other.equipmentItemId == this.equipmentItemId &&
          other.exerciseId == this.exerciseId &&
          other.variantFamilyId == this.variantFamilyId &&
          other.maxVariant == this.maxVariant);
}

class EquipmentItemExercisesCompanion
    extends UpdateCompanion<EquipmentItemExerciseRow> {
  final Value<int> id;
  final Value<String> equipmentItemId;
  final Value<String> exerciseId;
  final Value<String> variantFamilyId;
  final Value<int> maxVariant;
  const EquipmentItemExercisesCompanion({
    this.id = const Value.absent(),
    this.equipmentItemId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.variantFamilyId = const Value.absent(),
    this.maxVariant = const Value.absent(),
  });
  EquipmentItemExercisesCompanion.insert({
    this.id = const Value.absent(),
    required String equipmentItemId,
    required String exerciseId,
    required String variantFamilyId,
    this.maxVariant = const Value.absent(),
  }) : equipmentItemId = Value(equipmentItemId),
       exerciseId = Value(exerciseId),
       variantFamilyId = Value(variantFamilyId);
  static Insertable<EquipmentItemExerciseRow> custom({
    Expression<int>? id,
    Expression<String>? equipmentItemId,
    Expression<String>? exerciseId,
    Expression<String>? variantFamilyId,
    Expression<int>? maxVariant,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (equipmentItemId != null) 'equipment_item_id': equipmentItemId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (variantFamilyId != null) 'variant_family_id': variantFamilyId,
      if (maxVariant != null) 'max_variant': maxVariant,
    });
  }

  EquipmentItemExercisesCompanion copyWith({
    Value<int>? id,
    Value<String>? equipmentItemId,
    Value<String>? exerciseId,
    Value<String>? variantFamilyId,
    Value<int>? maxVariant,
  }) {
    return EquipmentItemExercisesCompanion(
      id: id ?? this.id,
      equipmentItemId: equipmentItemId ?? this.equipmentItemId,
      exerciseId: exerciseId ?? this.exerciseId,
      variantFamilyId: variantFamilyId ?? this.variantFamilyId,
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
    if (variantFamilyId.present) {
      map['variant_family_id'] = Variable<String>(variantFamilyId.value);
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
          ..write('variantFamilyId: $variantFamilyId, ')
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

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accentColorMeta = const VerificationMeta(
    'accentColor',
  );
  @override
  late final GeneratedColumn<int> accentColor = GeneratedColumn<int>(
    'accent_color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
    'theme',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('dark'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, accentColor, language, theme];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('accent_color')) {
      context.handle(
        _accentColorMeta,
        accentColor.isAcceptableOrUnknown(
          data['accent_color']!,
          _accentColorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accentColorMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('theme')) {
      context.handle(
        _themeMeta,
        theme.isAcceptableOrUnknown(data['theme']!, _themeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      accentColor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}accent_color'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      theme: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final int accentColor;
  final String language;
  final String theme;
  const AppSetting({
    required this.id,
    required this.accentColor,
    required this.language,
    required this.theme,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['accent_color'] = Variable<int>(accentColor);
    map['language'] = Variable<String>(language);
    map['theme'] = Variable<String>(theme);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      accentColor: Value(accentColor),
      language: Value(language),
      theme: Value(theme),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      accentColor: serializer.fromJson<int>(json['accentColor']),
      language: serializer.fromJson<String>(json['language']),
      theme: serializer.fromJson<String>(json['theme']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accentColor': serializer.toJson<int>(accentColor),
      'language': serializer.toJson<String>(language),
      'theme': serializer.toJson<String>(theme),
    };
  }

  AppSetting copyWith({
    int? id,
    int? accentColor,
    String? language,
    String? theme,
  }) => AppSetting(
    id: id ?? this.id,
    accentColor: accentColor ?? this.accentColor,
    language: language ?? this.language,
    theme: theme ?? this.theme,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      accentColor: data.accentColor.present
          ? data.accentColor.value
          : this.accentColor,
      language: data.language.present ? data.language.value : this.language,
      theme: data.theme.present ? data.theme.value : this.theme,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('accentColor: $accentColor, ')
          ..write('language: $language, ')
          ..write('theme: $theme')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, accentColor, language, theme);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.accentColor == this.accentColor &&
          other.language == this.language &&
          other.theme == this.theme);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<int> accentColor;
  final Value<String> language;
  final Value<String> theme;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.accentColor = const Value.absent(),
    this.language = const Value.absent(),
    this.theme = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    required int accentColor,
    required String language,
    this.theme = const Value.absent(),
  }) : accentColor = Value(accentColor),
       language = Value(language);
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<int>? accentColor,
    Expression<String>? language,
    Expression<String>? theme,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accentColor != null) 'accent_color': accentColor,
      if (language != null) 'language': language,
      if (theme != null) 'theme': theme,
    });
  }

  AppSettingsCompanion copyWith({
    Value<int>? id,
    Value<int>? accentColor,
    Value<String>? language,
    Value<String>? theme,
  }) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      accentColor: accentColor ?? this.accentColor,
      language: language ?? this.language,
      theme: theme ?? this.theme,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accentColor.present) {
      map['accent_color'] = Variable<int>(accentColor.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('accentColor: $accentColor, ')
          ..write('language: $language, ')
          ..write('theme: $theme')
          ..write(')'))
        .toString();
  }
}

class $TrainingRecordsTable extends TrainingRecords
    with TableInfo<$TrainingRecordsTable, TrainingRecordRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingRecordsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _strengthGainedMeta = const VerificationMeta(
    'strengthGained',
  );
  @override
  late final GeneratedColumn<int> strengthGained = GeneratedColumn<int>(
    'strength_gained',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _enduranceGainedMeta = const VerificationMeta(
    'enduranceGained',
  );
  @override
  late final GeneratedColumn<int> enduranceGained = GeneratedColumn<int>(
    'endurance_gained',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _energyGainedMeta = const VerificationMeta(
    'energyGained',
  );
  @override
  late final GeneratedColumn<int> energyGained = GeneratedColumn<int>(
    'energy_gained',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _staminaGainedMeta = const VerificationMeta(
    'staminaGained',
  );
  @override
  late final GeneratedColumn<int> staminaGained = GeneratedColumn<int>(
    'stamina_gained',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    completedAt,
    strengthGained,
    enduranceGained,
    energyGained,
    staminaGained,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrainingRecordRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('strength_gained')) {
      context.handle(
        _strengthGainedMeta,
        strengthGained.isAcceptableOrUnknown(
          data['strength_gained']!,
          _strengthGainedMeta,
        ),
      );
    }
    if (data.containsKey('endurance_gained')) {
      context.handle(
        _enduranceGainedMeta,
        enduranceGained.isAcceptableOrUnknown(
          data['endurance_gained']!,
          _enduranceGainedMeta,
        ),
      );
    }
    if (data.containsKey('energy_gained')) {
      context.handle(
        _energyGainedMeta,
        energyGained.isAcceptableOrUnknown(
          data['energy_gained']!,
          _energyGainedMeta,
        ),
      );
    }
    if (data.containsKey('stamina_gained')) {
      context.handle(
        _staminaGainedMeta,
        staminaGained.isAcceptableOrUnknown(
          data['stamina_gained']!,
          _staminaGainedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TrainingRecordRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingRecordRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
      strengthGained: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}strength_gained'],
      )!,
      enduranceGained: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}endurance_gained'],
      )!,
      energyGained: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}energy_gained'],
      )!,
      staminaGained: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stamina_gained'],
      )!,
    );
  }

  @override
  $TrainingRecordsTable createAlias(String alias) {
    return $TrainingRecordsTable(attachedDatabase, alias);
  }
}

class TrainingRecordRow extends DataClass
    implements Insertable<TrainingRecordRow> {
  final int id;
  final DateTime completedAt;
  final int strengthGained;
  final int enduranceGained;
  final int energyGained;
  final int staminaGained;
  const TrainingRecordRow({
    required this.id,
    required this.completedAt,
    required this.strengthGained,
    required this.enduranceGained,
    required this.energyGained,
    required this.staminaGained,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['completed_at'] = Variable<DateTime>(completedAt);
    map['strength_gained'] = Variable<int>(strengthGained);
    map['endurance_gained'] = Variable<int>(enduranceGained);
    map['energy_gained'] = Variable<int>(energyGained);
    map['stamina_gained'] = Variable<int>(staminaGained);
    return map;
  }

  TrainingRecordsCompanion toCompanion(bool nullToAbsent) {
    return TrainingRecordsCompanion(
      id: Value(id),
      completedAt: Value(completedAt),
      strengthGained: Value(strengthGained),
      enduranceGained: Value(enduranceGained),
      energyGained: Value(energyGained),
      staminaGained: Value(staminaGained),
    );
  }

  factory TrainingRecordRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingRecordRow(
      id: serializer.fromJson<int>(json['id']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      strengthGained: serializer.fromJson<int>(json['strengthGained']),
      enduranceGained: serializer.fromJson<int>(json['enduranceGained']),
      energyGained: serializer.fromJson<int>(json['energyGained']),
      staminaGained: serializer.fromJson<int>(json['staminaGained']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'strengthGained': serializer.toJson<int>(strengthGained),
      'enduranceGained': serializer.toJson<int>(enduranceGained),
      'energyGained': serializer.toJson<int>(energyGained),
      'staminaGained': serializer.toJson<int>(staminaGained),
    };
  }

  TrainingRecordRow copyWith({
    int? id,
    DateTime? completedAt,
    int? strengthGained,
    int? enduranceGained,
    int? energyGained,
    int? staminaGained,
  }) => TrainingRecordRow(
    id: id ?? this.id,
    completedAt: completedAt ?? this.completedAt,
    strengthGained: strengthGained ?? this.strengthGained,
    enduranceGained: enduranceGained ?? this.enduranceGained,
    energyGained: energyGained ?? this.energyGained,
    staminaGained: staminaGained ?? this.staminaGained,
  );
  TrainingRecordRow copyWithCompanion(TrainingRecordsCompanion data) {
    return TrainingRecordRow(
      id: data.id.present ? data.id.value : this.id,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      strengthGained: data.strengthGained.present
          ? data.strengthGained.value
          : this.strengthGained,
      enduranceGained: data.enduranceGained.present
          ? data.enduranceGained.value
          : this.enduranceGained,
      energyGained: data.energyGained.present
          ? data.energyGained.value
          : this.energyGained,
      staminaGained: data.staminaGained.present
          ? data.staminaGained.value
          : this.staminaGained,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TrainingRecordRow(')
          ..write('id: $id, ')
          ..write('completedAt: $completedAt, ')
          ..write('strengthGained: $strengthGained, ')
          ..write('enduranceGained: $enduranceGained, ')
          ..write('energyGained: $energyGained, ')
          ..write('staminaGained: $staminaGained')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    completedAt,
    strengthGained,
    enduranceGained,
    energyGained,
    staminaGained,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingRecordRow &&
          other.id == this.id &&
          other.completedAt == this.completedAt &&
          other.strengthGained == this.strengthGained &&
          other.enduranceGained == this.enduranceGained &&
          other.energyGained == this.energyGained &&
          other.staminaGained == this.staminaGained);
}

class TrainingRecordsCompanion extends UpdateCompanion<TrainingRecordRow> {
  final Value<int> id;
  final Value<DateTime> completedAt;
  final Value<int> strengthGained;
  final Value<int> enduranceGained;
  final Value<int> energyGained;
  final Value<int> staminaGained;
  const TrainingRecordsCompanion({
    this.id = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.strengthGained = const Value.absent(),
    this.enduranceGained = const Value.absent(),
    this.energyGained = const Value.absent(),
    this.staminaGained = const Value.absent(),
  });
  TrainingRecordsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime completedAt,
    this.strengthGained = const Value.absent(),
    this.enduranceGained = const Value.absent(),
    this.energyGained = const Value.absent(),
    this.staminaGained = const Value.absent(),
  }) : completedAt = Value(completedAt);
  static Insertable<TrainingRecordRow> custom({
    Expression<int>? id,
    Expression<DateTime>? completedAt,
    Expression<int>? strengthGained,
    Expression<int>? enduranceGained,
    Expression<int>? energyGained,
    Expression<int>? staminaGained,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (completedAt != null) 'completed_at': completedAt,
      if (strengthGained != null) 'strength_gained': strengthGained,
      if (enduranceGained != null) 'endurance_gained': enduranceGained,
      if (energyGained != null) 'energy_gained': energyGained,
      if (staminaGained != null) 'stamina_gained': staminaGained,
    });
  }

  TrainingRecordsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? completedAt,
    Value<int>? strengthGained,
    Value<int>? enduranceGained,
    Value<int>? energyGained,
    Value<int>? staminaGained,
  }) {
    return TrainingRecordsCompanion(
      id: id ?? this.id,
      completedAt: completedAt ?? this.completedAt,
      strengthGained: strengthGained ?? this.strengthGained,
      enduranceGained: enduranceGained ?? this.enduranceGained,
      energyGained: energyGained ?? this.energyGained,
      staminaGained: staminaGained ?? this.staminaGained,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (strengthGained.present) {
      map['strength_gained'] = Variable<int>(strengthGained.value);
    }
    if (enduranceGained.present) {
      map['endurance_gained'] = Variable<int>(enduranceGained.value);
    }
    if (energyGained.present) {
      map['energy_gained'] = Variable<int>(energyGained.value);
    }
    if (staminaGained.present) {
      map['stamina_gained'] = Variable<int>(staminaGained.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingRecordsCompanion(')
          ..write('id: $id, ')
          ..write('completedAt: $completedAt, ')
          ..write('strengthGained: $strengthGained, ')
          ..write('enduranceGained: $enduranceGained, ')
          ..write('energyGained: $energyGained, ')
          ..write('staminaGained: $staminaGained')
          ..write(')'))
        .toString();
  }
}

class $TrainingRecordExercisesTable extends TrainingRecordExercises
    with TableInfo<$TrainingRecordExercisesTable, TrainingRecordExerciseRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingRecordExercisesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _trainingRecordIdMeta = const VerificationMeta(
    'trainingRecordId',
  );
  @override
  late final GeneratedColumn<int> trainingRecordId = GeneratedColumn<int>(
    'training_record_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  List<GeneratedColumn> get $columns => [
    id,
    trainingRecordId,
    exerciseId,
    variantIndex,
    sets,
    amount,
    unit,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_record_exercises';
  @override
  VerificationContext validateIntegrity(
    Insertable<TrainingRecordExerciseRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('training_record_id')) {
      context.handle(
        _trainingRecordIdMeta,
        trainingRecordId.isAcceptableOrUnknown(
          data['training_record_id']!,
          _trainingRecordIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_trainingRecordIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
        _exerciseIdMeta,
        exerciseId.isAcceptableOrUnknown(data['exercise_id']!, _exerciseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
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
  TrainingRecordExerciseRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingRecordExerciseRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      trainingRecordId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}training_record_id'],
      )!,
      exerciseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}exercise_id'],
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
  $TrainingRecordExercisesTable createAlias(String alias) {
    return $TrainingRecordExercisesTable(attachedDatabase, alias);
  }
}

class TrainingRecordExerciseRow extends DataClass
    implements Insertable<TrainingRecordExerciseRow> {
  final int id;
  final int trainingRecordId;
  final String exerciseId;
  final int variantIndex;
  final int? sets;
  final double amount;
  final String unit;
  const TrainingRecordExerciseRow({
    required this.id,
    required this.trainingRecordId,
    required this.exerciseId,
    required this.variantIndex,
    this.sets,
    required this.amount,
    required this.unit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['training_record_id'] = Variable<int>(trainingRecordId);
    map['exercise_id'] = Variable<String>(exerciseId);
    map['variant_index'] = Variable<int>(variantIndex);
    if (!nullToAbsent || sets != null) {
      map['sets'] = Variable<int>(sets);
    }
    map['amount'] = Variable<double>(amount);
    map['unit'] = Variable<String>(unit);
    return map;
  }

  TrainingRecordExercisesCompanion toCompanion(bool nullToAbsent) {
    return TrainingRecordExercisesCompanion(
      id: Value(id),
      trainingRecordId: Value(trainingRecordId),
      exerciseId: Value(exerciseId),
      variantIndex: Value(variantIndex),
      sets: sets == null && nullToAbsent ? const Value.absent() : Value(sets),
      amount: Value(amount),
      unit: Value(unit),
    );
  }

  factory TrainingRecordExerciseRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingRecordExerciseRow(
      id: serializer.fromJson<int>(json['id']),
      trainingRecordId: serializer.fromJson<int>(json['trainingRecordId']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
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
      'trainingRecordId': serializer.toJson<int>(trainingRecordId),
      'exerciseId': serializer.toJson<String>(exerciseId),
      'variantIndex': serializer.toJson<int>(variantIndex),
      'sets': serializer.toJson<int?>(sets),
      'amount': serializer.toJson<double>(amount),
      'unit': serializer.toJson<String>(unit),
    };
  }

  TrainingRecordExerciseRow copyWith({
    int? id,
    int? trainingRecordId,
    String? exerciseId,
    int? variantIndex,
    Value<int?> sets = const Value.absent(),
    double? amount,
    String? unit,
  }) => TrainingRecordExerciseRow(
    id: id ?? this.id,
    trainingRecordId: trainingRecordId ?? this.trainingRecordId,
    exerciseId: exerciseId ?? this.exerciseId,
    variantIndex: variantIndex ?? this.variantIndex,
    sets: sets.present ? sets.value : this.sets,
    amount: amount ?? this.amount,
    unit: unit ?? this.unit,
  );
  TrainingRecordExerciseRow copyWithCompanion(
    TrainingRecordExercisesCompanion data,
  ) {
    return TrainingRecordExerciseRow(
      id: data.id.present ? data.id.value : this.id,
      trainingRecordId: data.trainingRecordId.present
          ? data.trainingRecordId.value
          : this.trainingRecordId,
      exerciseId: data.exerciseId.present
          ? data.exerciseId.value
          : this.exerciseId,
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
    return (StringBuffer('TrainingRecordExerciseRow(')
          ..write('id: $id, ')
          ..write('trainingRecordId: $trainingRecordId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('variantIndex: $variantIndex, ')
          ..write('sets: $sets, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    trainingRecordId,
    exerciseId,
    variantIndex,
    sets,
    amount,
    unit,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingRecordExerciseRow &&
          other.id == this.id &&
          other.trainingRecordId == this.trainingRecordId &&
          other.exerciseId == this.exerciseId &&
          other.variantIndex == this.variantIndex &&
          other.sets == this.sets &&
          other.amount == this.amount &&
          other.unit == this.unit);
}

class TrainingRecordExercisesCompanion
    extends UpdateCompanion<TrainingRecordExerciseRow> {
  final Value<int> id;
  final Value<int> trainingRecordId;
  final Value<String> exerciseId;
  final Value<int> variantIndex;
  final Value<int?> sets;
  final Value<double> amount;
  final Value<String> unit;
  const TrainingRecordExercisesCompanion({
    this.id = const Value.absent(),
    this.trainingRecordId = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.variantIndex = const Value.absent(),
    this.sets = const Value.absent(),
    this.amount = const Value.absent(),
    this.unit = const Value.absent(),
  });
  TrainingRecordExercisesCompanion.insert({
    this.id = const Value.absent(),
    required int trainingRecordId,
    required String exerciseId,
    required int variantIndex,
    this.sets = const Value.absent(),
    required double amount,
    required String unit,
  }) : trainingRecordId = Value(trainingRecordId),
       exerciseId = Value(exerciseId),
       variantIndex = Value(variantIndex),
       amount = Value(amount),
       unit = Value(unit);
  static Insertable<TrainingRecordExerciseRow> custom({
    Expression<int>? id,
    Expression<int>? trainingRecordId,
    Expression<String>? exerciseId,
    Expression<int>? variantIndex,
    Expression<int>? sets,
    Expression<double>? amount,
    Expression<String>? unit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trainingRecordId != null) 'training_record_id': trainingRecordId,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (variantIndex != null) 'variant_index': variantIndex,
      if (sets != null) 'sets': sets,
      if (amount != null) 'amount': amount,
      if (unit != null) 'unit': unit,
    });
  }

  TrainingRecordExercisesCompanion copyWith({
    Value<int>? id,
    Value<int>? trainingRecordId,
    Value<String>? exerciseId,
    Value<int>? variantIndex,
    Value<int?>? sets,
    Value<double>? amount,
    Value<String>? unit,
  }) {
    return TrainingRecordExercisesCompanion(
      id: id ?? this.id,
      trainingRecordId: trainingRecordId ?? this.trainingRecordId,
      exerciseId: exerciseId ?? this.exerciseId,
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
    if (trainingRecordId.present) {
      map['training_record_id'] = Variable<int>(trainingRecordId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
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
    return (StringBuffer('TrainingRecordExercisesCompanion(')
          ..write('id: $id, ')
          ..write('trainingRecordId: $trainingRecordId, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('variantIndex: $variantIndex, ')
          ..write('sets: $sets, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit')
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
  late final $VariantFamiliesTable variantFamilies = $VariantFamiliesTable(
    this,
  );
  late final $EquipmentItemsTable equipmentItems = $EquipmentItemsTable(this);
  late final $EquipmentItemExercisesTable equipmentItemExercises =
      $EquipmentItemExercisesTable(this);
  late final $EquipmentItemStatsTable equipmentItemStats =
      $EquipmentItemStatsTable(this);
  late final $EquipmentItemUnlockRequirementsTable
  equipmentItemUnlockRequirements = $EquipmentItemUnlockRequirementsTable(this);
  late final $EquipmentItemEquipRequirementsTable
  equipmentItemEquipRequirements = $EquipmentItemEquipRequirementsTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $TrainingRecordsTable trainingRecords = $TrainingRecordsTable(
    this,
  );
  late final $TrainingRecordExercisesTable trainingRecordExercises =
      $TrainingRecordExercisesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    testEntries,
    exerciseVariants,
    exercises,
    variantFamilies,
    equipmentItems,
    equipmentItemExercises,
    equipmentItemStats,
    equipmentItemUnlockRequirements,
    equipmentItemEquipRequirements,
    appSettings,
    trainingRecords,
    trainingRecordExercises,
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
      required String familyId,
      required int variantIndex,
      Value<int?> sets,
      required double amount,
    });
typedef $$ExerciseVariantsTableUpdateCompanionBuilder =
    ExerciseVariantsCompanion Function({
      Value<int> id,
      Value<String> familyId,
      Value<int> variantIndex,
      Value<int?> sets,
      Value<double> amount,
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

  ColumnFilters<String> get familyId => $composableBuilder(
    column: $table.familyId,
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

  ColumnOrderings<String> get familyId => $composableBuilder(
    column: $table.familyId,
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

  GeneratedColumn<String> get familyId =>
      $composableBuilder(column: $table.familyId, builder: (column) => column);

  GeneratedColumn<int> get variantIndex => $composableBuilder(
    column: $table.variantIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sets =>
      $composableBuilder(column: $table.sets, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);
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
                Value<String> familyId = const Value.absent(),
                Value<int> variantIndex = const Value.absent(),
                Value<int?> sets = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => ExerciseVariantsCompanion(
                id: id,
                familyId: familyId,
                variantIndex: variantIndex,
                sets: sets,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String familyId,
                required int variantIndex,
                Value<int?> sets = const Value.absent(),
                required double amount,
              }) => ExerciseVariantsCompanion.insert(
                id: id,
                familyId: familyId,
                variantIndex: variantIndex,
                sets: sets,
                amount: amount,
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
typedef $$VariantFamiliesTableCreateCompanionBuilder =
    VariantFamiliesCompanion Function({
      required String id,
      required String name,
      required String unit,
      Value<int> rowid,
    });
typedef $$VariantFamiliesTableUpdateCompanionBuilder =
    VariantFamiliesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> unit,
      Value<int> rowid,
    });

class $$VariantFamiliesTableFilterComposer
    extends Composer<_$AppDatabase, $VariantFamiliesTable> {
  $$VariantFamiliesTableFilterComposer({
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

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VariantFamiliesTableOrderingComposer
    extends Composer<_$AppDatabase, $VariantFamiliesTable> {
  $$VariantFamiliesTableOrderingComposer({
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

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VariantFamiliesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VariantFamiliesTable> {
  $$VariantFamiliesTableAnnotationComposer({
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

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);
}

class $$VariantFamiliesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VariantFamiliesTable,
          VariantFamilyRow,
          $$VariantFamiliesTableFilterComposer,
          $$VariantFamiliesTableOrderingComposer,
          $$VariantFamiliesTableAnnotationComposer,
          $$VariantFamiliesTableCreateCompanionBuilder,
          $$VariantFamiliesTableUpdateCompanionBuilder,
          (
            VariantFamilyRow,
            BaseReferences<
              _$AppDatabase,
              $VariantFamiliesTable,
              VariantFamilyRow
            >,
          ),
          VariantFamilyRow,
          PrefetchHooks Function()
        > {
  $$VariantFamiliesTableTableManager(
    _$AppDatabase db,
    $VariantFamiliesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VariantFamiliesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VariantFamiliesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VariantFamiliesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VariantFamiliesCompanion(
                id: id,
                name: name,
                unit: unit,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String unit,
                Value<int> rowid = const Value.absent(),
              }) => VariantFamiliesCompanion.insert(
                id: id,
                name: name,
                unit: unit,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VariantFamiliesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VariantFamiliesTable,
      VariantFamilyRow,
      $$VariantFamiliesTableFilterComposer,
      $$VariantFamiliesTableOrderingComposer,
      $$VariantFamiliesTableAnnotationComposer,
      $$VariantFamiliesTableCreateCompanionBuilder,
      $$VariantFamiliesTableUpdateCompanionBuilder,
      (
        VariantFamilyRow,
        BaseReferences<_$AppDatabase, $VariantFamiliesTable, VariantFamilyRow>,
      ),
      VariantFamilyRow,
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
      required String variantFamilyId,
      Value<int> maxVariant,
    });
typedef $$EquipmentItemExercisesTableUpdateCompanionBuilder =
    EquipmentItemExercisesCompanion Function({
      Value<int> id,
      Value<String> equipmentItemId,
      Value<String> exerciseId,
      Value<String> variantFamilyId,
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

  ColumnFilters<String> get variantFamilyId => $composableBuilder(
    column: $table.variantFamilyId,
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

  ColumnOrderings<String> get variantFamilyId => $composableBuilder(
    column: $table.variantFamilyId,
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

  GeneratedColumn<String> get variantFamilyId => $composableBuilder(
    column: $table.variantFamilyId,
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
                Value<String> variantFamilyId = const Value.absent(),
                Value<int> maxVariant = const Value.absent(),
              }) => EquipmentItemExercisesCompanion(
                id: id,
                equipmentItemId: equipmentItemId,
                exerciseId: exerciseId,
                variantFamilyId: variantFamilyId,
                maxVariant: maxVariant,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String equipmentItemId,
                required String exerciseId,
                required String variantFamilyId,
                Value<int> maxVariant = const Value.absent(),
              }) => EquipmentItemExercisesCompanion.insert(
                id: id,
                equipmentItemId: equipmentItemId,
                exerciseId: exerciseId,
                variantFamilyId: variantFamilyId,
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
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      required int accentColor,
      required String language,
      Value<String> theme,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      Value<int> accentColor,
      Value<String> language,
      Value<String> theme,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
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

  ColumnFilters<int> get accentColor => $composableBuilder(
    column: $table.accentColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get theme => $composableBuilder(
    column: $table.theme,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
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

  ColumnOrderings<int> get accentColor => $composableBuilder(
    column: $table.accentColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get theme => $composableBuilder(
    column: $table.theme,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get accentColor => $composableBuilder(
    column: $table.accentColor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get theme =>
      $composableBuilder(column: $table.theme, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> accentColor = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> theme = const Value.absent(),
              }) => AppSettingsCompanion(
                id: id,
                accentColor: accentColor,
                language: language,
                theme: theme,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int accentColor,
                required String language,
                Value<String> theme = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                id: id,
                accentColor: accentColor,
                language: language,
                theme: theme,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;
typedef $$TrainingRecordsTableCreateCompanionBuilder =
    TrainingRecordsCompanion Function({
      Value<int> id,
      required DateTime completedAt,
      Value<int> strengthGained,
      Value<int> enduranceGained,
      Value<int> energyGained,
      Value<int> staminaGained,
    });
typedef $$TrainingRecordsTableUpdateCompanionBuilder =
    TrainingRecordsCompanion Function({
      Value<int> id,
      Value<DateTime> completedAt,
      Value<int> strengthGained,
      Value<int> enduranceGained,
      Value<int> energyGained,
      Value<int> staminaGained,
    });

class $$TrainingRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingRecordsTable> {
  $$TrainingRecordsTableFilterComposer({
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

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get strengthGained => $composableBuilder(
    column: $table.strengthGained,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enduranceGained => $composableBuilder(
    column: $table.enduranceGained,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get energyGained => $composableBuilder(
    column: $table.energyGained,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get staminaGained => $composableBuilder(
    column: $table.staminaGained,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TrainingRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingRecordsTable> {
  $$TrainingRecordsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get strengthGained => $composableBuilder(
    column: $table.strengthGained,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enduranceGained => $composableBuilder(
    column: $table.enduranceGained,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get energyGained => $composableBuilder(
    column: $table.energyGained,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get staminaGained => $composableBuilder(
    column: $table.staminaGained,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TrainingRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingRecordsTable> {
  $$TrainingRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get strengthGained => $composableBuilder(
    column: $table.strengthGained,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enduranceGained => $composableBuilder(
    column: $table.enduranceGained,
    builder: (column) => column,
  );

  GeneratedColumn<int> get energyGained => $composableBuilder(
    column: $table.energyGained,
    builder: (column) => column,
  );

  GeneratedColumn<int> get staminaGained => $composableBuilder(
    column: $table.staminaGained,
    builder: (column) => column,
  );
}

class $$TrainingRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrainingRecordsTable,
          TrainingRecordRow,
          $$TrainingRecordsTableFilterComposer,
          $$TrainingRecordsTableOrderingComposer,
          $$TrainingRecordsTableAnnotationComposer,
          $$TrainingRecordsTableCreateCompanionBuilder,
          $$TrainingRecordsTableUpdateCompanionBuilder,
          (
            TrainingRecordRow,
            BaseReferences<
              _$AppDatabase,
              $TrainingRecordsTable,
              TrainingRecordRow
            >,
          ),
          TrainingRecordRow,
          PrefetchHooks Function()
        > {
  $$TrainingRecordsTableTableManager(
    _$AppDatabase db,
    $TrainingRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TrainingRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TrainingRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<int> strengthGained = const Value.absent(),
                Value<int> enduranceGained = const Value.absent(),
                Value<int> energyGained = const Value.absent(),
                Value<int> staminaGained = const Value.absent(),
              }) => TrainingRecordsCompanion(
                id: id,
                completedAt: completedAt,
                strengthGained: strengthGained,
                enduranceGained: enduranceGained,
                energyGained: energyGained,
                staminaGained: staminaGained,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime completedAt,
                Value<int> strengthGained = const Value.absent(),
                Value<int> enduranceGained = const Value.absent(),
                Value<int> energyGained = const Value.absent(),
                Value<int> staminaGained = const Value.absent(),
              }) => TrainingRecordsCompanion.insert(
                id: id,
                completedAt: completedAt,
                strengthGained: strengthGained,
                enduranceGained: enduranceGained,
                energyGained: energyGained,
                staminaGained: staminaGained,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TrainingRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrainingRecordsTable,
      TrainingRecordRow,
      $$TrainingRecordsTableFilterComposer,
      $$TrainingRecordsTableOrderingComposer,
      $$TrainingRecordsTableAnnotationComposer,
      $$TrainingRecordsTableCreateCompanionBuilder,
      $$TrainingRecordsTableUpdateCompanionBuilder,
      (
        TrainingRecordRow,
        BaseReferences<_$AppDatabase, $TrainingRecordsTable, TrainingRecordRow>,
      ),
      TrainingRecordRow,
      PrefetchHooks Function()
    >;
typedef $$TrainingRecordExercisesTableCreateCompanionBuilder =
    TrainingRecordExercisesCompanion Function({
      Value<int> id,
      required int trainingRecordId,
      required String exerciseId,
      required int variantIndex,
      Value<int?> sets,
      required double amount,
      required String unit,
    });
typedef $$TrainingRecordExercisesTableUpdateCompanionBuilder =
    TrainingRecordExercisesCompanion Function({
      Value<int> id,
      Value<int> trainingRecordId,
      Value<String> exerciseId,
      Value<int> variantIndex,
      Value<int?> sets,
      Value<double> amount,
      Value<String> unit,
    });

class $$TrainingRecordExercisesTableFilterComposer
    extends Composer<_$AppDatabase, $TrainingRecordExercisesTable> {
  $$TrainingRecordExercisesTableFilterComposer({
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

  ColumnFilters<int> get trainingRecordId => $composableBuilder(
    column: $table.trainingRecordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
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

class $$TrainingRecordExercisesTableOrderingComposer
    extends Composer<_$AppDatabase, $TrainingRecordExercisesTable> {
  $$TrainingRecordExercisesTableOrderingComposer({
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

  ColumnOrderings<int> get trainingRecordId => $composableBuilder(
    column: $table.trainingRecordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
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

class $$TrainingRecordExercisesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TrainingRecordExercisesTable> {
  $$TrainingRecordExercisesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get trainingRecordId => $composableBuilder(
    column: $table.trainingRecordId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exerciseId => $composableBuilder(
    column: $table.exerciseId,
    builder: (column) => column,
  );

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

class $$TrainingRecordExercisesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TrainingRecordExercisesTable,
          TrainingRecordExerciseRow,
          $$TrainingRecordExercisesTableFilterComposer,
          $$TrainingRecordExercisesTableOrderingComposer,
          $$TrainingRecordExercisesTableAnnotationComposer,
          $$TrainingRecordExercisesTableCreateCompanionBuilder,
          $$TrainingRecordExercisesTableUpdateCompanionBuilder,
          (
            TrainingRecordExerciseRow,
            BaseReferences<
              _$AppDatabase,
              $TrainingRecordExercisesTable,
              TrainingRecordExerciseRow
            >,
          ),
          TrainingRecordExerciseRow,
          PrefetchHooks Function()
        > {
  $$TrainingRecordExercisesTableTableManager(
    _$AppDatabase db,
    $TrainingRecordExercisesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TrainingRecordExercisesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$TrainingRecordExercisesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TrainingRecordExercisesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> trainingRecordId = const Value.absent(),
                Value<String> exerciseId = const Value.absent(),
                Value<int> variantIndex = const Value.absent(),
                Value<int?> sets = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> unit = const Value.absent(),
              }) => TrainingRecordExercisesCompanion(
                id: id,
                trainingRecordId: trainingRecordId,
                exerciseId: exerciseId,
                variantIndex: variantIndex,
                sets: sets,
                amount: amount,
                unit: unit,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int trainingRecordId,
                required String exerciseId,
                required int variantIndex,
                Value<int?> sets = const Value.absent(),
                required double amount,
                required String unit,
              }) => TrainingRecordExercisesCompanion.insert(
                id: id,
                trainingRecordId: trainingRecordId,
                exerciseId: exerciseId,
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

typedef $$TrainingRecordExercisesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TrainingRecordExercisesTable,
      TrainingRecordExerciseRow,
      $$TrainingRecordExercisesTableFilterComposer,
      $$TrainingRecordExercisesTableOrderingComposer,
      $$TrainingRecordExercisesTableAnnotationComposer,
      $$TrainingRecordExercisesTableCreateCompanionBuilder,
      $$TrainingRecordExercisesTableUpdateCompanionBuilder,
      (
        TrainingRecordExerciseRow,
        BaseReferences<
          _$AppDatabase,
          $TrainingRecordExercisesTable,
          TrainingRecordExerciseRow
        >,
      ),
      TrainingRecordExerciseRow,
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
  $$VariantFamiliesTableTableManager get variantFamilies =>
      $$VariantFamiliesTableTableManager(_db, _db.variantFamilies);
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
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$TrainingRecordsTableTableManager get trainingRecords =>
      $$TrainingRecordsTableTableManager(_db, _db.trainingRecords);
  $$TrainingRecordExercisesTableTableManager get trainingRecordExercises =>
      $$TrainingRecordExercisesTableTableManager(
        _db,
        _db.trainingRecordExercises,
      );
}
