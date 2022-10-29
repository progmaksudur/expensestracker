import 'package:expanse_tracker_sql/database/db_halper.dart';
import 'package:expanse_tracker_sql/model/expanses_model.dart';
import 'package:expanse_tracker_sql/model/income_category.dart';
import 'package:expanse_tracker_sql/model/income_model.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/helper_function.dart';

class ExpansesTrackerProvider extends ChangeNotifier{
  double totalIncome=0.0;
  double totalExpanse=0.0;
  double totalBalanceAmount=0.0;

  List<IncomeModel> incomeList=[];
  List<ExpansesTrackerModel> expansesList=[];


  Future createDatabaase()async{
    DBHalper.open();
  }
  Future<bool> saveData(String trnsAmount,String category,String cashin,int expansesType,DateTime dateTime)async{
    if(expansesType==1){
      final catagorymodel=getExpansesCategoryModelByTitle(category);
      final expansesModel=ExpansesTrackerModel
        (id: DateTime.now().millisecondsSinceEpoch,
          expansesTitle: catagorymodel.title,
          time: DateTime.now().hour.toString()+":"+DateTime.now().minute.toString(),
          day: dateTime.day.toString(),
          month: dateTime.month.toString(),
          year: dateTime.year.toString(),
          expansesTimestamp: dateTime.millisecondsSinceEpoch,
          amount:trnsAmount ,
          cashin: cashin.toString(),
          expansesType: expansesType.toInt());
      final status=addExpansesData(expansesModel);
          return status;
    }
    else if(expansesType==2){
      final catagorymodel=getIncomeCategoryModelByTitle(category);
      final incomeModel=IncomeModel(
          id: DateTime.now().millisecondsSinceEpoch,
          incomeTitle: catagorymodel.title,
          incometime: DateTime.now().hour.toString()+":"+DateTime.now().minute.toString(),
          incomeday: dateTime.day.toString(),
          incomemonth: dateTime.month.toString(),
          incomeyear: dateTime.year.toString(),
          incomeTimestamp: dateTime.millisecondsSinceEpoch,
          incomeamount: trnsAmount, incomecashin: cashin.toString(), incomeType: expansesType.toInt());
      final status=addIncomeData(incomeModel);

      return status;
    }
    return false;
  }
  Future<bool> addExpansesData(ExpansesTrackerModel expansesTrackerModel)async{
      final insertid=await DBHalper.insertExpanse(expansesTrackerModel);

    return insertid>0?true:false;
  }
  Future<bool> addIncomeData(IncomeModel incomeModel)async{
    final insertid=await DBHalper.insertIncome(incomeModel);

    return insertid>0?true:false;
  }
  
  void deleteIncomeData(int id) async{
    final delete=await DBHalper.deleteIncome(id);
    if(delete>0){
      incomeList.removeWhere((element) => element.id==id);
      notifyListeners();
    }
  }
  void deleteExpansesData(int id) async{
    final delete=await DBHalper.deleteExpanse(id);
    if(delete>0){
      expansesList.removeWhere((element) => element.id==id);
      notifyListeners();
    }
  }


  void getAllIncome(){
    DBHalper.getAllIncome().then((value){
      incomeList=value;
      notifyListeners();
    });
  }
  void getAllExpanses(){
    DBHalper.getAllExpanses().then((value){
     expansesList=value;
      notifyListeners();
    });
  }

  void totalBalance(){
      totalExpanse=0.0;
      totalBalanceAmount=0.0;
      totalIncome=0.0;
    for(var incomeAmount in incomeList){
      double income=double.parse(incomeAmount.incomeamount);
      totalIncome+=income;
    }
    for(var expansesAmount in expansesList){
      double expanses=double.parse(expansesAmount.amount);
      totalExpanse+=expanses;
    }
     totalBalanceAmount = (totalIncome-totalExpanse);
  }

  updateIncome(int id,String title,String amount)async{
    final status = await DBHalper.updateincomeData(id, title, amount);
    notifyListeners();
    return status>0?true:false;

  }
  updateExpanses(int id,String title,String amount)async{
    final status = await DBHalper.updateExpanseData(id, title, amount);
    notifyListeners();
    return status>0?true:false;

  }



}