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
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bloodTypeMeta = const VerificationMeta(
    'bloodType',
  );
  @override
  late final GeneratedColumn<String> bloodType = GeneratedColumn<String>(
    'blood_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
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
  @override
  List<GeneratedColumn> get $columns => [
    userUuid,
    height,
    weight,
    bloodType,
    birthdate,
  ];
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
    if (data.containsKey('user_uuid')) {
      context.handle(
        _userUuidMeta,
        userUuid.isAcceptableOrUnknown(data['user_uuid']!, _userUuidMeta),
      );
    } else if (isInserting) {
      context.missing(_userUuidMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('blood_type')) {
      context.handle(
        _bloodTypeMeta,
        bloodType.isAcceptableOrUnknown(data['blood_type']!, _bloodTypeMeta),
      );
    }
    if (data.containsKey('birthdate')) {
      context.handle(
        _birthdateMeta,
        birthdate.isAcceptableOrUnknown(data['birthdate']!, _birthdateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userUuid};
  @override
  UserDataRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDataRow(
      userUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_uuid'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      bloodType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}blood_type'],
      ),
      birthdate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birthdate'],
      ),
    );
  }

  @override
  $UserDataTable createAlias(String alias) {
    return $UserDataTable(attachedDatabase, alias);
  }
}

class UserDataRow extends DataClass implements Insertable<UserDataRow> {
  final String userUuid;
  final double? height;
  final double? weight;
  final String? bloodType;
  final DateTime? birthdate;
  const UserDataRow({
    required this.userUuid,
    this.height,
    this.weight,
    this.bloodType,
    this.birthdate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_uuid'] = Variable<String>(userUuid);
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || bloodType != null) {
      map['blood_type'] = Variable<String>(bloodType);
    }
    if (!nullToAbsent || birthdate != null) {
      map['birthdate'] = Variable<DateTime>(birthdate);
    }
    return map;
  }

  UserDataCompanion toCompanion(bool nullToAbsent) {
    return UserDataCompanion(
      userUuid: Value(userUuid),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      bloodType: bloodType == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodType),
      birthdate: birthdate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthdate),
    );
  }

  factory UserDataRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDataRow(
      userUuid: serializer.fromJson<String>(json['userUuid']),
      height: serializer.fromJson<double?>(json['height']),
      weight: serializer.fromJson<double?>(json['weight']),
      bloodType: serializer.fromJson<String?>(json['bloodType']),
      birthdate: serializer.fromJson<DateTime?>(json['birthdate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userUuid': serializer.toJson<String>(userUuid),
      'height': serializer.toJson<double?>(height),
      'weight': serializer.toJson<double?>(weight),
      'bloodType': serializer.toJson<String?>(bloodType),
      'birthdate': serializer.toJson<DateTime?>(birthdate),
    };
  }

  UserDataRow copyWith({
    String? userUuid,
    Value<double?> height = const Value.absent(),
    Value<double?> weight = const Value.absent(),
    Value<String?> bloodType = const Value.absent(),
    Value<DateTime?> birthdate = const Value.absent(),
  }) => UserDataRow(
    userUuid: userUuid ?? this.userUuid,
    height: height.present ? height.value : this.height,
    weight: weight.present ? weight.value : this.weight,
    bloodType: bloodType.present ? bloodType.value : this.bloodType,
    birthdate: birthdate.present ? birthdate.value : this.birthdate,
  );
  UserDataRow copyWithCompanion(UserDataCompanion data) {
    return UserDataRow(
      userUuid: data.userUuid.present ? data.userUuid.value : this.userUuid,
      height: data.height.present ? data.height.value : this.height,
      weight: data.weight.present ? data.weight.value : this.weight,
      bloodType: data.bloodType.present ? data.bloodType.value : this.bloodType,
      birthdate: data.birthdate.present ? data.birthdate.value : this.birthdate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDataRow(')
          ..write('userUuid: $userUuid, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('bloodType: $bloodType, ')
          ..write('birthdate: $birthdate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userUuid, height, weight, bloodType, birthdate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDataRow &&
          other.userUuid == this.userUuid &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.bloodType == this.bloodType &&
          other.birthdate == this.birthdate);
}

class UserDataCompanion extends UpdateCompanion<UserDataRow> {
  final Value<String> userUuid;
  final Value<double?> height;
  final Value<double?> weight;
  final Value<String?> bloodType;
  final Value<DateTime?> birthdate;
  final Value<int> rowid;
  const UserDataCompanion({
    this.userUuid = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.birthdate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserDataCompanion.insert({
    required String userUuid,
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.birthdate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userUuid = Value(userUuid);
  static Insertable<UserDataRow> custom({
    Expression<String>? userUuid,
    Expression<double>? height,
    Expression<double>? weight,
    Expression<String>? bloodType,
    Expression<DateTime>? birthdate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userUuid != null) 'user_uuid': userUuid,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (bloodType != null) 'blood_type': bloodType,
      if (birthdate != null) 'birthdate': birthdate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserDataCompanion copyWith({
    Value<String>? userUuid,
    Value<double?>? height,
    Value<double?>? weight,
    Value<String?>? bloodType,
    Value<DateTime?>? birthdate,
    Value<int>? rowid,
  }) {
    return UserDataCompanion(
      userUuid: userUuid ?? this.userUuid,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      bloodType: bloodType ?? this.bloodType,
      birthdate: birthdate ?? this.birthdate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userUuid.present) {
      map['user_uuid'] = Variable<String>(userUuid.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (bloodType.present) {
      map['blood_type'] = Variable<String>(bloodType.value);
    }
    if (birthdate.present) {
      map['birthdate'] = Variable<DateTime>(birthdate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDataCompanion(')
          ..write('userUuid: $userUuid, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('bloodType: $bloodType, ')
          ..write('birthdate: $birthdate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserAllergiesTable extends UserAllergies
    with TableInfo<$UserAllergiesTable, UserAllergiesRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserAllergiesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityMeta = const VerificationMeta(
    'severity',
  );
  @override
  late final GeneratedColumn<String> severity = GeneratedColumn<String>(
    'severity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [userUuid, name, severity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_allergies';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserAllergiesRow> instance, {
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(
        _severityMeta,
        severity.isAcceptableOrUnknown(data['severity']!, _severityMeta),
      );
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userUuid, name};
  @override
  UserAllergiesRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserAllergiesRow(
      userUuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_uuid'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      severity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}severity'],
      )!,
    );
  }

  @override
  $UserAllergiesTable createAlias(String alias) {
    return $UserAllergiesTable(attachedDatabase, alias);
  }
}

class UserAllergiesRow extends DataClass
    implements Insertable<UserAllergiesRow> {
  final String userUuid;
  final String name;
  final String severity;
  const UserAllergiesRow({
    required this.userUuid,
    required this.name,
    required this.severity,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_uuid'] = Variable<String>(userUuid);
    map['name'] = Variable<String>(name);
    map['severity'] = Variable<String>(severity);
    return map;
  }

  UserAllergiesCompanion toCompanion(bool nullToAbsent) {
    return UserAllergiesCompanion(
      userUuid: Value(userUuid),
      name: Value(name),
      severity: Value(severity),
    );
  }

  factory UserAllergiesRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAllergiesRow(
      userUuid: serializer.fromJson<String>(json['userUuid']),
      name: serializer.fromJson<String>(json['name']),
      severity: serializer.fromJson<String>(json['severity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userUuid': serializer.toJson<String>(userUuid),
      'name': serializer.toJson<String>(name),
      'severity': serializer.toJson<String>(severity),
    };
  }

  UserAllergiesRow copyWith({
    String? userUuid,
    String? name,
    String? severity,
  }) => UserAllergiesRow(
    userUuid: userUuid ?? this.userUuid,
    name: name ?? this.name,
    severity: severity ?? this.severity,
  );
  UserAllergiesRow copyWithCompanion(UserAllergiesCompanion data) {
    return UserAllergiesRow(
      userUuid: data.userUuid.present ? data.userUuid.value : this.userUuid,
      name: data.name.present ? data.name.value : this.name,
      severity: data.severity.present ? data.severity.value : this.severity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserAllergiesRow(')
          ..write('userUuid: $userUuid, ')
          ..write('name: $name, ')
          ..write('severity: $severity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userUuid, name, severity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAllergiesRow &&
          other.userUuid == this.userUuid &&
          other.name == this.name &&
          other.severity == this.severity);
}

class UserAllergiesCompanion extends UpdateCompanion<UserAllergiesRow> {
  final Value<String> userUuid;
  final Value<String> name;
  final Value<String> severity;
  final Value<int> rowid;
  const UserAllergiesCompanion({
    this.userUuid = const Value.absent(),
    this.name = const Value.absent(),
    this.severity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserAllergiesCompanion.insert({
    required String userUuid,
    required String name,
    required String severity,
    this.rowid = const Value.absent(),
  }) : userUuid = Value(userUuid),
       name = Value(name),
       severity = Value(severity);
  static Insertable<UserAllergiesRow> custom({
    Expression<String>? userUuid,
    Expression<String>? name,
    Expression<String>? severity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userUuid != null) 'user_uuid': userUuid,
      if (name != null) 'name': name,
      if (severity != null) 'severity': severity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserAllergiesCompanion copyWith({
    Value<String>? userUuid,
    Value<String>? name,
    Value<String>? severity,
    Value<int>? rowid,
  }) {
    return UserAllergiesCompanion(
      userUuid: userUuid ?? this.userUuid,
      name: name ?? this.name,
      severity: severity ?? this.severity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userUuid.present) {
      map['user_uuid'] = Variable<String>(userUuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (severity.present) {
      map['severity'] = Variable<String>(severity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserAllergiesCompanion(')
          ..write('userUuid: $userUuid, ')
          ..write('name: $name, ')
          ..write('severity: $severity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserTable user = $UserTable(this);
  late final $UserDataTable userData = $UserDataTable(this);
  late final $UserAllergiesTable userAllergies = $UserAllergiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    user,
    userData,
    userAllergies,
  ];
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
          (UserRow, BaseReferences<_$AppDatabase, $UserTable, UserRow>),
          UserRow,
          PrefetchHooks Function()
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
                  BaseReferences<_$AppDatabase, $UserTable, UserRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
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
      (UserRow, BaseReferences<_$AppDatabase, $UserTable, UserRow>),
      UserRow,
      PrefetchHooks Function()
    >;
typedef $$UserDataTableCreateCompanionBuilder = UserDataCompanion Function({
  required String userUuid,
  Value<double?> height,
  Value<double?> weight,
  Value<String?> bloodType,
  Value<DateTime?> birthdate,
  Value<int> rowid,
});
typedef $$UserDataTableUpdateCompanionBuilder = UserDataCompanion Function({
  Value<String> userUuid,
  Value<double?> height,
  Value<double?> weight,
  Value<String?> bloodType,
  Value<DateTime?> birthdate,
  Value<int> rowid,
});

class $$UserDataTableFilterComposer
    extends Composer<_$AppDatabase, $UserDataTable> {
  $$UserDataTableFilterComposer({
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

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bloodType => $composableBuilder(
    column: $table.bloodType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthdate => $composableBuilder(
    column: $table.birthdate,
    builder: (column) => ColumnFilters(column),
  );
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
  ColumnOrderings<String> get userUuid => $composableBuilder(
    column: $table.userUuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bloodType => $composableBuilder(
    column: $table.bloodType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthdate => $composableBuilder(
    column: $table.birthdate,
    builder: (column) => ColumnOrderings(column),
  );
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
  GeneratedColumn<String> get userUuid =>
      $composableBuilder(column: $table.userUuid, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get bloodType =>
      $composableBuilder(column: $table.bloodType, builder: (column) => column);

  GeneratedColumn<DateTime> get birthdate =>
      $composableBuilder(column: $table.birthdate, builder: (column) => column);
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
          (
            UserDataRow,
            BaseReferences<_$AppDatabase, $UserDataTable, UserDataRow>,
          ),
          UserDataRow,
          PrefetchHooks Function()
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
                Value<String> userUuid = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<String?> bloodType = const Value.absent(),
                Value<DateTime?> birthdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserDataCompanion(
                userUuid: userUuid,
                height: height,
                weight: weight,
                bloodType: bloodType,
                birthdate: birthdate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userUuid,
                Value<double?> height = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<String?> bloodType = const Value.absent(),
                Value<DateTime?> birthdate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserDataCompanion.insert(
                userUuid: userUuid,
                height: height,
                weight: weight,
                bloodType: bloodType,
                birthdate: birthdate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserDataTable, UserDataRow>(table),
                  BaseReferences<_$AppDatabase, $UserDataTable, UserDataRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
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
      (UserDataRow, BaseReferences<_$AppDatabase, $UserDataTable, UserDataRow>),
      UserDataRow,
      PrefetchHooks Function()
    >;
typedef $$UserAllergiesTableCreateCompanionBuilder =
    UserAllergiesCompanion Function({
      required String userUuid,
      required String name,
      required String severity,
      Value<int> rowid,
    });
typedef $$UserAllergiesTableUpdateCompanionBuilder =
    UserAllergiesCompanion Function({
      Value<String> userUuid,
      Value<String> name,
      Value<String> severity,
      Value<int> rowid,
    });

class $$UserAllergiesTableFilterComposer
    extends Composer<_$AppDatabase, $UserAllergiesTable> {
  $$UserAllergiesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserAllergiesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserAllergiesTable> {
  $$UserAllergiesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get severity => $composableBuilder(
    column: $table.severity,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserAllergiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserAllergiesTable> {
  $$UserAllergiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get userUuid =>
      $composableBuilder(column: $table.userUuid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);
}

class $$UserAllergiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserAllergiesTable,
          UserAllergiesRow,
          $$UserAllergiesTableFilterComposer,
          $$UserAllergiesTableOrderingComposer,
          $$UserAllergiesTableAnnotationComposer,
          $$UserAllergiesTableCreateCompanionBuilder,
          $$UserAllergiesTableUpdateCompanionBuilder,
          (
            UserAllergiesRow,
            BaseReferences<
              _$AppDatabase,
              $UserAllergiesTable,
              UserAllergiesRow
            >,
          ),
          UserAllergiesRow,
          PrefetchHooks Function()
        > {
  $$UserAllergiesTableTableManager(_$AppDatabase db, $UserAllergiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserAllergiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserAllergiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserAllergiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userUuid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> severity = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserAllergiesCompanion(
                userUuid: userUuid,
                name: name,
                severity: severity,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userUuid,
                required String name,
                required String severity,
                Value<int> rowid = const Value.absent(),
              }) => UserAllergiesCompanion.insert(
                userUuid: userUuid,
                name: name,
                severity: severity,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UserAllergiesTable, UserAllergiesRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $UserAllergiesTable,
                    UserAllergiesRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserAllergiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserAllergiesTable,
      UserAllergiesRow,
      $$UserAllergiesTableFilterComposer,
      $$UserAllergiesTableOrderingComposer,
      $$UserAllergiesTableAnnotationComposer,
      $$UserAllergiesTableCreateCompanionBuilder,
      $$UserAllergiesTableUpdateCompanionBuilder,
      (
        UserAllergiesRow,
        BaseReferences<_$AppDatabase, $UserAllergiesTable, UserAllergiesRow>,
      ),
      UserAllergiesRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserTableTableManager get user => $$UserTableTableManager(_db, _db.user);
  $$UserDataTableTableManager get userData =>
      $$UserDataTableTableManager(_db, _db.userData);
  $$UserAllergiesTableTableManager get userAllergies =>
      $$UserAllergiesTableTableManager(_db, _db.userAllergies);
}
