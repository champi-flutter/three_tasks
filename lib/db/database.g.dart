// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DayTasksTable extends DayTasks with TableInfo<$DayTasksTable, DayTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
      'task', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
      'date', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isCheckedMeta =
      const VerificationMeta('isChecked');
  @override
  late final GeneratedColumn<bool> isChecked = GeneratedColumn<bool>(
      'is_checked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_checked" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
      'result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _improvementMeta =
      const VerificationMeta('improvement');
  @override
  late final GeneratedColumn<String> improvement = GeneratedColumn<String>(
      'improvement', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [task, date, id, isChecked, result, improvement];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<DayTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    }
    if (data.containsKey('improvement')) {
      context.handle(
          _improvementMeta,
          improvement.isAcceptableOrUnknown(
              data['improvement']!, _improvementMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DayTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayTask(
      task: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}date'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isChecked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_checked'])!,
      result: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}result']),
      improvement: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}improvement']),
    );
  }

  @override
  $DayTasksTable createAlias(String alias) {
    return $DayTasksTable(attachedDatabase, alias);
  }
}

class DayTask extends DataClass implements Insertable<DayTask> {
  final String task;
  final int date;
  final int id;
  final bool isChecked;
  final String? result;
  final String? improvement;
  const DayTask(
      {required this.task,
      required this.date,
      required this.id,
      required this.isChecked,
      this.result,
      this.improvement});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task'] = Variable<String>(task);
    map['date'] = Variable<int>(date);
    map['id'] = Variable<int>(id);
    map['is_checked'] = Variable<bool>(isChecked);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || improvement != null) {
      map['improvement'] = Variable<String>(improvement);
    }
    return map;
  }

  DayTasksCompanion toCompanion(bool nullToAbsent) {
    return DayTasksCompanion(
      task: Value(task),
      date: Value(date),
      id: Value(id),
      isChecked: Value(isChecked),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      improvement: improvement == null && nullToAbsent
          ? const Value.absent()
          : Value(improvement),
    );
  }

  factory DayTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayTask(
      task: serializer.fromJson<String>(json['task']),
      date: serializer.fromJson<int>(json['date']),
      id: serializer.fromJson<int>(json['id']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
      result: serializer.fromJson<String?>(json['result']),
      improvement: serializer.fromJson<String?>(json['improvement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'task': serializer.toJson<String>(task),
      'date': serializer.toJson<int>(date),
      'id': serializer.toJson<int>(id),
      'isChecked': serializer.toJson<bool>(isChecked),
      'result': serializer.toJson<String?>(result),
      'improvement': serializer.toJson<String?>(improvement),
    };
  }

  DayTask copyWith(
          {String? task,
          int? date,
          int? id,
          bool? isChecked,
          Value<String?> result = const Value.absent(),
          Value<String?> improvement = const Value.absent()}) =>
      DayTask(
        task: task ?? this.task,
        date: date ?? this.date,
        id: id ?? this.id,
        isChecked: isChecked ?? this.isChecked,
        result: result.present ? result.value : this.result,
        improvement: improvement.present ? improvement.value : this.improvement,
      );
  DayTask copyWithCompanion(DayTasksCompanion data) {
    return DayTask(
      task: data.task.present ? data.task.value : this.task,
      date: data.date.present ? data.date.value : this.date,
      id: data.id.present ? data.id.value : this.id,
      isChecked: data.isChecked.present ? data.isChecked.value : this.isChecked,
      result: data.result.present ? data.result.value : this.result,
      improvement:
          data.improvement.present ? data.improvement.value : this.improvement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayTask(')
          ..write('task: $task, ')
          ..write('date: $date, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('result: $result, ')
          ..write('improvement: $improvement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(task, date, id, isChecked, result, improvement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayTask &&
          other.task == this.task &&
          other.date == this.date &&
          other.id == this.id &&
          other.isChecked == this.isChecked &&
          other.result == this.result &&
          other.improvement == this.improvement);
}

class DayTasksCompanion extends UpdateCompanion<DayTask> {
  final Value<String> task;
  final Value<int> date;
  final Value<int> id;
  final Value<bool> isChecked;
  final Value<String?> result;
  final Value<String?> improvement;
  const DayTasksCompanion({
    this.task = const Value.absent(),
    this.date = const Value.absent(),
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.result = const Value.absent(),
    this.improvement = const Value.absent(),
  });
  DayTasksCompanion.insert({
    required String task,
    required int date,
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.result = const Value.absent(),
    this.improvement = const Value.absent(),
  })  : task = Value(task),
        date = Value(date);
  static Insertable<DayTask> custom({
    Expression<String>? task,
    Expression<int>? date,
    Expression<int>? id,
    Expression<bool>? isChecked,
    Expression<String>? result,
    Expression<String>? improvement,
  }) {
    return RawValuesInsertable({
      if (task != null) 'task': task,
      if (date != null) 'date': date,
      if (id != null) 'id': id,
      if (isChecked != null) 'is_checked': isChecked,
      if (result != null) 'result': result,
      if (improvement != null) 'improvement': improvement,
    });
  }

  DayTasksCompanion copyWith(
      {Value<String>? task,
      Value<int>? date,
      Value<int>? id,
      Value<bool>? isChecked,
      Value<String?>? result,
      Value<String?>? improvement}) {
    return DayTasksCompanion(
      task: task ?? this.task,
      date: date ?? this.date,
      id: id ?? this.id,
      isChecked: isChecked ?? this.isChecked,
      result: result ?? this.result,
      improvement: improvement ?? this.improvement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (improvement.present) {
      map['improvement'] = Variable<String>(improvement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayTasksCompanion(')
          ..write('task: $task, ')
          ..write('date: $date, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('result: $result, ')
          ..write('improvement: $improvement')
          ..write(')'))
        .toString();
  }
}

class $WeeklyTasksTable extends WeeklyTasks
    with TableInfo<$WeeklyTasksTable, WeeklyTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeeklyTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
      'task', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstDateMeta =
      const VerificationMeta('firstDate');
  @override
  late final GeneratedColumn<int> firstDate = GeneratedColumn<int>(
      'first_date', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isCheckedMeta =
      const VerificationMeta('isChecked');
  @override
  late final GeneratedColumn<bool> isChecked = GeneratedColumn<bool>(
      'is_checked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_checked" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
      'result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _improvementMeta =
      const VerificationMeta('improvement');
  @override
  late final GeneratedColumn<String> improvement = GeneratedColumn<String>(
      'improvement', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [task, firstDate, id, isChecked, result, improvement];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weekly_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<WeeklyTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('first_date')) {
      context.handle(_firstDateMeta,
          firstDate.isAcceptableOrUnknown(data['first_date']!, _firstDateMeta));
    } else if (isInserting) {
      context.missing(_firstDateMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    }
    if (data.containsKey('improvement')) {
      context.handle(
          _improvementMeta,
          improvement.isAcceptableOrUnknown(
              data['improvement']!, _improvementMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeeklyTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeeklyTask(
      task: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task'])!,
      firstDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}first_date'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isChecked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_checked'])!,
      result: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}result']),
      improvement: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}improvement']),
    );
  }

  @override
  $WeeklyTasksTable createAlias(String alias) {
    return $WeeklyTasksTable(attachedDatabase, alias);
  }
}

class WeeklyTask extends DataClass implements Insertable<WeeklyTask> {
  final String task;
  final int firstDate;
  final int id;
  final bool isChecked;
  final String? result;
  final String? improvement;
  const WeeklyTask(
      {required this.task,
      required this.firstDate,
      required this.id,
      required this.isChecked,
      this.result,
      this.improvement});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task'] = Variable<String>(task);
    map['first_date'] = Variable<int>(firstDate);
    map['id'] = Variable<int>(id);
    map['is_checked'] = Variable<bool>(isChecked);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || improvement != null) {
      map['improvement'] = Variable<String>(improvement);
    }
    return map;
  }

  WeeklyTasksCompanion toCompanion(bool nullToAbsent) {
    return WeeklyTasksCompanion(
      task: Value(task),
      firstDate: Value(firstDate),
      id: Value(id),
      isChecked: Value(isChecked),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      improvement: improvement == null && nullToAbsent
          ? const Value.absent()
          : Value(improvement),
    );
  }

  factory WeeklyTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeeklyTask(
      task: serializer.fromJson<String>(json['task']),
      firstDate: serializer.fromJson<int>(json['firstDate']),
      id: serializer.fromJson<int>(json['id']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
      result: serializer.fromJson<String?>(json['result']),
      improvement: serializer.fromJson<String?>(json['improvement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'task': serializer.toJson<String>(task),
      'firstDate': serializer.toJson<int>(firstDate),
      'id': serializer.toJson<int>(id),
      'isChecked': serializer.toJson<bool>(isChecked),
      'result': serializer.toJson<String?>(result),
      'improvement': serializer.toJson<String?>(improvement),
    };
  }

  WeeklyTask copyWith(
          {String? task,
          int? firstDate,
          int? id,
          bool? isChecked,
          Value<String?> result = const Value.absent(),
          Value<String?> improvement = const Value.absent()}) =>
      WeeklyTask(
        task: task ?? this.task,
        firstDate: firstDate ?? this.firstDate,
        id: id ?? this.id,
        isChecked: isChecked ?? this.isChecked,
        result: result.present ? result.value : this.result,
        improvement: improvement.present ? improvement.value : this.improvement,
      );
  WeeklyTask copyWithCompanion(WeeklyTasksCompanion data) {
    return WeeklyTask(
      task: data.task.present ? data.task.value : this.task,
      firstDate: data.firstDate.present ? data.firstDate.value : this.firstDate,
      id: data.id.present ? data.id.value : this.id,
      isChecked: data.isChecked.present ? data.isChecked.value : this.isChecked,
      result: data.result.present ? data.result.value : this.result,
      improvement:
          data.improvement.present ? data.improvement.value : this.improvement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyTask(')
          ..write('task: $task, ')
          ..write('firstDate: $firstDate, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('result: $result, ')
          ..write('improvement: $improvement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(task, firstDate, id, isChecked, result, improvement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeeklyTask &&
          other.task == this.task &&
          other.firstDate == this.firstDate &&
          other.id == this.id &&
          other.isChecked == this.isChecked &&
          other.result == this.result &&
          other.improvement == this.improvement);
}

class WeeklyTasksCompanion extends UpdateCompanion<WeeklyTask> {
  final Value<String> task;
  final Value<int> firstDate;
  final Value<int> id;
  final Value<bool> isChecked;
  final Value<String?> result;
  final Value<String?> improvement;
  const WeeklyTasksCompanion({
    this.task = const Value.absent(),
    this.firstDate = const Value.absent(),
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.result = const Value.absent(),
    this.improvement = const Value.absent(),
  });
  WeeklyTasksCompanion.insert({
    required String task,
    required int firstDate,
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.result = const Value.absent(),
    this.improvement = const Value.absent(),
  })  : task = Value(task),
        firstDate = Value(firstDate);
  static Insertable<WeeklyTask> custom({
    Expression<String>? task,
    Expression<int>? firstDate,
    Expression<int>? id,
    Expression<bool>? isChecked,
    Expression<String>? result,
    Expression<String>? improvement,
  }) {
    return RawValuesInsertable({
      if (task != null) 'task': task,
      if (firstDate != null) 'first_date': firstDate,
      if (id != null) 'id': id,
      if (isChecked != null) 'is_checked': isChecked,
      if (result != null) 'result': result,
      if (improvement != null) 'improvement': improvement,
    });
  }

  WeeklyTasksCompanion copyWith(
      {Value<String>? task,
      Value<int>? firstDate,
      Value<int>? id,
      Value<bool>? isChecked,
      Value<String?>? result,
      Value<String?>? improvement}) {
    return WeeklyTasksCompanion(
      task: task ?? this.task,
      firstDate: firstDate ?? this.firstDate,
      id: id ?? this.id,
      isChecked: isChecked ?? this.isChecked,
      result: result ?? this.result,
      improvement: improvement ?? this.improvement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (firstDate.present) {
      map['first_date'] = Variable<int>(firstDate.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (improvement.present) {
      map['improvement'] = Variable<String>(improvement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyTasksCompanion(')
          ..write('task: $task, ')
          ..write('firstDate: $firstDate, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('result: $result, ')
          ..write('improvement: $improvement')
          ..write(')'))
        .toString();
  }
}

class $MonthlyTasksTable extends MonthlyTasks
    with TableInfo<$MonthlyTasksTable, MonthlyTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MonthlyTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
      'task', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<String> month = GeneratedColumn<String>(
      'month', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isCheckedMeta =
      const VerificationMeta('isChecked');
  @override
  late final GeneratedColumn<bool> isChecked = GeneratedColumn<bool>(
      'is_checked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_checked" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
      'result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _improvementMeta =
      const VerificationMeta('improvement');
  @override
  late final GeneratedColumn<String> improvement = GeneratedColumn<String>(
      'improvement', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [task, month, id, isChecked, result, improvement];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'monthly_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<MonthlyTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    }
    if (data.containsKey('improvement')) {
      context.handle(
          _improvementMeta,
          improvement.isAcceptableOrUnknown(
              data['improvement']!, _improvementMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MonthlyTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MonthlyTask(
      task: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task'])!,
      month: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}month'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isChecked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_checked'])!,
      result: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}result']),
      improvement: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}improvement']),
    );
  }

  @override
  $MonthlyTasksTable createAlias(String alias) {
    return $MonthlyTasksTable(attachedDatabase, alias);
  }
}

class MonthlyTask extends DataClass implements Insertable<MonthlyTask> {
  final String task;
  final String month;
  final int id;
  final bool isChecked;
  final String? result;
  final String? improvement;
  const MonthlyTask(
      {required this.task,
      required this.month,
      required this.id,
      required this.isChecked,
      this.result,
      this.improvement});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task'] = Variable<String>(task);
    map['month'] = Variable<String>(month);
    map['id'] = Variable<int>(id);
    map['is_checked'] = Variable<bool>(isChecked);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || improvement != null) {
      map['improvement'] = Variable<String>(improvement);
    }
    return map;
  }

  MonthlyTasksCompanion toCompanion(bool nullToAbsent) {
    return MonthlyTasksCompanion(
      task: Value(task),
      month: Value(month),
      id: Value(id),
      isChecked: Value(isChecked),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      improvement: improvement == null && nullToAbsent
          ? const Value.absent()
          : Value(improvement),
    );
  }

  factory MonthlyTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MonthlyTask(
      task: serializer.fromJson<String>(json['task']),
      month: serializer.fromJson<String>(json['month']),
      id: serializer.fromJson<int>(json['id']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
      result: serializer.fromJson<String?>(json['result']),
      improvement: serializer.fromJson<String?>(json['improvement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'task': serializer.toJson<String>(task),
      'month': serializer.toJson<String>(month),
      'id': serializer.toJson<int>(id),
      'isChecked': serializer.toJson<bool>(isChecked),
      'result': serializer.toJson<String?>(result),
      'improvement': serializer.toJson<String?>(improvement),
    };
  }

  MonthlyTask copyWith(
          {String? task,
          String? month,
          int? id,
          bool? isChecked,
          Value<String?> result = const Value.absent(),
          Value<String?> improvement = const Value.absent()}) =>
      MonthlyTask(
        task: task ?? this.task,
        month: month ?? this.month,
        id: id ?? this.id,
        isChecked: isChecked ?? this.isChecked,
        result: result.present ? result.value : this.result,
        improvement: improvement.present ? improvement.value : this.improvement,
      );
  MonthlyTask copyWithCompanion(MonthlyTasksCompanion data) {
    return MonthlyTask(
      task: data.task.present ? data.task.value : this.task,
      month: data.month.present ? data.month.value : this.month,
      id: data.id.present ? data.id.value : this.id,
      isChecked: data.isChecked.present ? data.isChecked.value : this.isChecked,
      result: data.result.present ? data.result.value : this.result,
      improvement:
          data.improvement.present ? data.improvement.value : this.improvement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyTask(')
          ..write('task: $task, ')
          ..write('month: $month, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('result: $result, ')
          ..write('improvement: $improvement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(task, month, id, isChecked, result, improvement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MonthlyTask &&
          other.task == this.task &&
          other.month == this.month &&
          other.id == this.id &&
          other.isChecked == this.isChecked &&
          other.result == this.result &&
          other.improvement == this.improvement);
}

class MonthlyTasksCompanion extends UpdateCompanion<MonthlyTask> {
  final Value<String> task;
  final Value<String> month;
  final Value<int> id;
  final Value<bool> isChecked;
  final Value<String?> result;
  final Value<String?> improvement;
  const MonthlyTasksCompanion({
    this.task = const Value.absent(),
    this.month = const Value.absent(),
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.result = const Value.absent(),
    this.improvement = const Value.absent(),
  });
  MonthlyTasksCompanion.insert({
    required String task,
    required String month,
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.result = const Value.absent(),
    this.improvement = const Value.absent(),
  })  : task = Value(task),
        month = Value(month);
  static Insertable<MonthlyTask> custom({
    Expression<String>? task,
    Expression<String>? month,
    Expression<int>? id,
    Expression<bool>? isChecked,
    Expression<String>? result,
    Expression<String>? improvement,
  }) {
    return RawValuesInsertable({
      if (task != null) 'task': task,
      if (month != null) 'month': month,
      if (id != null) 'id': id,
      if (isChecked != null) 'is_checked': isChecked,
      if (result != null) 'result': result,
      if (improvement != null) 'improvement': improvement,
    });
  }

  MonthlyTasksCompanion copyWith(
      {Value<String>? task,
      Value<String>? month,
      Value<int>? id,
      Value<bool>? isChecked,
      Value<String?>? result,
      Value<String?>? improvement}) {
    return MonthlyTasksCompanion(
      task: task ?? this.task,
      month: month ?? this.month,
      id: id ?? this.id,
      isChecked: isChecked ?? this.isChecked,
      result: result ?? this.result,
      improvement: improvement ?? this.improvement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (month.present) {
      map['month'] = Variable<String>(month.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (improvement.present) {
      map['improvement'] = Variable<String>(improvement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyTasksCompanion(')
          ..write('task: $task, ')
          ..write('month: $month, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('result: $result, ')
          ..write('improvement: $improvement')
          ..write(')'))
        .toString();
  }
}

class $YearlyTasksTable extends YearlyTasks
    with TableInfo<$YearlyTasksTable, YearlyTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $YearlyTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
      'task', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<String> year = GeneratedColumn<String>(
      'year', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isCheckedMeta =
      const VerificationMeta('isChecked');
  @override
  late final GeneratedColumn<bool> isChecked = GeneratedColumn<bool>(
      'is_checked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_checked" IN (0, 1))'),
      defaultValue: Constant(false));
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
      'result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _improvementMeta =
      const VerificationMeta('improvement');
  @override
  late final GeneratedColumn<String> improvement = GeneratedColumn<String>(
      'improvement', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [task, year, id, isChecked, result, improvement];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'yearly_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<YearlyTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    }
    if (data.containsKey('improvement')) {
      context.handle(
          _improvementMeta,
          improvement.isAcceptableOrUnknown(
              data['improvement']!, _improvementMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  YearlyTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return YearlyTask(
      task: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}year'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isChecked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_checked'])!,
      result: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}result']),
      improvement: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}improvement']),
    );
  }

  @override
  $YearlyTasksTable createAlias(String alias) {
    return $YearlyTasksTable(attachedDatabase, alias);
  }
}

class YearlyTask extends DataClass implements Insertable<YearlyTask> {
  final String task;
  final String year;
  final int id;
  final bool isChecked;
  final String? result;
  final String? improvement;
  const YearlyTask(
      {required this.task,
      required this.year,
      required this.id,
      required this.isChecked,
      this.result,
      this.improvement});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task'] = Variable<String>(task);
    map['year'] = Variable<String>(year);
    map['id'] = Variable<int>(id);
    map['is_checked'] = Variable<bool>(isChecked);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || improvement != null) {
      map['improvement'] = Variable<String>(improvement);
    }
    return map;
  }

  YearlyTasksCompanion toCompanion(bool nullToAbsent) {
    return YearlyTasksCompanion(
      task: Value(task),
      year: Value(year),
      id: Value(id),
      isChecked: Value(isChecked),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      improvement: improvement == null && nullToAbsent
          ? const Value.absent()
          : Value(improvement),
    );
  }

  factory YearlyTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return YearlyTask(
      task: serializer.fromJson<String>(json['task']),
      year: serializer.fromJson<String>(json['year']),
      id: serializer.fromJson<int>(json['id']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
      result: serializer.fromJson<String?>(json['result']),
      improvement: serializer.fromJson<String?>(json['improvement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'task': serializer.toJson<String>(task),
      'year': serializer.toJson<String>(year),
      'id': serializer.toJson<int>(id),
      'isChecked': serializer.toJson<bool>(isChecked),
      'result': serializer.toJson<String?>(result),
      'improvement': serializer.toJson<String?>(improvement),
    };
  }

  YearlyTask copyWith(
          {String? task,
          String? year,
          int? id,
          bool? isChecked,
          Value<String?> result = const Value.absent(),
          Value<String?> improvement = const Value.absent()}) =>
      YearlyTask(
        task: task ?? this.task,
        year: year ?? this.year,
        id: id ?? this.id,
        isChecked: isChecked ?? this.isChecked,
        result: result.present ? result.value : this.result,
        improvement: improvement.present ? improvement.value : this.improvement,
      );
  YearlyTask copyWithCompanion(YearlyTasksCompanion data) {
    return YearlyTask(
      task: data.task.present ? data.task.value : this.task,
      year: data.year.present ? data.year.value : this.year,
      id: data.id.present ? data.id.value : this.id,
      isChecked: data.isChecked.present ? data.isChecked.value : this.isChecked,
      result: data.result.present ? data.result.value : this.result,
      improvement:
          data.improvement.present ? data.improvement.value : this.improvement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('YearlyTask(')
          ..write('task: $task, ')
          ..write('year: $year, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('result: $result, ')
          ..write('improvement: $improvement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(task, year, id, isChecked, result, improvement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is YearlyTask &&
          other.task == this.task &&
          other.year == this.year &&
          other.id == this.id &&
          other.isChecked == this.isChecked &&
          other.result == this.result &&
          other.improvement == this.improvement);
}

class YearlyTasksCompanion extends UpdateCompanion<YearlyTask> {
  final Value<String> task;
  final Value<String> year;
  final Value<int> id;
  final Value<bool> isChecked;
  final Value<String?> result;
  final Value<String?> improvement;
  const YearlyTasksCompanion({
    this.task = const Value.absent(),
    this.year = const Value.absent(),
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.result = const Value.absent(),
    this.improvement = const Value.absent(),
  });
  YearlyTasksCompanion.insert({
    required String task,
    required String year,
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.result = const Value.absent(),
    this.improvement = const Value.absent(),
  })  : task = Value(task),
        year = Value(year);
  static Insertable<YearlyTask> custom({
    Expression<String>? task,
    Expression<String>? year,
    Expression<int>? id,
    Expression<bool>? isChecked,
    Expression<String>? result,
    Expression<String>? improvement,
  }) {
    return RawValuesInsertable({
      if (task != null) 'task': task,
      if (year != null) 'year': year,
      if (id != null) 'id': id,
      if (isChecked != null) 'is_checked': isChecked,
      if (result != null) 'result': result,
      if (improvement != null) 'improvement': improvement,
    });
  }

  YearlyTasksCompanion copyWith(
      {Value<String>? task,
      Value<String>? year,
      Value<int>? id,
      Value<bool>? isChecked,
      Value<String?>? result,
      Value<String?>? improvement}) {
    return YearlyTasksCompanion(
      task: task ?? this.task,
      year: year ?? this.year,
      id: id ?? this.id,
      isChecked: isChecked ?? this.isChecked,
      result: result ?? this.result,
      improvement: improvement ?? this.improvement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (year.present) {
      map['year'] = Variable<String>(year.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (improvement.present) {
      map['improvement'] = Variable<String>(improvement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('YearlyTasksCompanion(')
          ..write('task: $task, ')
          ..write('year: $year, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('result: $result, ')
          ..write('improvement: $improvement')
          ..write(')'))
        .toString();
  }
}

class $LabeledTasksTable extends LabeledTasks
    with TableInfo<$LabeledTasksTable, LabeledTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LabeledTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _labeledIdMeta =
      const VerificationMeta('labeledId');
  @override
  late final GeneratedColumn<int> labeledId = GeneratedColumn<int>(
      'labeled_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dailyIdListMeta =
      const VerificationMeta('dailyIdList');
  @override
  late final GeneratedColumn<Uint8List> dailyIdList =
      GeneratedColumn<Uint8List>('daily_id_list', aliasedName, false,
          type: DriftSqlType.blob,
          requiredDuringInsert: false,
          defaultValue: Constant(Uint8List.fromList([])));
  static const VerificationMeta _weeklyIdListMeta =
      const VerificationMeta('weeklyIdList');
  @override
  late final GeneratedColumn<Uint8List> weeklyIdList =
      GeneratedColumn<Uint8List>('weekly_id_list', aliasedName, false,
          type: DriftSqlType.blob,
          requiredDuringInsert: false,
          defaultValue: Constant(Uint8List.fromList([])));
  static const VerificationMeta _monthlyIdListMeta =
      const VerificationMeta('monthlyIdList');
  @override
  late final GeneratedColumn<Uint8List> monthlyIdList =
      GeneratedColumn<Uint8List>('monthly_id_list', aliasedName, false,
          type: DriftSqlType.blob,
          requiredDuringInsert: false,
          defaultValue: Constant(Uint8List.fromList([])));
  static const VerificationMeta _yearlyIdListMeta =
      const VerificationMeta('yearlyIdList');
  @override
  late final GeneratedColumn<Uint8List> yearlyIdList =
      GeneratedColumn<Uint8List>('yearly_id_list', aliasedName, false,
          type: DriftSqlType.blob,
          requiredDuringInsert: false,
          defaultValue: Constant(Uint8List.fromList([])));
  @override
  List<GeneratedColumn> get $columns => [
        labeledId,
        label,
        dailyIdList,
        weeklyIdList,
        monthlyIdList,
        yearlyIdList
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'labeled_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<LabeledTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('labeled_id')) {
      context.handle(_labeledIdMeta,
          labeledId.isAcceptableOrUnknown(data['labeled_id']!, _labeledIdMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('daily_id_list')) {
      context.handle(
          _dailyIdListMeta,
          dailyIdList.isAcceptableOrUnknown(
              data['daily_id_list']!, _dailyIdListMeta));
    }
    if (data.containsKey('weekly_id_list')) {
      context.handle(
          _weeklyIdListMeta,
          weeklyIdList.isAcceptableOrUnknown(
              data['weekly_id_list']!, _weeklyIdListMeta));
    }
    if (data.containsKey('monthly_id_list')) {
      context.handle(
          _monthlyIdListMeta,
          monthlyIdList.isAcceptableOrUnknown(
              data['monthly_id_list']!, _monthlyIdListMeta));
    }
    if (data.containsKey('yearly_id_list')) {
      context.handle(
          _yearlyIdListMeta,
          yearlyIdList.isAcceptableOrUnknown(
              data['yearly_id_list']!, _yearlyIdListMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {labeledId};
  @override
  LabeledTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LabeledTask(
      labeledId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}labeled_id'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      dailyIdList: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}daily_id_list'])!,
      weeklyIdList: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}weekly_id_list'])!,
      monthlyIdList: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}monthly_id_list'])!,
      yearlyIdList: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}yearly_id_list'])!,
    );
  }

  @override
  $LabeledTasksTable createAlias(String alias) {
    return $LabeledTasksTable(attachedDatabase, alias);
  }
}

class LabeledTask extends DataClass implements Insertable<LabeledTask> {
  final int labeledId;
  final String label;
  final Uint8List dailyIdList;
  final Uint8List weeklyIdList;
  final Uint8List monthlyIdList;
  final Uint8List yearlyIdList;
  const LabeledTask(
      {required this.labeledId,
      required this.label,
      required this.dailyIdList,
      required this.weeklyIdList,
      required this.monthlyIdList,
      required this.yearlyIdList});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['labeled_id'] = Variable<int>(labeledId);
    map['label'] = Variable<String>(label);
    map['daily_id_list'] = Variable<Uint8List>(dailyIdList);
    map['weekly_id_list'] = Variable<Uint8List>(weeklyIdList);
    map['monthly_id_list'] = Variable<Uint8List>(monthlyIdList);
    map['yearly_id_list'] = Variable<Uint8List>(yearlyIdList);
    return map;
  }

  LabeledTasksCompanion toCompanion(bool nullToAbsent) {
    return LabeledTasksCompanion(
      labeledId: Value(labeledId),
      label: Value(label),
      dailyIdList: Value(dailyIdList),
      weeklyIdList: Value(weeklyIdList),
      monthlyIdList: Value(monthlyIdList),
      yearlyIdList: Value(yearlyIdList),
    );
  }

  factory LabeledTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LabeledTask(
      labeledId: serializer.fromJson<int>(json['labeledId']),
      label: serializer.fromJson<String>(json['label']),
      dailyIdList: serializer.fromJson<Uint8List>(json['dailyIdList']),
      weeklyIdList: serializer.fromJson<Uint8List>(json['weeklyIdList']),
      monthlyIdList: serializer.fromJson<Uint8List>(json['monthlyIdList']),
      yearlyIdList: serializer.fromJson<Uint8List>(json['yearlyIdList']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'labeledId': serializer.toJson<int>(labeledId),
      'label': serializer.toJson<String>(label),
      'dailyIdList': serializer.toJson<Uint8List>(dailyIdList),
      'weeklyIdList': serializer.toJson<Uint8List>(weeklyIdList),
      'monthlyIdList': serializer.toJson<Uint8List>(monthlyIdList),
      'yearlyIdList': serializer.toJson<Uint8List>(yearlyIdList),
    };
  }

  LabeledTask copyWith(
          {int? labeledId,
          String? label,
          Uint8List? dailyIdList,
          Uint8List? weeklyIdList,
          Uint8List? monthlyIdList,
          Uint8List? yearlyIdList}) =>
      LabeledTask(
        labeledId: labeledId ?? this.labeledId,
        label: label ?? this.label,
        dailyIdList: dailyIdList ?? this.dailyIdList,
        weeklyIdList: weeklyIdList ?? this.weeklyIdList,
        monthlyIdList: monthlyIdList ?? this.monthlyIdList,
        yearlyIdList: yearlyIdList ?? this.yearlyIdList,
      );
  LabeledTask copyWithCompanion(LabeledTasksCompanion data) {
    return LabeledTask(
      labeledId: data.labeledId.present ? data.labeledId.value : this.labeledId,
      label: data.label.present ? data.label.value : this.label,
      dailyIdList:
          data.dailyIdList.present ? data.dailyIdList.value : this.dailyIdList,
      weeklyIdList: data.weeklyIdList.present
          ? data.weeklyIdList.value
          : this.weeklyIdList,
      monthlyIdList: data.monthlyIdList.present
          ? data.monthlyIdList.value
          : this.monthlyIdList,
      yearlyIdList: data.yearlyIdList.present
          ? data.yearlyIdList.value
          : this.yearlyIdList,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LabeledTask(')
          ..write('labeledId: $labeledId, ')
          ..write('label: $label, ')
          ..write('dailyIdList: $dailyIdList, ')
          ..write('weeklyIdList: $weeklyIdList, ')
          ..write('monthlyIdList: $monthlyIdList, ')
          ..write('yearlyIdList: $yearlyIdList')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      labeledId,
      label,
      $driftBlobEquality.hash(dailyIdList),
      $driftBlobEquality.hash(weeklyIdList),
      $driftBlobEquality.hash(monthlyIdList),
      $driftBlobEquality.hash(yearlyIdList));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LabeledTask &&
          other.labeledId == this.labeledId &&
          other.label == this.label &&
          $driftBlobEquality.equals(other.dailyIdList, this.dailyIdList) &&
          $driftBlobEquality.equals(other.weeklyIdList, this.weeklyIdList) &&
          $driftBlobEquality.equals(other.monthlyIdList, this.monthlyIdList) &&
          $driftBlobEquality.equals(other.yearlyIdList, this.yearlyIdList));
}

class LabeledTasksCompanion extends UpdateCompanion<LabeledTask> {
  final Value<int> labeledId;
  final Value<String> label;
  final Value<Uint8List> dailyIdList;
  final Value<Uint8List> weeklyIdList;
  final Value<Uint8List> monthlyIdList;
  final Value<Uint8List> yearlyIdList;
  const LabeledTasksCompanion({
    this.labeledId = const Value.absent(),
    this.label = const Value.absent(),
    this.dailyIdList = const Value.absent(),
    this.weeklyIdList = const Value.absent(),
    this.monthlyIdList = const Value.absent(),
    this.yearlyIdList = const Value.absent(),
  });
  LabeledTasksCompanion.insert({
    this.labeledId = const Value.absent(),
    required String label,
    this.dailyIdList = const Value.absent(),
    this.weeklyIdList = const Value.absent(),
    this.monthlyIdList = const Value.absent(),
    this.yearlyIdList = const Value.absent(),
  }) : label = Value(label);
  static Insertable<LabeledTask> custom({
    Expression<int>? labeledId,
    Expression<String>? label,
    Expression<Uint8List>? dailyIdList,
    Expression<Uint8List>? weeklyIdList,
    Expression<Uint8List>? monthlyIdList,
    Expression<Uint8List>? yearlyIdList,
  }) {
    return RawValuesInsertable({
      if (labeledId != null) 'labeled_id': labeledId,
      if (label != null) 'label': label,
      if (dailyIdList != null) 'daily_id_list': dailyIdList,
      if (weeklyIdList != null) 'weekly_id_list': weeklyIdList,
      if (monthlyIdList != null) 'monthly_id_list': monthlyIdList,
      if (yearlyIdList != null) 'yearly_id_list': yearlyIdList,
    });
  }

  LabeledTasksCompanion copyWith(
      {Value<int>? labeledId,
      Value<String>? label,
      Value<Uint8List>? dailyIdList,
      Value<Uint8List>? weeklyIdList,
      Value<Uint8List>? monthlyIdList,
      Value<Uint8List>? yearlyIdList}) {
    return LabeledTasksCompanion(
      labeledId: labeledId ?? this.labeledId,
      label: label ?? this.label,
      dailyIdList: dailyIdList ?? this.dailyIdList,
      weeklyIdList: weeklyIdList ?? this.weeklyIdList,
      monthlyIdList: monthlyIdList ?? this.monthlyIdList,
      yearlyIdList: yearlyIdList ?? this.yearlyIdList,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (labeledId.present) {
      map['labeled_id'] = Variable<int>(labeledId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (dailyIdList.present) {
      map['daily_id_list'] = Variable<Uint8List>(dailyIdList.value);
    }
    if (weeklyIdList.present) {
      map['weekly_id_list'] = Variable<Uint8List>(weeklyIdList.value);
    }
    if (monthlyIdList.present) {
      map['monthly_id_list'] = Variable<Uint8List>(monthlyIdList.value);
    }
    if (yearlyIdList.present) {
      map['yearly_id_list'] = Variable<Uint8List>(yearlyIdList.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LabeledTasksCompanion(')
          ..write('labeledId: $labeledId, ')
          ..write('label: $label, ')
          ..write('dailyIdList: $dailyIdList, ')
          ..write('weeklyIdList: $weeklyIdList, ')
          ..write('monthlyIdList: $monthlyIdList, ')
          ..write('yearlyIdList: $yearlyIdList')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  $MyDatabaseManager get managers => $MyDatabaseManager(this);
  late final $DayTasksTable dayTasks = $DayTasksTable(this);
  late final $WeeklyTasksTable weeklyTasks = $WeeklyTasksTable(this);
  late final $MonthlyTasksTable monthlyTasks = $MonthlyTasksTable(this);
  late final $YearlyTasksTable yearlyTasks = $YearlyTasksTable(this);
  late final $LabeledTasksTable labeledTasks = $LabeledTasksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dayTasks, weeklyTasks, monthlyTasks, yearlyTasks, labeledTasks];
}

typedef $$DayTasksTableCreateCompanionBuilder = DayTasksCompanion Function({
  required String task,
  required int date,
  Value<int> id,
  Value<bool> isChecked,
  Value<String?> result,
  Value<String?> improvement,
});
typedef $$DayTasksTableUpdateCompanionBuilder = DayTasksCompanion Function({
  Value<String> task,
  Value<int> date,
  Value<int> id,
  Value<bool> isChecked,
  Value<String?> result,
  Value<String?> improvement,
});

class $$DayTasksTableFilterComposer
    extends Composer<_$MyDatabase, $DayTasksTable> {
  $$DayTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get task => $composableBuilder(
      column: $table.task, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => ColumnFilters(column));
}

class $$DayTasksTableOrderingComposer
    extends Composer<_$MyDatabase, $DayTasksTable> {
  $$DayTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get task => $composableBuilder(
      column: $table.task, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => ColumnOrderings(column));
}

class $$DayTasksTableAnnotationComposer
    extends Composer<_$MyDatabase, $DayTasksTable> {
  $$DayTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get task =>
      $composableBuilder(column: $table.task, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isChecked =>
      $composableBuilder(column: $table.isChecked, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => column);
}

class $$DayTasksTableTableManager extends RootTableManager<
    _$MyDatabase,
    $DayTasksTable,
    DayTask,
    $$DayTasksTableFilterComposer,
    $$DayTasksTableOrderingComposer,
    $$DayTasksTableAnnotationComposer,
    $$DayTasksTableCreateCompanionBuilder,
    $$DayTasksTableUpdateCompanionBuilder,
    (DayTask, BaseReferences<_$MyDatabase, $DayTasksTable, DayTask>),
    DayTask,
    PrefetchHooks Function()> {
  $$DayTasksTableTableManager(_$MyDatabase db, $DayTasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> task = const Value.absent(),
            Value<int> date = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> improvement = const Value.absent(),
          }) =>
              DayTasksCompanion(
            task: task,
            date: date,
            id: id,
            isChecked: isChecked,
            result: result,
            improvement: improvement,
          ),
          createCompanionCallback: ({
            required String task,
            required int date,
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> improvement = const Value.absent(),
          }) =>
              DayTasksCompanion.insert(
            task: task,
            date: date,
            id: id,
            isChecked: isChecked,
            result: result,
            improvement: improvement,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DayTasksTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $DayTasksTable,
    DayTask,
    $$DayTasksTableFilterComposer,
    $$DayTasksTableOrderingComposer,
    $$DayTasksTableAnnotationComposer,
    $$DayTasksTableCreateCompanionBuilder,
    $$DayTasksTableUpdateCompanionBuilder,
    (DayTask, BaseReferences<_$MyDatabase, $DayTasksTable, DayTask>),
    DayTask,
    PrefetchHooks Function()>;
typedef $$WeeklyTasksTableCreateCompanionBuilder = WeeklyTasksCompanion
    Function({
  required String task,
  required int firstDate,
  Value<int> id,
  Value<bool> isChecked,
  Value<String?> result,
  Value<String?> improvement,
});
typedef $$WeeklyTasksTableUpdateCompanionBuilder = WeeklyTasksCompanion
    Function({
  Value<String> task,
  Value<int> firstDate,
  Value<int> id,
  Value<bool> isChecked,
  Value<String?> result,
  Value<String?> improvement,
});

class $$WeeklyTasksTableFilterComposer
    extends Composer<_$MyDatabase, $WeeklyTasksTable> {
  $$WeeklyTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get task => $composableBuilder(
      column: $table.task, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get firstDate => $composableBuilder(
      column: $table.firstDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => ColumnFilters(column));
}

class $$WeeklyTasksTableOrderingComposer
    extends Composer<_$MyDatabase, $WeeklyTasksTable> {
  $$WeeklyTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get task => $composableBuilder(
      column: $table.task, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get firstDate => $composableBuilder(
      column: $table.firstDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => ColumnOrderings(column));
}

class $$WeeklyTasksTableAnnotationComposer
    extends Composer<_$MyDatabase, $WeeklyTasksTable> {
  $$WeeklyTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get task =>
      $composableBuilder(column: $table.task, builder: (column) => column);

  GeneratedColumn<int> get firstDate =>
      $composableBuilder(column: $table.firstDate, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isChecked =>
      $composableBuilder(column: $table.isChecked, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => column);
}

class $$WeeklyTasksTableTableManager extends RootTableManager<
    _$MyDatabase,
    $WeeklyTasksTable,
    WeeklyTask,
    $$WeeklyTasksTableFilterComposer,
    $$WeeklyTasksTableOrderingComposer,
    $$WeeklyTasksTableAnnotationComposer,
    $$WeeklyTasksTableCreateCompanionBuilder,
    $$WeeklyTasksTableUpdateCompanionBuilder,
    (WeeklyTask, BaseReferences<_$MyDatabase, $WeeklyTasksTable, WeeklyTask>),
    WeeklyTask,
    PrefetchHooks Function()> {
  $$WeeklyTasksTableTableManager(_$MyDatabase db, $WeeklyTasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeeklyTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeeklyTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeeklyTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> task = const Value.absent(),
            Value<int> firstDate = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> improvement = const Value.absent(),
          }) =>
              WeeklyTasksCompanion(
            task: task,
            firstDate: firstDate,
            id: id,
            isChecked: isChecked,
            result: result,
            improvement: improvement,
          ),
          createCompanionCallback: ({
            required String task,
            required int firstDate,
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> improvement = const Value.absent(),
          }) =>
              WeeklyTasksCompanion.insert(
            task: task,
            firstDate: firstDate,
            id: id,
            isChecked: isChecked,
            result: result,
            improvement: improvement,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WeeklyTasksTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $WeeklyTasksTable,
    WeeklyTask,
    $$WeeklyTasksTableFilterComposer,
    $$WeeklyTasksTableOrderingComposer,
    $$WeeklyTasksTableAnnotationComposer,
    $$WeeklyTasksTableCreateCompanionBuilder,
    $$WeeklyTasksTableUpdateCompanionBuilder,
    (WeeklyTask, BaseReferences<_$MyDatabase, $WeeklyTasksTable, WeeklyTask>),
    WeeklyTask,
    PrefetchHooks Function()>;
typedef $$MonthlyTasksTableCreateCompanionBuilder = MonthlyTasksCompanion
    Function({
  required String task,
  required String month,
  Value<int> id,
  Value<bool> isChecked,
  Value<String?> result,
  Value<String?> improvement,
});
typedef $$MonthlyTasksTableUpdateCompanionBuilder = MonthlyTasksCompanion
    Function({
  Value<String> task,
  Value<String> month,
  Value<int> id,
  Value<bool> isChecked,
  Value<String?> result,
  Value<String?> improvement,
});

class $$MonthlyTasksTableFilterComposer
    extends Composer<_$MyDatabase, $MonthlyTasksTable> {
  $$MonthlyTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get task => $composableBuilder(
      column: $table.task, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => ColumnFilters(column));
}

class $$MonthlyTasksTableOrderingComposer
    extends Composer<_$MyDatabase, $MonthlyTasksTable> {
  $$MonthlyTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get task => $composableBuilder(
      column: $table.task, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => ColumnOrderings(column));
}

class $$MonthlyTasksTableAnnotationComposer
    extends Composer<_$MyDatabase, $MonthlyTasksTable> {
  $$MonthlyTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get task =>
      $composableBuilder(column: $table.task, builder: (column) => column);

  GeneratedColumn<String> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isChecked =>
      $composableBuilder(column: $table.isChecked, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => column);
}

class $$MonthlyTasksTableTableManager extends RootTableManager<
    _$MyDatabase,
    $MonthlyTasksTable,
    MonthlyTask,
    $$MonthlyTasksTableFilterComposer,
    $$MonthlyTasksTableOrderingComposer,
    $$MonthlyTasksTableAnnotationComposer,
    $$MonthlyTasksTableCreateCompanionBuilder,
    $$MonthlyTasksTableUpdateCompanionBuilder,
    (
      MonthlyTask,
      BaseReferences<_$MyDatabase, $MonthlyTasksTable, MonthlyTask>
    ),
    MonthlyTask,
    PrefetchHooks Function()> {
  $$MonthlyTasksTableTableManager(_$MyDatabase db, $MonthlyTasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MonthlyTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MonthlyTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MonthlyTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> task = const Value.absent(),
            Value<String> month = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> improvement = const Value.absent(),
          }) =>
              MonthlyTasksCompanion(
            task: task,
            month: month,
            id: id,
            isChecked: isChecked,
            result: result,
            improvement: improvement,
          ),
          createCompanionCallback: ({
            required String task,
            required String month,
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> improvement = const Value.absent(),
          }) =>
              MonthlyTasksCompanion.insert(
            task: task,
            month: month,
            id: id,
            isChecked: isChecked,
            result: result,
            improvement: improvement,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MonthlyTasksTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $MonthlyTasksTable,
    MonthlyTask,
    $$MonthlyTasksTableFilterComposer,
    $$MonthlyTasksTableOrderingComposer,
    $$MonthlyTasksTableAnnotationComposer,
    $$MonthlyTasksTableCreateCompanionBuilder,
    $$MonthlyTasksTableUpdateCompanionBuilder,
    (
      MonthlyTask,
      BaseReferences<_$MyDatabase, $MonthlyTasksTable, MonthlyTask>
    ),
    MonthlyTask,
    PrefetchHooks Function()>;
typedef $$YearlyTasksTableCreateCompanionBuilder = YearlyTasksCompanion
    Function({
  required String task,
  required String year,
  Value<int> id,
  Value<bool> isChecked,
  Value<String?> result,
  Value<String?> improvement,
});
typedef $$YearlyTasksTableUpdateCompanionBuilder = YearlyTasksCompanion
    Function({
  Value<String> task,
  Value<String> year,
  Value<int> id,
  Value<bool> isChecked,
  Value<String?> result,
  Value<String?> improvement,
});

class $$YearlyTasksTableFilterComposer
    extends Composer<_$MyDatabase, $YearlyTasksTable> {
  $$YearlyTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get task => $composableBuilder(
      column: $table.task, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => ColumnFilters(column));
}

class $$YearlyTasksTableOrderingComposer
    extends Composer<_$MyDatabase, $YearlyTasksTable> {
  $$YearlyTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get task => $composableBuilder(
      column: $table.task, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => ColumnOrderings(column));
}

class $$YearlyTasksTableAnnotationComposer
    extends Composer<_$MyDatabase, $YearlyTasksTable> {
  $$YearlyTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get task =>
      $composableBuilder(column: $table.task, builder: (column) => column);

  GeneratedColumn<String> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isChecked =>
      $composableBuilder(column: $table.isChecked, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get improvement => $composableBuilder(
      column: $table.improvement, builder: (column) => column);
}

class $$YearlyTasksTableTableManager extends RootTableManager<
    _$MyDatabase,
    $YearlyTasksTable,
    YearlyTask,
    $$YearlyTasksTableFilterComposer,
    $$YearlyTasksTableOrderingComposer,
    $$YearlyTasksTableAnnotationComposer,
    $$YearlyTasksTableCreateCompanionBuilder,
    $$YearlyTasksTableUpdateCompanionBuilder,
    (YearlyTask, BaseReferences<_$MyDatabase, $YearlyTasksTable, YearlyTask>),
    YearlyTask,
    PrefetchHooks Function()> {
  $$YearlyTasksTableTableManager(_$MyDatabase db, $YearlyTasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$YearlyTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$YearlyTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$YearlyTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> task = const Value.absent(),
            Value<String> year = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> improvement = const Value.absent(),
          }) =>
              YearlyTasksCompanion(
            task: task,
            year: year,
            id: id,
            isChecked: isChecked,
            result: result,
            improvement: improvement,
          ),
          createCompanionCallback: ({
            required String task,
            required String year,
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> improvement = const Value.absent(),
          }) =>
              YearlyTasksCompanion.insert(
            task: task,
            year: year,
            id: id,
            isChecked: isChecked,
            result: result,
            improvement: improvement,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$YearlyTasksTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $YearlyTasksTable,
    YearlyTask,
    $$YearlyTasksTableFilterComposer,
    $$YearlyTasksTableOrderingComposer,
    $$YearlyTasksTableAnnotationComposer,
    $$YearlyTasksTableCreateCompanionBuilder,
    $$YearlyTasksTableUpdateCompanionBuilder,
    (YearlyTask, BaseReferences<_$MyDatabase, $YearlyTasksTable, YearlyTask>),
    YearlyTask,
    PrefetchHooks Function()>;
typedef $$LabeledTasksTableCreateCompanionBuilder = LabeledTasksCompanion
    Function({
  Value<int> labeledId,
  required String label,
  Value<Uint8List> dailyIdList,
  Value<Uint8List> weeklyIdList,
  Value<Uint8List> monthlyIdList,
  Value<Uint8List> yearlyIdList,
});
typedef $$LabeledTasksTableUpdateCompanionBuilder = LabeledTasksCompanion
    Function({
  Value<int> labeledId,
  Value<String> label,
  Value<Uint8List> dailyIdList,
  Value<Uint8List> weeklyIdList,
  Value<Uint8List> monthlyIdList,
  Value<Uint8List> yearlyIdList,
});

class $$LabeledTasksTableFilterComposer
    extends Composer<_$MyDatabase, $LabeledTasksTable> {
  $$LabeledTasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get labeledId => $composableBuilder(
      column: $table.labeledId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get dailyIdList => $composableBuilder(
      column: $table.dailyIdList, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get weeklyIdList => $composableBuilder(
      column: $table.weeklyIdList, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get monthlyIdList => $composableBuilder(
      column: $table.monthlyIdList, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get yearlyIdList => $composableBuilder(
      column: $table.yearlyIdList, builder: (column) => ColumnFilters(column));
}

class $$LabeledTasksTableOrderingComposer
    extends Composer<_$MyDatabase, $LabeledTasksTable> {
  $$LabeledTasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get labeledId => $composableBuilder(
      column: $table.labeledId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get dailyIdList => $composableBuilder(
      column: $table.dailyIdList, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get weeklyIdList => $composableBuilder(
      column: $table.weeklyIdList,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get monthlyIdList => $composableBuilder(
      column: $table.monthlyIdList,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get yearlyIdList => $composableBuilder(
      column: $table.yearlyIdList,
      builder: (column) => ColumnOrderings(column));
}

class $$LabeledTasksTableAnnotationComposer
    extends Composer<_$MyDatabase, $LabeledTasksTable> {
  $$LabeledTasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get labeledId =>
      $composableBuilder(column: $table.labeledId, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<Uint8List> get dailyIdList => $composableBuilder(
      column: $table.dailyIdList, builder: (column) => column);

  GeneratedColumn<Uint8List> get weeklyIdList => $composableBuilder(
      column: $table.weeklyIdList, builder: (column) => column);

  GeneratedColumn<Uint8List> get monthlyIdList => $composableBuilder(
      column: $table.monthlyIdList, builder: (column) => column);

  GeneratedColumn<Uint8List> get yearlyIdList => $composableBuilder(
      column: $table.yearlyIdList, builder: (column) => column);
}

class $$LabeledTasksTableTableManager extends RootTableManager<
    _$MyDatabase,
    $LabeledTasksTable,
    LabeledTask,
    $$LabeledTasksTableFilterComposer,
    $$LabeledTasksTableOrderingComposer,
    $$LabeledTasksTableAnnotationComposer,
    $$LabeledTasksTableCreateCompanionBuilder,
    $$LabeledTasksTableUpdateCompanionBuilder,
    (
      LabeledTask,
      BaseReferences<_$MyDatabase, $LabeledTasksTable, LabeledTask>
    ),
    LabeledTask,
    PrefetchHooks Function()> {
  $$LabeledTasksTableTableManager(_$MyDatabase db, $LabeledTasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LabeledTasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LabeledTasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LabeledTasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> labeledId = const Value.absent(),
            Value<String> label = const Value.absent(),
            Value<Uint8List> dailyIdList = const Value.absent(),
            Value<Uint8List> weeklyIdList = const Value.absent(),
            Value<Uint8List> monthlyIdList = const Value.absent(),
            Value<Uint8List> yearlyIdList = const Value.absent(),
          }) =>
              LabeledTasksCompanion(
            labeledId: labeledId,
            label: label,
            dailyIdList: dailyIdList,
            weeklyIdList: weeklyIdList,
            monthlyIdList: monthlyIdList,
            yearlyIdList: yearlyIdList,
          ),
          createCompanionCallback: ({
            Value<int> labeledId = const Value.absent(),
            required String label,
            Value<Uint8List> dailyIdList = const Value.absent(),
            Value<Uint8List> weeklyIdList = const Value.absent(),
            Value<Uint8List> monthlyIdList = const Value.absent(),
            Value<Uint8List> yearlyIdList = const Value.absent(),
          }) =>
              LabeledTasksCompanion.insert(
            labeledId: labeledId,
            label: label,
            dailyIdList: dailyIdList,
            weeklyIdList: weeklyIdList,
            monthlyIdList: monthlyIdList,
            yearlyIdList: yearlyIdList,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LabeledTasksTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $LabeledTasksTable,
    LabeledTask,
    $$LabeledTasksTableFilterComposer,
    $$LabeledTasksTableOrderingComposer,
    $$LabeledTasksTableAnnotationComposer,
    $$LabeledTasksTableCreateCompanionBuilder,
    $$LabeledTasksTableUpdateCompanionBuilder,
    (
      LabeledTask,
      BaseReferences<_$MyDatabase, $LabeledTasksTable, LabeledTask>
    ),
    LabeledTask,
    PrefetchHooks Function()>;

class $MyDatabaseManager {
  final _$MyDatabase _db;
  $MyDatabaseManager(this._db);
  $$DayTasksTableTableManager get dayTasks =>
      $$DayTasksTableTableManager(_db, _db.dayTasks);
  $$WeeklyTasksTableTableManager get weeklyTasks =>
      $$WeeklyTasksTableTableManager(_db, _db.weeklyTasks);
  $$MonthlyTasksTableTableManager get monthlyTasks =>
      $$MonthlyTasksTableTableManager(_db, _db.monthlyTasks);
  $$YearlyTasksTableTableManager get yearlyTasks =>
      $$YearlyTasksTableTableManager(_db, _db.yearlyTasks);
  $$LabeledTasksTableTableManager get labeledTasks =>
      $$LabeledTasksTableTableManager(_db, _db.labeledTasks);
}
