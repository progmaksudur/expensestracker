
const String tableExpanses="tbl_expanses";
const String tableExpansesid="tbl_id";
const String tableExpansesTitle="tbl_title";
const String tableExpansesTime="tbl_time";
const String tableExpansesDay="tbl_day";
const String tableExpansesMonth="tbl_month";
const String tableExpansesYear="tbl_year";
const String tableExpansesTimeStamp="tbl_timestamp";
const String tableExpansesAmount="tbl_amount";
const String tableExpansesCashin="tbl_cashin";
const String tableExpansesType="tbl_expansestype";


class ExpansesTrackerModel{
  int id;
  String expansesTitle;
  String time;
  String day;
  String month;
  String year;
  int expansesTimestamp;
  String amount;
  String cashin;
  int expansesType;

  ExpansesTrackerModel(
      { required this.id,
        required this.expansesTitle,
        required this.time,
        required this.day,
        required this.month,
        required this.year,
        required this.expansesTimestamp,
        required this.amount,
        required this.cashin,
        required this.expansesType});

      Map<String,dynamic> toMap(){
        var map=<String,dynamic>{
          tableExpansesid:id,
          tableExpansesTitle:expansesTitle,
          tableExpansesTime:time,
          tableExpansesDay:day,
          tableExpansesMonth:month,
          tableExpansesYear:year,
          tableExpansesTimeStamp:expansesTimestamp,
          tableExpansesAmount:amount,
          tableExpansesCashin:cashin,
          tableExpansesType:expansesType,
        };
        return map;
      }
      factory ExpansesTrackerModel.fromMap(Map<String,dynamic>map)=>ExpansesTrackerModel(
          id: map[tableExpansesid],
          expansesTitle: map[tableExpansesTitle],
          time: map[tableExpansesTime],
          day: map[tableExpansesDay],
          month: map[tableExpansesMonth],
          year: map[tableExpansesYear],
          expansesTimestamp: map[tableExpansesTimeStamp],
          amount: map[tableExpansesAmount],
          cashin: map[tableExpansesCashin],
          expansesType: map[tableExpansesType]);

  @override
  String toString() {
    return 'ExpansesTrackerModel{id: $id, expansesTitle: $expansesTitle, time: $time, day: $day, month: $month, year: $year, expansesTimestamp: $expansesTimestamp, amount: $amount, cashin: $cashin, expansesType: $expansesType}';
  }
}