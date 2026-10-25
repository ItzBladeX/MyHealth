import 'package:drift/drift.dart';

@DataClassName('UserRow')
class User extends Table {
  TextColumn get userUuid =>
      text().withLength(min: 36, max: 36).named('user_uuid')();

  TextColumn get fullName => text().named('fullname')();

  TextColumn get hashedPassword => text().named('hashed_password')();

  TextColumn get phoneNumber =>
      text().nullable().unique().named('phonenumber')();

  @override
  Set<Column<Object>> get primaryKey => {userUuid};
}

@DataClassName('UserDataRow')
class UserData extends Table {
  TextColumn get userUuid =>
      text().withLength(min: 36, max: 36).named('user_uuid')();

  RealColumn get height => real().nullable()();

  RealColumn get weight => real().nullable()();

  TextColumn get bloodType => text().nullable()();

  DateTimeColumn get birthdate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {userUuid};
}

@DataClassName("UserAllergiesRow")
class UserAllergies extends Table {
  TextColumn get userUuid =>
      text().withLength(min: 36, max: 36).named('user_uuid')();

  TextColumn get name => text()();
  TextColumn get severity => text()();

  @override
  Set<Column> get primaryKey => {userUuid, name};
}

@DataClassName("UserMedicalHistoryRow")
class UserMedicalHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userUuid =>
      text().withLength(min: 36, max: 36).named('user_uuid')();
  DateTimeColumn get date => dateTime()();
  TextColumn get hospital => text()();
  TextColumn get diagnosis => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get prescription => text().nullable()();
}
