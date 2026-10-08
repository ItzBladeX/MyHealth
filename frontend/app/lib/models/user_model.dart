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
  IntColumn get id => integer().autoIncrement()();

  IntColumn get age => integer().nullable()();

  DateTimeColumn get birthdate => dateTime().nullable()();

  TextColumn get userUuid =>
      text().nullable().references(User, #userUuid).named('user_uuid')();
}
