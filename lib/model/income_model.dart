const String tableIncome = "tbl_income";
const String tableIncomeid = "tbl_id";
const String tableIncomeTitle = "tbl_title";
const String tableIncomeTime = "tbl_time";
const String tableIncomeDay = "tbl_day";
const String tableIncomeMonth = "tbl_month";
const String tableIncomeYear = "tbl_year";
const String tableIncomeTimeStamp = "tbl_timestamp";
const String tableIncomeAmount = "tbl_amount";
const String tableIncomeCashin = "tbl_cashin";
const String tableIncomeType = "tbl_expansestype";

class IncomeModel {
  int id;
  String incomeTitle;
  String incometime;
  String incomeday;
  String incomemonth;
  String incomeyear;
  int incomeTimestamp;
  String incomeamount;
  String incomecashin;
  int incomeType;

  IncomeModel(
      {required this.id,
      required this.incomeTitle,
      required this.incometime,
      required this.incomeday,
      required this.incomemonth,
      required this.incomeyear,
      required this.incomeTimestamp,
      required this.incomeamount,
      required this.incomecashin,
      required this.incomeType});

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      tableIncomeid:id,
      tableIncomeTitle:incomeTitle,
      tableIncomeTime:incometime,
      tableIncomeDay:incomeday,
      tableIncomeMonth:incomemonth,
      tableIncomeYear:incomeyear,
      tableIncomeTimeStamp:incomeTimestamp,
      tableIncomeAmount:incomeamount,
      tableIncomeCashin:incomecashin,
      tableIncomeType:incomeType
    };
    return map;
  }
  factory IncomeModel.fromMap(Map<String,dynamic> map)=>IncomeModel(
      id: map[tableIncomeid],
      incomeTitle:map[tableIncomeTitle],
      incometime: map[tableIncomeTime],
      incomeday: map[tableIncomeDay],
      incomemonth: map[tableIncomeMonth],
      incomeyear: map[tableIncomeYear],
      incomeTimestamp: map[tableIncomeTimeStamp],
      incomeamount: map[tableIncomeAmount],
      incomecashin: map[tableIncomeCashin],
      incomeType: map[tableIncomeType]);

  @override
  String toString() {
    return 'IncomeModel{id: $id, incomeTitle: $incomeTitle, incometime: $incometime, incomeday: $incomeday, incomemonth: $incomemonth, incomeyear: $incomeyear, incomeTimestamp: $incomeTimestamp, incomeamount: $incomeamount, incomecashin: $incomecashin, incomeType: $incomeType}';
  }
}
