// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DayTasksTable extends DayTasks with TableInfo<$DayTasksTable, DayTask> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayTasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
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
  static const VerificationMeta _labelIdMeta =
      const VerificationMeta('labelId');
  @override
  late final GeneratedColumn<int> labelId = GeneratedColumn<int>(
      'label_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(-1));
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
      'result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nextMeta = const VerificationMeta('next');
  @override
  late final GeneratedColumn<String> next = GeneratedColumn<String>(
      'next', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
      'date', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [title, id, isChecked, labelId, result, next, date];
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
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    }
    if (data.containsKey('label_id')) {
      context.handle(_labelIdMeta,
          labelId.isAcceptableOrUnknown(data['label_id']!, _labelIdMeta));
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    }
    if (data.containsKey('next')) {
      context.handle(
          _nextMeta, next.isAcceptableOrUnknown(data['next']!, _nextMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DayTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayTask(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isChecked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_checked'])!,
      labelId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}label_id'])!,
      result: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}result']),
      next: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}next']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $DayTasksTable createAlias(String alias) {
    return $DayTasksTable(attachedDatabase, alias);
  }
}

class DayTask extends DataClass implements Insertable<DayTask> {
  final String title;
  final int id;
  final bool isChecked;
  final int labelId;
  final String? result;
  final String? next;
  final int date;
  const DayTask(
      {required this.title,
      required this.id,
      required this.isChecked,
      required this.labelId,
      this.result,
      this.next,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['id'] = Variable<int>(id);
    map['is_checked'] = Variable<bool>(isChecked);
    map['label_id'] = Variable<int>(labelId);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || next != null) {
      map['next'] = Variable<String>(next);
    }
    map['date'] = Variable<int>(date);
    return map;
  }

  DayTasksCompanion toCompanion(bool nullToAbsent) {
    return DayTasksCompanion(
      title: Value(title),
      id: Value(id),
      isChecked: Value(isChecked),
      labelId: Value(labelId),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      next: next == null && nullToAbsent ? const Value.absent() : Value(next),
      date: Value(date),
    );
  }

  factory DayTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayTask(
      title: serializer.fromJson<String>(json['title']),
      id: serializer.fromJson<int>(json['id']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
      labelId: serializer.fromJson<int>(json['labelId']),
      result: serializer.fromJson<String?>(json['result']),
      next: serializer.fromJson<String?>(json['next']),
      date: serializer.fromJson<int>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'id': serializer.toJson<int>(id),
      'isChecked': serializer.toJson<bool>(isChecked),
      'labelId': serializer.toJson<int>(labelId),
      'result': serializer.toJson<String?>(result),
      'next': serializer.toJson<String?>(next),
      'date': serializer.toJson<int>(date),
    };
  }

  DayTask copyWith(
          {String? title,
          int? id,
          bool? isChecked,
          int? labelId,
          Value<String?> result = const Value.absent(),
          Value<String?> next = const Value.absent(),
          int? date}) =>
      DayTask(
        title: title ?? this.title,
        id: id ?? this.id,
        isChecked: isChecked ?? this.isChecked,
        labelId: labelId ?? this.labelId,
        result: result.present ? result.value : this.result,
        next: next.present ? next.value : this.next,
        date: date ?? this.date,
      );
  DayTask copyWithCompanion(DayTasksCompanion data) {
    return DayTask(
      title: data.title.present ? data.title.value : this.title,
      id: data.id.present ? data.id.value : this.id,
      isChecked: data.isChecked.present ? data.isChecked.value : this.isChecked,
      labelId: data.labelId.present ? data.labelId.value : this.labelId,
      result: data.result.present ? data.result.value : this.result,
      next: data.next.present ? data.next.value : this.next,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayTask(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('labelId: $labelId, ')
          ..write('result: $result, ')
          ..write('next: $next, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(title, id, isChecked, labelId, result, next, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayTask &&
          other.title == this.title &&
          other.id == this.id &&
          other.isChecked == this.isChecked &&
          other.labelId == this.labelId &&
          other.result == this.result &&
          other.next == this.next &&
          other.date == this.date);
}

class DayTasksCompanion extends UpdateCompanion<DayTask> {
  final Value<String> title;
  final Value<int> id;
  final Value<bool> isChecked;
  final Value<int> labelId;
  final Value<String?> result;
  final Value<String?> next;
  final Value<int> date;
  const DayTasksCompanion({
    this.title = const Value.absent(),
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.labelId = const Value.absent(),
    this.result = const Value.absent(),
    this.next = const Value.absent(),
    this.date = const Value.absent(),
  });
  DayTasksCompanion.insert({
    required String title,
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.labelId = const Value.absent(),
    this.result = const Value.absent(),
    this.next = const Value.absent(),
    required int date,
  })  : title = Value(title),
        date = Value(date);
  static Insertable<DayTask> custom({
    Expression<String>? title,
    Expression<int>? id,
    Expression<bool>? isChecked,
    Expression<int>? labelId,
    Expression<String>? result,
    Expression<String>? next,
    Expression<int>? date,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (id != null) 'id': id,
      if (isChecked != null) 'is_checked': isChecked,
      if (labelId != null) 'label_id': labelId,
      if (result != null) 'result': result,
      if (next != null) 'next': next,
      if (date != null) 'date': date,
    });
  }

  DayTasksCompanion copyWith(
      {Value<String>? title,
      Value<int>? id,
      Value<bool>? isChecked,
      Value<int>? labelId,
      Value<String?>? result,
      Value<String?>? next,
      Value<int>? date}) {
    return DayTasksCompanion(
      title: title ?? this.title,
      id: id ?? this.id,
      isChecked: isChecked ?? this.isChecked,
      labelId: labelId ?? this.labelId,
      result: result ?? this.result,
      next: next ?? this.next,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    if (labelId.present) {
      map['label_id'] = Variable<int>(labelId.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (next.present) {
      map['next'] = Variable<String>(next.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayTasksCompanion(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('labelId: $labelId, ')
          ..write('result: $result, ')
          ..write('next: $next, ')
          ..write('date: $date')
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
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
  static const VerificationMeta _labelIdMeta =
      const VerificationMeta('labelId');
  @override
  late final GeneratedColumn<int> labelId = GeneratedColumn<int>(
      'label_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(-1));
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
      'result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nextMeta = const VerificationMeta('next');
  @override
  late final GeneratedColumn<String> next = GeneratedColumn<String>(
      'next', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _firstDateMeta =
      const VerificationMeta('firstDate');
  @override
  late final GeneratedColumn<int> firstDate = GeneratedColumn<int>(
      'first_date', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [title, id, isChecked, labelId, result, next, firstDate];
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
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    }
    if (data.containsKey('label_id')) {
      context.handle(_labelIdMeta,
          labelId.isAcceptableOrUnknown(data['label_id']!, _labelIdMeta));
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    }
    if (data.containsKey('next')) {
      context.handle(
          _nextMeta, next.isAcceptableOrUnknown(data['next']!, _nextMeta));
    }
    if (data.containsKey('first_date')) {
      context.handle(_firstDateMeta,
          firstDate.isAcceptableOrUnknown(data['first_date']!, _firstDateMeta));
    } else if (isInserting) {
      context.missing(_firstDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeeklyTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeeklyTask(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isChecked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_checked'])!,
      labelId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}label_id'])!,
      result: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}result']),
      next: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}next']),
      firstDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}first_date'])!,
    );
  }

  @override
  $WeeklyTasksTable createAlias(String alias) {
    return $WeeklyTasksTable(attachedDatabase, alias);
  }
}

class WeeklyTask extends DataClass implements Insertable<WeeklyTask> {
  final String title;
  final int id;
  final bool isChecked;
  final int labelId;
  final String? result;
  final String? next;
  final int firstDate;
  const WeeklyTask(
      {required this.title,
      required this.id,
      required this.isChecked,
      required this.labelId,
      this.result,
      this.next,
      required this.firstDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['id'] = Variable<int>(id);
    map['is_checked'] = Variable<bool>(isChecked);
    map['label_id'] = Variable<int>(labelId);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || next != null) {
      map['next'] = Variable<String>(next);
    }
    map['first_date'] = Variable<int>(firstDate);
    return map;
  }

  WeeklyTasksCompanion toCompanion(bool nullToAbsent) {
    return WeeklyTasksCompanion(
      title: Value(title),
      id: Value(id),
      isChecked: Value(isChecked),
      labelId: Value(labelId),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      next: next == null && nullToAbsent ? const Value.absent() : Value(next),
      firstDate: Value(firstDate),
    );
  }

  factory WeeklyTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeeklyTask(
      title: serializer.fromJson<String>(json['title']),
      id: serializer.fromJson<int>(json['id']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
      labelId: serializer.fromJson<int>(json['labelId']),
      result: serializer.fromJson<String?>(json['result']),
      next: serializer.fromJson<String?>(json['next']),
      firstDate: serializer.fromJson<int>(json['firstDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'id': serializer.toJson<int>(id),
      'isChecked': serializer.toJson<bool>(isChecked),
      'labelId': serializer.toJson<int>(labelId),
      'result': serializer.toJson<String?>(result),
      'next': serializer.toJson<String?>(next),
      'firstDate': serializer.toJson<int>(firstDate),
    };
  }

  WeeklyTask copyWith(
          {String? title,
          int? id,
          bool? isChecked,
          int? labelId,
          Value<String?> result = const Value.absent(),
          Value<String?> next = const Value.absent(),
          int? firstDate}) =>
      WeeklyTask(
        title: title ?? this.title,
        id: id ?? this.id,
        isChecked: isChecked ?? this.isChecked,
        labelId: labelId ?? this.labelId,
        result: result.present ? result.value : this.result,
        next: next.present ? next.value : this.next,
        firstDate: firstDate ?? this.firstDate,
      );
  WeeklyTask copyWithCompanion(WeeklyTasksCompanion data) {
    return WeeklyTask(
      title: data.title.present ? data.title.value : this.title,
      id: data.id.present ? data.id.value : this.id,
      isChecked: data.isChecked.present ? data.isChecked.value : this.isChecked,
      labelId: data.labelId.present ? data.labelId.value : this.labelId,
      result: data.result.present ? data.result.value : this.result,
      next: data.next.present ? data.next.value : this.next,
      firstDate: data.firstDate.present ? data.firstDate.value : this.firstDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyTask(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('labelId: $labelId, ')
          ..write('result: $result, ')
          ..write('next: $next, ')
          ..write('firstDate: $firstDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(title, id, isChecked, labelId, result, next, firstDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeeklyTask &&
          other.title == this.title &&
          other.id == this.id &&
          other.isChecked == this.isChecked &&
          other.labelId == this.labelId &&
          other.result == this.result &&
          other.next == this.next &&
          other.firstDate == this.firstDate);
}

class WeeklyTasksCompanion extends UpdateCompanion<WeeklyTask> {
  final Value<String> title;
  final Value<int> id;
  final Value<bool> isChecked;
  final Value<int> labelId;
  final Value<String?> result;
  final Value<String?> next;
  final Value<int> firstDate;
  const WeeklyTasksCompanion({
    this.title = const Value.absent(),
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.labelId = const Value.absent(),
    this.result = const Value.absent(),
    this.next = const Value.absent(),
    this.firstDate = const Value.absent(),
  });
  WeeklyTasksCompanion.insert({
    required String title,
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.labelId = const Value.absent(),
    this.result = const Value.absent(),
    this.next = const Value.absent(),
    required int firstDate,
  })  : title = Value(title),
        firstDate = Value(firstDate);
  static Insertable<WeeklyTask> custom({
    Expression<String>? title,
    Expression<int>? id,
    Expression<bool>? isChecked,
    Expression<int>? labelId,
    Expression<String>? result,
    Expression<String>? next,
    Expression<int>? firstDate,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (id != null) 'id': id,
      if (isChecked != null) 'is_checked': isChecked,
      if (labelId != null) 'label_id': labelId,
      if (result != null) 'result': result,
      if (next != null) 'next': next,
      if (firstDate != null) 'first_date': firstDate,
    });
  }

  WeeklyTasksCompanion copyWith(
      {Value<String>? title,
      Value<int>? id,
      Value<bool>? isChecked,
      Value<int>? labelId,
      Value<String?>? result,
      Value<String?>? next,
      Value<int>? firstDate}) {
    return WeeklyTasksCompanion(
      title: title ?? this.title,
      id: id ?? this.id,
      isChecked: isChecked ?? this.isChecked,
      labelId: labelId ?? this.labelId,
      result: result ?? this.result,
      next: next ?? this.next,
      firstDate: firstDate ?? this.firstDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    if (labelId.present) {
      map['label_id'] = Variable<int>(labelId.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (next.present) {
      map['next'] = Variable<String>(next.value);
    }
    if (firstDate.present) {
      map['first_date'] = Variable<int>(firstDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeeklyTasksCompanion(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('labelId: $labelId, ')
          ..write('result: $result, ')
          ..write('next: $next, ')
          ..write('firstDate: $firstDate')
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
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
  static const VerificationMeta _labelIdMeta =
      const VerificationMeta('labelId');
  @override
  late final GeneratedColumn<int> labelId = GeneratedColumn<int>(
      'label_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(-1));
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
      'result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nextMeta = const VerificationMeta('next');
  @override
  late final GeneratedColumn<String> next = GeneratedColumn<String>(
      'next', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<int> month = GeneratedColumn<int>(
      'month', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [title, id, isChecked, labelId, result, next, month];
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
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    }
    if (data.containsKey('label_id')) {
      context.handle(_labelIdMeta,
          labelId.isAcceptableOrUnknown(data['label_id']!, _labelIdMeta));
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    }
    if (data.containsKey('next')) {
      context.handle(
          _nextMeta, next.isAcceptableOrUnknown(data['next']!, _nextMeta));
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MonthlyTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MonthlyTask(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isChecked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_checked'])!,
      labelId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}label_id'])!,
      result: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}result']),
      next: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}next']),
      month: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}month'])!,
    );
  }

  @override
  $MonthlyTasksTable createAlias(String alias) {
    return $MonthlyTasksTable(attachedDatabase, alias);
  }
}

class MonthlyTask extends DataClass implements Insertable<MonthlyTask> {
  final String title;
  final int id;
  final bool isChecked;
  final int labelId;
  final String? result;
  final String? next;
  final int month;
  const MonthlyTask(
      {required this.title,
      required this.id,
      required this.isChecked,
      required this.labelId,
      this.result,
      this.next,
      required this.month});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['id'] = Variable<int>(id);
    map['is_checked'] = Variable<bool>(isChecked);
    map['label_id'] = Variable<int>(labelId);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || next != null) {
      map['next'] = Variable<String>(next);
    }
    map['month'] = Variable<int>(month);
    return map;
  }

  MonthlyTasksCompanion toCompanion(bool nullToAbsent) {
    return MonthlyTasksCompanion(
      title: Value(title),
      id: Value(id),
      isChecked: Value(isChecked),
      labelId: Value(labelId),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      next: next == null && nullToAbsent ? const Value.absent() : Value(next),
      month: Value(month),
    );
  }

  factory MonthlyTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MonthlyTask(
      title: serializer.fromJson<String>(json['title']),
      id: serializer.fromJson<int>(json['id']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
      labelId: serializer.fromJson<int>(json['labelId']),
      result: serializer.fromJson<String?>(json['result']),
      next: serializer.fromJson<String?>(json['next']),
      month: serializer.fromJson<int>(json['month']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'id': serializer.toJson<int>(id),
      'isChecked': serializer.toJson<bool>(isChecked),
      'labelId': serializer.toJson<int>(labelId),
      'result': serializer.toJson<String?>(result),
      'next': serializer.toJson<String?>(next),
      'month': serializer.toJson<int>(month),
    };
  }

  MonthlyTask copyWith(
          {String? title,
          int? id,
          bool? isChecked,
          int? labelId,
          Value<String?> result = const Value.absent(),
          Value<String?> next = const Value.absent(),
          int? month}) =>
      MonthlyTask(
        title: title ?? this.title,
        id: id ?? this.id,
        isChecked: isChecked ?? this.isChecked,
        labelId: labelId ?? this.labelId,
        result: result.present ? result.value : this.result,
        next: next.present ? next.value : this.next,
        month: month ?? this.month,
      );
  MonthlyTask copyWithCompanion(MonthlyTasksCompanion data) {
    return MonthlyTask(
      title: data.title.present ? data.title.value : this.title,
      id: data.id.present ? data.id.value : this.id,
      isChecked: data.isChecked.present ? data.isChecked.value : this.isChecked,
      labelId: data.labelId.present ? data.labelId.value : this.labelId,
      result: data.result.present ? data.result.value : this.result,
      next: data.next.present ? data.next.value : this.next,
      month: data.month.present ? data.month.value : this.month,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyTask(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('labelId: $labelId, ')
          ..write('result: $result, ')
          ..write('next: $next, ')
          ..write('month: $month')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(title, id, isChecked, labelId, result, next, month);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MonthlyTask &&
          other.title == this.title &&
          other.id == this.id &&
          other.isChecked == this.isChecked &&
          other.labelId == this.labelId &&
          other.result == this.result &&
          other.next == this.next &&
          other.month == this.month);
}

class MonthlyTasksCompanion extends UpdateCompanion<MonthlyTask> {
  final Value<String> title;
  final Value<int> id;
  final Value<bool> isChecked;
  final Value<int> labelId;
  final Value<String?> result;
  final Value<String?> next;
  final Value<int> month;
  const MonthlyTasksCompanion({
    this.title = const Value.absent(),
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.labelId = const Value.absent(),
    this.result = const Value.absent(),
    this.next = const Value.absent(),
    this.month = const Value.absent(),
  });
  MonthlyTasksCompanion.insert({
    required String title,
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.labelId = const Value.absent(),
    this.result = const Value.absent(),
    this.next = const Value.absent(),
    required int month,
  })  : title = Value(title),
        month = Value(month);
  static Insertable<MonthlyTask> custom({
    Expression<String>? title,
    Expression<int>? id,
    Expression<bool>? isChecked,
    Expression<int>? labelId,
    Expression<String>? result,
    Expression<String>? next,
    Expression<int>? month,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (id != null) 'id': id,
      if (isChecked != null) 'is_checked': isChecked,
      if (labelId != null) 'label_id': labelId,
      if (result != null) 'result': result,
      if (next != null) 'next': next,
      if (month != null) 'month': month,
    });
  }

  MonthlyTasksCompanion copyWith(
      {Value<String>? title,
      Value<int>? id,
      Value<bool>? isChecked,
      Value<int>? labelId,
      Value<String?>? result,
      Value<String?>? next,
      Value<int>? month}) {
    return MonthlyTasksCompanion(
      title: title ?? this.title,
      id: id ?? this.id,
      isChecked: isChecked ?? this.isChecked,
      labelId: labelId ?? this.labelId,
      result: result ?? this.result,
      next: next ?? this.next,
      month: month ?? this.month,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    if (labelId.present) {
      map['label_id'] = Variable<int>(labelId.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (next.present) {
      map['next'] = Variable<String>(next.value);
    }
    if (month.present) {
      map['month'] = Variable<int>(month.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyTasksCompanion(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('labelId: $labelId, ')
          ..write('result: $result, ')
          ..write('next: $next, ')
          ..write('month: $month')
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
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
  static const VerificationMeta _labelIdMeta =
      const VerificationMeta('labelId');
  @override
  late final GeneratedColumn<int> labelId = GeneratedColumn<int>(
      'label_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(-1));
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
      'result', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nextMeta = const VerificationMeta('next');
  @override
  late final GeneratedColumn<String> next = GeneratedColumn<String>(
      'next', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [title, id, isChecked, labelId, result, next, year];
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
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    }
    if (data.containsKey('label_id')) {
      context.handle(_labelIdMeta,
          labelId.isAcceptableOrUnknown(data['label_id']!, _labelIdMeta));
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result']!, _resultMeta));
    }
    if (data.containsKey('next')) {
      context.handle(
          _nextMeta, next.isAcceptableOrUnknown(data['next']!, _nextMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  YearlyTask map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return YearlyTask(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isChecked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_checked'])!,
      labelId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}label_id'])!,
      result: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}result']),
      next: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}next']),
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year'])!,
    );
  }

  @override
  $YearlyTasksTable createAlias(String alias) {
    return $YearlyTasksTable(attachedDatabase, alias);
  }
}

class YearlyTask extends DataClass implements Insertable<YearlyTask> {
  final String title;
  final int id;
  final bool isChecked;
  final int labelId;
  final String? result;
  final String? next;
  final int year;
  const YearlyTask(
      {required this.title,
      required this.id,
      required this.isChecked,
      required this.labelId,
      this.result,
      this.next,
      required this.year});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['title'] = Variable<String>(title);
    map['id'] = Variable<int>(id);
    map['is_checked'] = Variable<bool>(isChecked);
    map['label_id'] = Variable<int>(labelId);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || next != null) {
      map['next'] = Variable<String>(next);
    }
    map['year'] = Variable<int>(year);
    return map;
  }

  YearlyTasksCompanion toCompanion(bool nullToAbsent) {
    return YearlyTasksCompanion(
      title: Value(title),
      id: Value(id),
      isChecked: Value(isChecked),
      labelId: Value(labelId),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      next: next == null && nullToAbsent ? const Value.absent() : Value(next),
      year: Value(year),
    );
  }

  factory YearlyTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return YearlyTask(
      title: serializer.fromJson<String>(json['title']),
      id: serializer.fromJson<int>(json['id']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
      labelId: serializer.fromJson<int>(json['labelId']),
      result: serializer.fromJson<String?>(json['result']),
      next: serializer.fromJson<String?>(json['next']),
      year: serializer.fromJson<int>(json['year']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'id': serializer.toJson<int>(id),
      'isChecked': serializer.toJson<bool>(isChecked),
      'labelId': serializer.toJson<int>(labelId),
      'result': serializer.toJson<String?>(result),
      'next': serializer.toJson<String?>(next),
      'year': serializer.toJson<int>(year),
    };
  }

  YearlyTask copyWith(
          {String? title,
          int? id,
          bool? isChecked,
          int? labelId,
          Value<String?> result = const Value.absent(),
          Value<String?> next = const Value.absent(),
          int? year}) =>
      YearlyTask(
        title: title ?? this.title,
        id: id ?? this.id,
        isChecked: isChecked ?? this.isChecked,
        labelId: labelId ?? this.labelId,
        result: result.present ? result.value : this.result,
        next: next.present ? next.value : this.next,
        year: year ?? this.year,
      );
  YearlyTask copyWithCompanion(YearlyTasksCompanion data) {
    return YearlyTask(
      title: data.title.present ? data.title.value : this.title,
      id: data.id.present ? data.id.value : this.id,
      isChecked: data.isChecked.present ? data.isChecked.value : this.isChecked,
      labelId: data.labelId.present ? data.labelId.value : this.labelId,
      result: data.result.present ? data.result.value : this.result,
      next: data.next.present ? data.next.value : this.next,
      year: data.year.present ? data.year.value : this.year,
    );
  }

  @override
  String toString() {
    return (StringBuffer('YearlyTask(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('labelId: $labelId, ')
          ..write('result: $result, ')
          ..write('next: $next, ')
          ..write('year: $year')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(title, id, isChecked, labelId, result, next, year);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is YearlyTask &&
          other.title == this.title &&
          other.id == this.id &&
          other.isChecked == this.isChecked &&
          other.labelId == this.labelId &&
          other.result == this.result &&
          other.next == this.next &&
          other.year == this.year);
}

class YearlyTasksCompanion extends UpdateCompanion<YearlyTask> {
  final Value<String> title;
  final Value<int> id;
  final Value<bool> isChecked;
  final Value<int> labelId;
  final Value<String?> result;
  final Value<String?> next;
  final Value<int> year;
  const YearlyTasksCompanion({
    this.title = const Value.absent(),
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.labelId = const Value.absent(),
    this.result = const Value.absent(),
    this.next = const Value.absent(),
    this.year = const Value.absent(),
  });
  YearlyTasksCompanion.insert({
    required String title,
    this.id = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.labelId = const Value.absent(),
    this.result = const Value.absent(),
    this.next = const Value.absent(),
    required int year,
  })  : title = Value(title),
        year = Value(year);
  static Insertable<YearlyTask> custom({
    Expression<String>? title,
    Expression<int>? id,
    Expression<bool>? isChecked,
    Expression<int>? labelId,
    Expression<String>? result,
    Expression<String>? next,
    Expression<int>? year,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (id != null) 'id': id,
      if (isChecked != null) 'is_checked': isChecked,
      if (labelId != null) 'label_id': labelId,
      if (result != null) 'result': result,
      if (next != null) 'next': next,
      if (year != null) 'year': year,
    });
  }

  YearlyTasksCompanion copyWith(
      {Value<String>? title,
      Value<int>? id,
      Value<bool>? isChecked,
      Value<int>? labelId,
      Value<String?>? result,
      Value<String?>? next,
      Value<int>? year}) {
    return YearlyTasksCompanion(
      title: title ?? this.title,
      id: id ?? this.id,
      isChecked: isChecked ?? this.isChecked,
      labelId: labelId ?? this.labelId,
      result: result ?? this.result,
      next: next ?? this.next,
      year: year ?? this.year,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    if (labelId.present) {
      map['label_id'] = Variable<int>(labelId.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (next.present) {
      map['next'] = Variable<String>(next.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('YearlyTasksCompanion(')
          ..write('title: $title, ')
          ..write('id: $id, ')
          ..write('isChecked: $isChecked, ')
          ..write('labelId: $labelId, ')
          ..write('result: $result, ')
          ..write('next: $next, ')
          ..write('year: $year')
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

class $PageSettingsTable extends PageSettings
    with TableInfo<$PageSettingsTable, PageSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PageSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pageIdMeta = const VerificationMeta('pageId');
  @override
  late final GeneratedColumn<int> pageId = GeneratedColumn<int>(
      'page_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _primaryAutoSavesMeta =
      const VerificationMeta('primaryAutoSaves');
  @override
  late final GeneratedColumn<bool> primaryAutoSaves = GeneratedColumn<bool>(
      'primary_auto_saves', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("primary_auto_saves" IN (0, 1))'),
      defaultValue: Constant(true));
  static const VerificationMeta _reviewAutoSavesMeta =
      const VerificationMeta('reviewAutoSaves');
  @override
  late final GeneratedColumn<bool> reviewAutoSaves = GeneratedColumn<bool>(
      'review_auto_saves', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("review_auto_saves" IN (0, 1))'),
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [pageId, primaryAutoSaves, reviewAutoSaves];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'page_settings';
  @override
  VerificationContext validateIntegrity(Insertable<PageSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page_id')) {
      context.handle(_pageIdMeta,
          pageId.isAcceptableOrUnknown(data['page_id']!, _pageIdMeta));
    } else if (isInserting) {
      context.missing(_pageIdMeta);
    }
    if (data.containsKey('primary_auto_saves')) {
      context.handle(
          _primaryAutoSavesMeta,
          primaryAutoSaves.isAcceptableOrUnknown(
              data['primary_auto_saves']!, _primaryAutoSavesMeta));
    }
    if (data.containsKey('review_auto_saves')) {
      context.handle(
          _reviewAutoSavesMeta,
          reviewAutoSaves.isAcceptableOrUnknown(
              data['review_auto_saves']!, _reviewAutoSavesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PageSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PageSetting(
      pageId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}page_id'])!,
      primaryAutoSaves: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}primary_auto_saves'])!,
      reviewAutoSaves: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}review_auto_saves'])!,
    );
  }

  @override
  $PageSettingsTable createAlias(String alias) {
    return $PageSettingsTable(attachedDatabase, alias);
  }
}

class PageSetting extends DataClass implements Insertable<PageSetting> {
  /// 各ページの識別子
  final int pageId;

  /// 対象ページの自動保存オンオフ
  final bool primaryAutoSaves;

  /// 対象ページに対応するレビュー画面の自動保存オンオフ
  final bool reviewAutoSaves;
  const PageSetting(
      {required this.pageId,
      required this.primaryAutoSaves,
      required this.reviewAutoSaves});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page_id'] = Variable<int>(pageId);
    map['primary_auto_saves'] = Variable<bool>(primaryAutoSaves);
    map['review_auto_saves'] = Variable<bool>(reviewAutoSaves);
    return map;
  }

  PageSettingsCompanion toCompanion(bool nullToAbsent) {
    return PageSettingsCompanion(
      pageId: Value(pageId),
      primaryAutoSaves: Value(primaryAutoSaves),
      reviewAutoSaves: Value(reviewAutoSaves),
    );
  }

  factory PageSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PageSetting(
      pageId: serializer.fromJson<int>(json['pageId']),
      primaryAutoSaves: serializer.fromJson<bool>(json['primaryAutoSaves']),
      reviewAutoSaves: serializer.fromJson<bool>(json['reviewAutoSaves']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pageId': serializer.toJson<int>(pageId),
      'primaryAutoSaves': serializer.toJson<bool>(primaryAutoSaves),
      'reviewAutoSaves': serializer.toJson<bool>(reviewAutoSaves),
    };
  }

  PageSetting copyWith(
          {int? pageId, bool? primaryAutoSaves, bool? reviewAutoSaves}) =>
      PageSetting(
        pageId: pageId ?? this.pageId,
        primaryAutoSaves: primaryAutoSaves ?? this.primaryAutoSaves,
        reviewAutoSaves: reviewAutoSaves ?? this.reviewAutoSaves,
      );
  PageSetting copyWithCompanion(PageSettingsCompanion data) {
    return PageSetting(
      pageId: data.pageId.present ? data.pageId.value : this.pageId,
      primaryAutoSaves: data.primaryAutoSaves.present
          ? data.primaryAutoSaves.value
          : this.primaryAutoSaves,
      reviewAutoSaves: data.reviewAutoSaves.present
          ? data.reviewAutoSaves.value
          : this.reviewAutoSaves,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PageSetting(')
          ..write('pageId: $pageId, ')
          ..write('primaryAutoSaves: $primaryAutoSaves, ')
          ..write('reviewAutoSaves: $reviewAutoSaves')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pageId, primaryAutoSaves, reviewAutoSaves);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PageSetting &&
          other.pageId == this.pageId &&
          other.primaryAutoSaves == this.primaryAutoSaves &&
          other.reviewAutoSaves == this.reviewAutoSaves);
}

class PageSettingsCompanion extends UpdateCompanion<PageSetting> {
  final Value<int> pageId;
  final Value<bool> primaryAutoSaves;
  final Value<bool> reviewAutoSaves;
  final Value<int> rowid;
  const PageSettingsCompanion({
    this.pageId = const Value.absent(),
    this.primaryAutoSaves = const Value.absent(),
    this.reviewAutoSaves = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PageSettingsCompanion.insert({
    required int pageId,
    this.primaryAutoSaves = const Value.absent(),
    this.reviewAutoSaves = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : pageId = Value(pageId);
  static Insertable<PageSetting> custom({
    Expression<int>? pageId,
    Expression<bool>? primaryAutoSaves,
    Expression<bool>? reviewAutoSaves,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pageId != null) 'page_id': pageId,
      if (primaryAutoSaves != null) 'primary_auto_saves': primaryAutoSaves,
      if (reviewAutoSaves != null) 'review_auto_saves': reviewAutoSaves,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PageSettingsCompanion copyWith(
      {Value<int>? pageId,
      Value<bool>? primaryAutoSaves,
      Value<bool>? reviewAutoSaves,
      Value<int>? rowid}) {
    return PageSettingsCompanion(
      pageId: pageId ?? this.pageId,
      primaryAutoSaves: primaryAutoSaves ?? this.primaryAutoSaves,
      reviewAutoSaves: reviewAutoSaves ?? this.reviewAutoSaves,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pageId.present) {
      map['page_id'] = Variable<int>(pageId.value);
    }
    if (primaryAutoSaves.present) {
      map['primary_auto_saves'] = Variable<bool>(primaryAutoSaves.value);
    }
    if (reviewAutoSaves.present) {
      map['review_auto_saves'] = Variable<bool>(reviewAutoSaves.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PageSettingsCompanion(')
          ..write('pageId: $pageId, ')
          ..write('primaryAutoSaves: $primaryAutoSaves, ')
          ..write('reviewAutoSaves: $reviewAutoSaves, ')
          ..write('rowid: $rowid')
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
  late final $PageSettingsTable pageSettings = $PageSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        dayTasks,
        weeklyTasks,
        monthlyTasks,
        yearlyTasks,
        labeledTasks,
        pageSettings
      ];
}

typedef $$DayTasksTableCreateCompanionBuilder = DayTasksCompanion Function({
  required String title,
  Value<int> id,
  Value<bool> isChecked,
  Value<int> labelId,
  Value<String?> result,
  Value<String?> next,
  required int date,
});
typedef $$DayTasksTableUpdateCompanionBuilder = DayTasksCompanion Function({
  Value<String> title,
  Value<int> id,
  Value<bool> isChecked,
  Value<int> labelId,
  Value<String?> result,
  Value<String?> next,
  Value<int> date,
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
  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get labelId => $composableBuilder(
      column: $table.labelId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get next => $composableBuilder(
      column: $table.next, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get labelId => $composableBuilder(
      column: $table.labelId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get next => $composableBuilder(
      column: $table.next, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isChecked =>
      $composableBuilder(column: $table.isChecked, builder: (column) => column);

  GeneratedColumn<int> get labelId =>
      $composableBuilder(column: $table.labelId, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get next =>
      $composableBuilder(column: $table.next, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
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
            Value<String> title = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<int> labelId = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> next = const Value.absent(),
            Value<int> date = const Value.absent(),
          }) =>
              DayTasksCompanion(
            title: title,
            id: id,
            isChecked: isChecked,
            labelId: labelId,
            result: result,
            next: next,
            date: date,
          ),
          createCompanionCallback: ({
            required String title,
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<int> labelId = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> next = const Value.absent(),
            required int date,
          }) =>
              DayTasksCompanion.insert(
            title: title,
            id: id,
            isChecked: isChecked,
            labelId: labelId,
            result: result,
            next: next,
            date: date,
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
  required String title,
  Value<int> id,
  Value<bool> isChecked,
  Value<int> labelId,
  Value<String?> result,
  Value<String?> next,
  required int firstDate,
});
typedef $$WeeklyTasksTableUpdateCompanionBuilder = WeeklyTasksCompanion
    Function({
  Value<String> title,
  Value<int> id,
  Value<bool> isChecked,
  Value<int> labelId,
  Value<String?> result,
  Value<String?> next,
  Value<int> firstDate,
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
  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get labelId => $composableBuilder(
      column: $table.labelId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get next => $composableBuilder(
      column: $table.next, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get firstDate => $composableBuilder(
      column: $table.firstDate, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get labelId => $composableBuilder(
      column: $table.labelId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get next => $composableBuilder(
      column: $table.next, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get firstDate => $composableBuilder(
      column: $table.firstDate, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isChecked =>
      $composableBuilder(column: $table.isChecked, builder: (column) => column);

  GeneratedColumn<int> get labelId =>
      $composableBuilder(column: $table.labelId, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get next =>
      $composableBuilder(column: $table.next, builder: (column) => column);

  GeneratedColumn<int> get firstDate =>
      $composableBuilder(column: $table.firstDate, builder: (column) => column);
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
            Value<String> title = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<int> labelId = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> next = const Value.absent(),
            Value<int> firstDate = const Value.absent(),
          }) =>
              WeeklyTasksCompanion(
            title: title,
            id: id,
            isChecked: isChecked,
            labelId: labelId,
            result: result,
            next: next,
            firstDate: firstDate,
          ),
          createCompanionCallback: ({
            required String title,
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<int> labelId = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> next = const Value.absent(),
            required int firstDate,
          }) =>
              WeeklyTasksCompanion.insert(
            title: title,
            id: id,
            isChecked: isChecked,
            labelId: labelId,
            result: result,
            next: next,
            firstDate: firstDate,
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
  required String title,
  Value<int> id,
  Value<bool> isChecked,
  Value<int> labelId,
  Value<String?> result,
  Value<String?> next,
  required int month,
});
typedef $$MonthlyTasksTableUpdateCompanionBuilder = MonthlyTasksCompanion
    Function({
  Value<String> title,
  Value<int> id,
  Value<bool> isChecked,
  Value<int> labelId,
  Value<String?> result,
  Value<String?> next,
  Value<int> month,
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
  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get labelId => $composableBuilder(
      column: $table.labelId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get next => $composableBuilder(
      column: $table.next, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get labelId => $composableBuilder(
      column: $table.labelId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get next => $composableBuilder(
      column: $table.next, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isChecked =>
      $composableBuilder(column: $table.isChecked, builder: (column) => column);

  GeneratedColumn<int> get labelId =>
      $composableBuilder(column: $table.labelId, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get next =>
      $composableBuilder(column: $table.next, builder: (column) => column);

  GeneratedColumn<int> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);
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
            Value<String> title = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<int> labelId = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> next = const Value.absent(),
            Value<int> month = const Value.absent(),
          }) =>
              MonthlyTasksCompanion(
            title: title,
            id: id,
            isChecked: isChecked,
            labelId: labelId,
            result: result,
            next: next,
            month: month,
          ),
          createCompanionCallback: ({
            required String title,
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<int> labelId = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> next = const Value.absent(),
            required int month,
          }) =>
              MonthlyTasksCompanion.insert(
            title: title,
            id: id,
            isChecked: isChecked,
            labelId: labelId,
            result: result,
            next: next,
            month: month,
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
  required String title,
  Value<int> id,
  Value<bool> isChecked,
  Value<int> labelId,
  Value<String?> result,
  Value<String?> next,
  required int year,
});
typedef $$YearlyTasksTableUpdateCompanionBuilder = YearlyTasksCompanion
    Function({
  Value<String> title,
  Value<int> id,
  Value<bool> isChecked,
  Value<int> labelId,
  Value<String?> result,
  Value<String?> next,
  Value<int> year,
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
  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get labelId => $composableBuilder(
      column: $table.labelId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get next => $composableBuilder(
      column: $table.next, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isChecked => $composableBuilder(
      column: $table.isChecked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get labelId => $composableBuilder(
      column: $table.labelId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get result => $composableBuilder(
      column: $table.result, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get next => $composableBuilder(
      column: $table.next, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isChecked =>
      $composableBuilder(column: $table.isChecked, builder: (column) => column);

  GeneratedColumn<int> get labelId =>
      $composableBuilder(column: $table.labelId, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get next =>
      $composableBuilder(column: $table.next, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);
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
            Value<String> title = const Value.absent(),
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<int> labelId = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> next = const Value.absent(),
            Value<int> year = const Value.absent(),
          }) =>
              YearlyTasksCompanion(
            title: title,
            id: id,
            isChecked: isChecked,
            labelId: labelId,
            result: result,
            next: next,
            year: year,
          ),
          createCompanionCallback: ({
            required String title,
            Value<int> id = const Value.absent(),
            Value<bool> isChecked = const Value.absent(),
            Value<int> labelId = const Value.absent(),
            Value<String?> result = const Value.absent(),
            Value<String?> next = const Value.absent(),
            required int year,
          }) =>
              YearlyTasksCompanion.insert(
            title: title,
            id: id,
            isChecked: isChecked,
            labelId: labelId,
            result: result,
            next: next,
            year: year,
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
typedef $$PageSettingsTableCreateCompanionBuilder = PageSettingsCompanion
    Function({
  required int pageId,
  Value<bool> primaryAutoSaves,
  Value<bool> reviewAutoSaves,
  Value<int> rowid,
});
typedef $$PageSettingsTableUpdateCompanionBuilder = PageSettingsCompanion
    Function({
  Value<int> pageId,
  Value<bool> primaryAutoSaves,
  Value<bool> reviewAutoSaves,
  Value<int> rowid,
});

class $$PageSettingsTableFilterComposer
    extends Composer<_$MyDatabase, $PageSettingsTable> {
  $$PageSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get pageId => $composableBuilder(
      column: $table.pageId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get primaryAutoSaves => $composableBuilder(
      column: $table.primaryAutoSaves,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get reviewAutoSaves => $composableBuilder(
      column: $table.reviewAutoSaves,
      builder: (column) => ColumnFilters(column));
}

class $$PageSettingsTableOrderingComposer
    extends Composer<_$MyDatabase, $PageSettingsTable> {
  $$PageSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get pageId => $composableBuilder(
      column: $table.pageId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get primaryAutoSaves => $composableBuilder(
      column: $table.primaryAutoSaves,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get reviewAutoSaves => $composableBuilder(
      column: $table.reviewAutoSaves,
      builder: (column) => ColumnOrderings(column));
}

class $$PageSettingsTableAnnotationComposer
    extends Composer<_$MyDatabase, $PageSettingsTable> {
  $$PageSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pageId =>
      $composableBuilder(column: $table.pageId, builder: (column) => column);

  GeneratedColumn<bool> get primaryAutoSaves => $composableBuilder(
      column: $table.primaryAutoSaves, builder: (column) => column);

  GeneratedColumn<bool> get reviewAutoSaves => $composableBuilder(
      column: $table.reviewAutoSaves, builder: (column) => column);
}

class $$PageSettingsTableTableManager extends RootTableManager<
    _$MyDatabase,
    $PageSettingsTable,
    PageSetting,
    $$PageSettingsTableFilterComposer,
    $$PageSettingsTableOrderingComposer,
    $$PageSettingsTableAnnotationComposer,
    $$PageSettingsTableCreateCompanionBuilder,
    $$PageSettingsTableUpdateCompanionBuilder,
    (
      PageSetting,
      BaseReferences<_$MyDatabase, $PageSettingsTable, PageSetting>
    ),
    PageSetting,
    PrefetchHooks Function()> {
  $$PageSettingsTableTableManager(_$MyDatabase db, $PageSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PageSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PageSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PageSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> pageId = const Value.absent(),
            Value<bool> primaryAutoSaves = const Value.absent(),
            Value<bool> reviewAutoSaves = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PageSettingsCompanion(
            pageId: pageId,
            primaryAutoSaves: primaryAutoSaves,
            reviewAutoSaves: reviewAutoSaves,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int pageId,
            Value<bool> primaryAutoSaves = const Value.absent(),
            Value<bool> reviewAutoSaves = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PageSettingsCompanion.insert(
            pageId: pageId,
            primaryAutoSaves: primaryAutoSaves,
            reviewAutoSaves: reviewAutoSaves,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PageSettingsTableProcessedTableManager = ProcessedTableManager<
    _$MyDatabase,
    $PageSettingsTable,
    PageSetting,
    $$PageSettingsTableFilterComposer,
    $$PageSettingsTableOrderingComposer,
    $$PageSettingsTableAnnotationComposer,
    $$PageSettingsTableCreateCompanionBuilder,
    $$PageSettingsTableUpdateCompanionBuilder,
    (
      PageSetting,
      BaseReferences<_$MyDatabase, $PageSettingsTable, PageSetting>
    ),
    PageSetting,
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
  $$PageSettingsTableTableManager get pageSettings =>
      $$PageSettingsTableTableManager(_db, _db.pageSettings);
}
