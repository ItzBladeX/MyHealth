import 'dart:io';
import 'package:app/models/user_model.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;      
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(tables: [User, UserData, UserAllergies, UserMedicalHistory])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    const dbName = 'MyHealth_Local';

    return driftDatabase(
      name: dbName,
      native: DriftNativeOptions(
      
        databasePath: () async {
        
          if (kDebugMode && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
            final cwd = Directory.current.path; // Dynamically gets your Flutter project root folder
            return p.join(cwd, '$dbName.sqlite');
          }
          
          final dbFolder = await getApplicationDocumentsDirectory();
          return p.join(dbFolder.path, '$dbName.sqlite');
        },
      ),
    );
  }
}
