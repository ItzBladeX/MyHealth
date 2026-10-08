// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserTable extends User with TableInfo<$UserTable, UserRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userUuidMeta = const VerificationMeta(
    'userUuid',
  );
  @override
  late final GeneratedColumn<String> userUuid = GeneratedColumn<String>(
    'user_uuid',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'fullname',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hashedPasswordMeta = const VerificationMeta(
    'hashedPassword',
  );
  @override
  late final GeneratedColumn<String> hashedPassword = GeneratedColumn<String>(
    'hashed_password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phonenumber',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    userUuid,
    fullName,
    hashedPassword,
    phoneNumber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_uuid')) {
      context.handle(
        _userUuidMeta,
        userUuid.isAcceptableOrUnknown(data['user_uuid']!, _userUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_userUuidMeta);
    }
    if (data.containsKey('fullname')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['fullname']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('hashed_password')) {
      context.handle(
        _hashedPasswordMeta,
        hashedPassword.isAcceptableOrUnknown(
          data['hashed_password']!,
          _hashedPasswordMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hashedPasswordMeta);
    }
    if (data.containsKey('phonenumber')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phonenumber']!,
          _phoneNumberMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userUuid};
  @override
  UserRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRow(
      userUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_uuid'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fullname'],
      )!,
      hashedPassword: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hashed_password'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phonenumber'],
      ),
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserRow extends DataClass implements Insertable<UserRow> {
  final String userUuid;
  final String fullName;
  final String hashedPassword;
  final String? phoneNumber;
  const UserRow({
    required this.userUuid,
    required this.fullName,
    required this.hashedPassword,
    this.phoneNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_uuid'] = Variable<String>(userUuid);
    map['fullname'] = Variable<String>(fullName);
    map['hashed_password'] = Variable<String>(hashedPassword);
    if (!nullToAbsent || phoneNumber != null) {
      map['phonenumber'] = Variable<String>(phoneNumber);
    }
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      userUuid: Value(userUuid),
      fullName: Value(fullName),
      hashedPassword: Value(hashedPassword),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
    );
  }

  factory UserRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRow(
      userUuid: serializer.fromJson<String>(json['userUuid']),
      fullName: serializer.fromJson<String>(json['fullName']),
      hashedPassword: serializer.fromJson<String>(json['hashedPassword']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userUuid': serializer.toJson<String>(userUuid),
      'fullName': serializer.toJson<String>(fullName),
      'hashedPassword': serializer.toJson<String>(hashedPassword),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
    };
  }

  UserRow copyWith({
    String? userUuid,
    String? fullName,
    String? hashedPassword,
    Value<String?> phoneNumber = const Value.absent(),
  }) => UserRow(
    userUuid: userUuid ?? this.userUuid,
    fullName: fullName ?? this.fullName,
    hashedPassword: hashedPassword ?? this.hashedPassword,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
  );
  UserRow copyWithCompanion(UserCompanion data) {
    return UserRow(
      userUuid: data.userUuid.present ? data.userUuid.value : this.userUuid,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      hashedPassword: data.hashedPassword.present
          ? data.hashedPassword.value
          : this.hashedPassword,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserRow(')
          ..write('userUuid: $userUuid, ')
          ..write('fullName: $fullName, ')
          ..write('hashedPassword: $hashedPassword, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userUuid, fullName, hashedPassword, phoneNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRow &&
          other.userUuid == this.userUuid &&
          other.fullName == this.fullName &&
          other.hashedPassword == this.hashedPassword &&
          other.phoneNumber == this.phoneNumber);
}

class UserCompanion extends UpdateCompanion<UserRow> {
  final Value<String> userUuid;
  final Value<String> fullName;
  final Value<String> hashedPassword;
  final Value<String?> phoneNumber;
  final Value<int> rowid;
  const UserCompanion({
    this.userUuid = const Value.absent(),
    this.fullName = const Value.absent(),
    this.hashedPassword = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserCompanion.insert({
    required String userUuid,
    required String fullName,
    required String hashedPassword,
    this.phoneNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userUuid = Value(userUuid),
       fullName = Value(fullName),
       hashedPassword = Value(hashedPassword);
  static Insertable<UserRow> custom({
    Expression<String>? userUuid,
    Expression<String>? fullName,
    Expression<String>? hashedPassword,
    Expression<String>? phoneNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userUuid != null) 'user_uuid': userUuid,
      if (fullName != null) 'fullname': fullName,
      if (hashedPassword != null) 'hashed_password': hashedPassword,
      if (phoneNumber != null) 'phonenumber': phoneNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserCompanion copyWith({
    Value<String>? userUuid,
    Value<String>? fullName,
    Value<String>? hashedPassword,
    Value<String?>? phoneNumber,
    Value<int>? rowid,
  }) {
    return UserCompanion(
      userUuid: userUuid ?? this.userUuid,
      fullName: fullName ?? this.fullName,
      hashedPassword: hashedPassword ?? this.hashedPassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userUuid.present) {
      map['user_uuid'] = Variable<String>(userUuid.value);
    }
    if (fullName.present) {
      map['fullname'] = Variable<String>(fullName.value);
    }
    if (hashedPassword.present) {
      map['hashed_password'] = Variable<String>(hashedPassword.value);
    }
    if (phoneNumber.present) {
      map['phonenumber'] = Variable<String>(phoneNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('userUuid: $userUuid, ')
          ..write('fullName: $fullName, ')
          ..write('hashedPassword: $hashedPassword, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserDataTable extends UserData
    with TableInfo<$UserDataTable, UserDataRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDataTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthdateMeta = const VerificationMeta(
    'birthdate',
  );
  @override
  late final GeneratedColumn<DateTime> birthdate = GeneratedColumn<DateTime>(
    'birthdate',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userUuidMeta = const VerificationMeta(
    'userUuid',
  );
  @override
  late final GeneratedColumn<String> userUuid = GeneratedColumn<String>(
    'user_uuid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user (user_uuid)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, age, birthdate, userUuid];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_data';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserDataRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('birthdate')) {
      context.handle(
        _birthdateMeta,
        birthdate.isAcceptableOrUnknown(data['birthdate']!, _birthdateMeta),
      );
    }
    if (data.containsKey('user_uuid')) {
      context.handle(
        _userUuidMeta,
        userUuid.isAcceptableOrUnknown(data['user_uuid']!, _userUuidMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDataRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDataRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      ),
      birthdate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birthdate'],
      ),
      userUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_uuid'],
      ),
    );
  }

  @override
  $UserDataTable createAlias(String alias) {
    return $UserDataTable(attachedDatabase, alias);
  }
}

class UserDataRow extends DataClass implements Insertable<UserDataRow> {
  final int id;
  final int? age;
  final DateTime? birthdate;
  final String? userUuid;
  const UserDataRow({
    required this.id,
    this.age,
    this.birthdate,
    this.userUuid,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || birthdate != null) {
      map['birthdate'] = Variable<DateTime>(birthdate);
    }
    if (!nullToAbsent || userUuid != null) {
      map['user_uuid'] = Variable<String>(userUuid);
    }
    return map;
  }

  UserDataCompanion toCompanion(bool nullToAbsent) {
    return UserDataCompanion(
      id: Value(id),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      birthdate: birthdate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthdate),
      userUuid: userUuid == null && nullToAbsent
          ? const Value.absent()
          : Value(userUuid),
    );
  }

  factory UserDataRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDataRow(
      id: serializer.fromJson<int>(json['id']),
      age: serializer.fromJson<int?>(json['age']),
      birthdate: serializer.fromJson<DateTime?>(json['birthdate']),
      userUuid: serializer.fromJson<String?>(json['userUuid']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'age': serializer.toJson<int?>(age),
      'birthdate': serializer.toJson<DateTime?>(birthdate),
      'userUuid': serializer.toJson<String?>(userUuid),
    };
  }

  UserDataRow copyWith({
    int? id,
    Value<int?> age = const Value.absent(),
    Value<DateTime?> birthdate = const Value.absent(),
    Value<String?> userUuid = const Value.absent(),
  }) => UserDataRow(
    id: id ?? this.id,
    age: age.present ? age.value : this.age,
    birthdate: birthdate.present ? birthdate.value : this.birthdate,
    userUuid: userUuid.present ? userUuid.value : this.userUuid,
  );
  UserDataRow copyWithCompanion(UserDataCompanion data) {
    return UserDataRow(
      id: data.id.present ? data.id.value : this.id,
      age: data.age.present ? data.age.value : this.age,
      birthdate: data.birthdate.present ? data.birthdate.value : this.birthdate,
      userUuid: data.userUuid.present ? data.userUuid.value : this.userUuid,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDataRow(')
          ..write('id: $id, ')
          ..write('age: $age, ')
          ..write('birthdate: $birthdate, ')
          ..write('userUuid: $userUuid')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, age, birthdate, userUuid);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDataRow &&
          other.id == this.id &&
          other.age == this.age &&
          other.birthdate == this.birthdate &&
          other.userUuid == this.userUuid);
}

class UserDataCompanion extends UpdateCompanion<UserDataRow> {
  final Value<int> id;
  final Value<int?> age;
  final Value<DateTime?> birthdate;
  final Value<String?> userUuid;
  const UserDataCompanion({
    this.id = const Value.absent(),
    this.age = const Value.absent(),
    this.birthdate = const Value.absent(),
    this.userUuid = const Value.absent(),
  });
  UserDataCompanion.insert({
    this.id = const Value.absent(),
    this.age = const Value.absent(),
    this.birthdate = const Value.absent(),
    this.userUuid = const Value.absent(),
  });
  static Insertable<UserDataRow> custom({
    Expression<int>? id,
    Expression<int>? age,
    Expression<DateTime>? birthdate,
    Expression<String>? userUuid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (age != null) 'age': age,
      if (birthdate != null) 'birthdate': birthdate,
      if (userUuid != null) 'user_uuid': userUuid,
    });
  }

  UserDataCompanion copyWith({
    Value<int>? id,
    Value<int?>? age,
    Value<DateTime?>? birthdate,
    Value<String?>? userUuid,
  }) {
    return UserDataCompanion(
      id: id ?? this.id,
      age: age ?? this.age,
      birthdate: birthdate ?? this.birthdate,
      userUuid: userUuid ?? this.userUuid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (birthdate.present) {
      map['birthdate'] = Variable<DateTime>(birthdate.value);
    }
    if (userUuid.present) {
      map['user_uuid'] = Variable<String>(userUuid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDataCompanion(')
          ..write('id: $id, ')
          ..write('age: $age, ')
          ..write('birthdate: $birthdate, ')
          ..write('userUuid: $userUuid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserTable user = $UserTable(this);
  late final $UserDataTable userData = $UserDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user, userData];
}

typedef $$UserTableCreateCompanionBuilder = UserCompanion Function({
  required String userUuid,
  required String fullName,
  required String hashedPassword,
  Value<String?> phoneNumber,
  Value<int> rowid,
});
typedef $$UserTableUpdateCompanionBuilder = UserCompanion Function({
  Value<String> userUuid,
  Value<String> fullName,
  Value<String> hashedPassword,
  Value<String?> phoneNumber,
  Value<int> rowid,
});

final class $$UserTableReferences
    extends BaseReferences<_$AppDatabase, $UserTable, UserRow> {
  $$UserTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UserDataTable, List<UserDataRow>>
  _userDataRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userData,
    aliasName: 'user__user_uuid__user_data__user_uuid',
  );

  $$UserDataTableProcessedTableManager get userDataRefs {
    final manager = $$UserDataTableTableManager($_db, $_db.userData).filter(
      (f) => f.userUuid.userUuid.sqlEquals($_itemColumn<String>('user_uuid')!),
    );

    final cache = $_typedResult.readTableOrNull(_userDataRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserTableFilterComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userUuid => $composableBuilder(
    column: $table.userUuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hashedPassword => $composableBuilder(
    column: $table.hashedPassword,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> userDataRefs(
    Expression<bool> Function($$UserDataTableFilterComposer f) f,
  ) {
    final $$UserDataTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userUuid,
      referencedTable: $db.userData,
      getReferencedColumn: (t) => t.userUuid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserDataTableFilterComposer(
            $db: $db,
            $table: $db.userData,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableOrderingComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get userUuid => $composableBuilder(
    column: $table.userUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hashedPassword => $composableBuilder(
    column: $table.hashedPassword,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userUuid =>
      $composableBuilder(column: $table.userUuid, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get hashedPassword => $composableBuilder(
    column: $table.hashedPassword,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  Expression<T> userDataRefs<T extends Object>(
    Expression<T> Function($$UserDataTableAnnotationComposer a) f,
  ) {
    final $$UserDataTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userUuid,
      referencedTable: $db.userData,
      getReferencedColumn: (t) => t.userUuid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserDataTableAnnotationComposer(
            $db: $db,
            $table: $db.userData,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserTable,
          UserRow,
          $$UserTableFilterComposer,
          $$UserTableOrderingComposer,
          $$UserTableAnnotationComposer,
          $$UserTableCreateCompanionBuilder,
          $$UserTableUpdateCompanionBuilder,
          (UserRow, $$UserTableReferences),
          UserRow,
          PrefetchHooks Function({bool userDataRefs})
        > {
  $$UserTableTableManager(_$AppDatabase db, $UserTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userUuid = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> hashedPassword = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion(
                userUuid: userUuid,
                fullName: fullName,
                hashedPassword: hashedPassword,
                phoneNumber: phoneNumber,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userUuid,
                required String fullName,
                required String hashedPassword,
                Value<String?> phoneNumber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion.insert(
                userUuid: userUuid,
                fullName: fullName,
                hashedPassword: hashedPassword,
                phoneNumber: phoneNumber,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserTable, UserRow>(table),
                  $$UserTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userDataRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (userDataRefs) db.userData],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (userDataRefs)
                    await $_getPrefetchedData<UserRow, $UserTable, UserDataRow>(
                      currentTable: table,
                      referencedTable: $$UserTableReferences._userDataRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$UserTableReferences(db, table, p0).userDataRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.userUuid == item.userUuid,
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

typedef $$UserTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserTable,
      UserRow,
      $$UserTableFilterComposer,
      $$UserTableOrderingComposer,
      $$UserTableAnnotationComposer,
      $$UserTableCreateCompanionBuilder,
      $$UserTableUpdateCompanionBuilder,
      (UserRow, $$UserTableReferences),
      UserRow,
      PrefetchHooks Function({bool userDataRefs})
    >;
typedef $$UserDataTableCreateCompanionBuilder = UserDataCompanion Function({
  Value<int> id,
  Value<int?> age,
  Value<DateTime?> birthdate,
  Value<String?> userUuid,
});
typedef $$UserDataTableUpdateCompanionBuilder = UserDataCompanion Function({
  Value<int> id,
  Value<int?> age,
  Value<DateTime?> birthdate,
  Value<String?> userUuid,
});

final class $$UserDataTableReferences
    extends BaseReferences<_$AppDatabase, $UserDataTable, UserDataRow> {
  $$UserDataTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserTable _userUuidTable(_$AppDatabase db) =>
      db.user.createAlias('user_data__user_uuid__user__user_uuid');

  $$UserTableProcessedTableManager? get userUuid {
    final $_column = $_itemColumn<String>('user_uuid');
    if ($_column == null) return null;
    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
    ).filter((f) => f.userUuid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userUuidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserDataTableFilterComposer
    extends Composer<_$AppDatabase, $UserDataTable> {
  $$UserDataTableFilterComposer({
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

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthdate => $composableBuilder(
    column: $table.birthdate,
    builder: (column) => ColumnFilters(column),
  );

  $$UserTableFilterComposer get userUuid {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userUuid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.userUuid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDataTableOrderingComposer
    extends Composer<_$AppDatabase, $UserDataTable> {
  $$UserDataTableOrderingComposer({
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

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthdate => $composableBuilder(
    column: $table.birthdate,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserTableOrderingComposer get userUuid {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userUuid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.userUuid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserDataTable> {
  $$UserDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<DateTime> get birthdate =>
      $composableBuilder(column: $table.birthdate, builder: (column) => column);

  $$UserTableAnnotationComposer get userUuid {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userUuid,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.userUuid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserDataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserDataTable,
          UserDataRow,
          $$UserDataTableFilterComposer,
          $$UserDataTableOrderingComposer,
          $$UserDataTableAnnotationComposer,
          $$UserDataTableCreateCompanionBuilder,
          $$UserDataTableUpdateCompanionBuilder,
          (UserDataRow, $$UserDataTableReferences),
          UserDataRow,
          PrefetchHooks Function({bool userUuid})
        > {
  $$UserDataTableTableManager(_$AppDatabase db, $UserDataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> age = const Value.absent(),
                Value<DateTime?> birthdate = const Value.absent(),
                Value<String?> userUuid = const Value.absent(),
              }) => UserDataCompanion(
                id: id,
                age: age,
                birthdate: birthdate,
                userUuid: userUuid,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> age = const Value.absent(),
                Value<DateTime?> birthdate = const Value.absent(),
                Value<String?> userUuid = const Value.absent(),
              }) => UserDataCompanion.insert(
                id: id,
                age: age,
                birthdate: birthdate,
                userUuid: userUuid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserDataTable, UserDataRow>(table),
                  $$UserDataTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userUuid = false}) {
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
                    if (userUuid) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.userUuid,
                        referencedTable: $$UserDataTableReferences
                            ._userUuidTable(db),
                        referencedColumn: $$UserDataTableReferences
                            ._userUuidTable(db)
                            .userUuid,
                      ) as T;
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

typedef $$UserDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserDataTable,
      UserDataRow,
      $$UserDataTableFilterComposer,
      $$UserDataTableOrderingComposer,
      $$UserDataTableAnnotationComposer,
      $$UserDataTableCreateCompanionBuilder,
      $$UserDataTableUpdateCompanionBuilder,
      (UserDataRow, $$UserDataTableReferences),
      UserDataRow,
      PrefetchHooks Function({bool userUuid})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserTableTableManager get user => $$UserTableTableManager(_db, _db.user);
  $$UserDataTableTableManager get userData =>
      $$UserDataTableTableManager(_db, _db.userData);
}
