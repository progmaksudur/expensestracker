import 'package:expanse_tracker_sql/model/expanses_model.dart';
import 'package:expanse_tracker_sql/model/income_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../model/expanses_category.dart';
import '../model/income_category.dart';
import '../provider/expanse_tracker_provider.dart';
import '../utility/category_type_icon.dart';
import '../utility/colors.dart';
import '../utility/font_theam.dart';

showMsg(BuildContext context, String msg,) =>
    ScaffoldMessenger
        .of(context)
        .showSnackBar(SnackBar(content: Text(msg)));

String getFormattedDateTime(DateTime dateTime, String pattern) =>
    DateFormat(pattern).format(dateTime);

CatagoryExpanses getExpansesCategoryModelByTitle(String title){
  return expansesDropDownList.firstWhere((element) => element.title==title);
}
IncomeCataegory getIncomeCategoryModelByTitle(String title){
  return incomeDropDownList.firstWhere((element) => element.title==title);
}

