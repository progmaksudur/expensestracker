import 'package:expanse_tracker_sql/database/db_halper.dart';
import 'package:expanse_tracker_sql/model/expanses_model.dart';
import 'package:flutter/cupertino.dart';

class ExpansesTrackerProvider extends ChangeNotifier{

  Future createDatabaase()async{
    DBHalper.open();
  }

  Future<bool> addData(ExpansesTrackerModel expansesTrackerModel)async{
      final insertid=await DBHalper.insertExpanse(expansesTrackerModel);

    return insertid>0?true:false;
  }


}