import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_animal/screens/List.dart';
import 'package:random_animal/screens/details.dart';
import 'package:random_animal/screens/home_screen.dart';
import 'package:random_animal/utils/global.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// =========================== connect the database ===================



Future<void> databaseCopy() async {

  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path ,'MyDatabase.db');

  bool fileExists = await databaseExists(path);

  if(!fileExists){
    ByteData data = await rootBundle.load(join('images/MyDatabase.db'));

    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseCopy();
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'MyDatabase.db');
  Database database = await openDatabase(path);

  list = await database.rawQuery('SELECT * FROM AnimalTable');
  for (var row in list) {
    print(row);
  }

  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        textTheme: TextTheme(
          bodyText2: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        )
      ),
      routes: {
        '/' : (context) => const RandomAnimal(),
        'list' : (context) => const ListPage(),
        'details' : (context) => const DetailsPage()
      },
    ),
  );
}

