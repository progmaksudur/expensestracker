import 'package:expanse_tracker_sql/model/income_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/expanses_model.dart';

class DBHalper{
  static const String createTableExpanses='''create table $tableExpanses(
  $tableExpansesid integer primary key,
  $tableExpansesTitle text,
  $tableExpansesTime text,
  $tableExpansesDay text,
  $tableExpansesMonth text,
  $tableExpansesYear text,
  $tableExpansesTimeStamp integer,
  $tableExpansesAmount text,
  $tableExpansesCashin text,
  $tableExpansesType integer
  )''';
  static const String createTableIncome='''create table $tableIncome(
  $tableIncomeid integer primary key,
  $tableIncomeTitle text,
  $tableIncomeTime text,
  $tableIncomeDay text,
  $tableIncomeMonth Text,
  $tableIncomeYear text,
  $tableIncomeTimeStamp integer,
  $tableIncomeAmount text,
  $tableIncomeCashin text,
  $tableIncomeType integer  
  )''';

  static Future<Database> open() async{
        final root= await getDatabasesPath();
        final dbPath= join(root,"expanses_tracker.db");
    return openDatabase(dbPath,version: 1,onCreate: (db,verson){
      db.execute(createTableExpanses);
      db.execute(createTableIncome);

    });
  }

  static Future<int> insertExpanse(ExpansesTrackerModel expansesTrackerModel)async{
    final db=await open();
    return db.insert(tableExpanses, expansesTrackerModel.toMap());
  }
  static Future<int> insertIncome(IncomeModel incomeModel)async{
    final db=await open();
    return db.insert(tableIncome, incomeModel.toMap());
  }

  static Future<List<ExpansesTrackerModel>> getAllExpanses()async{
    final db = await open();
    final List<Map<String, dynamic>> expansesList = await db.query(tableExpanses, orderBy: '$tableExpansesid asc');
    return List.generate(expansesList.length, (index) =>
        ExpansesTrackerModel.fromMap(expansesList[index]));

}
  static Future<List<IncomeModel>> getAllIncome()async{
    final db= await open();
    final List<Map<String,dynamic>> incomeList=await db.query(tableIncome,orderBy: '$tableIncomeid asc');
    return List.generate(incomeList.length, (index) => IncomeModel.fromMap(incomeList[index]));
  }

}