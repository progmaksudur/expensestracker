import 'package:expanse_tracker_sql/model/income_model.dart';
import 'package:expanse_tracker_sql/provider/expanse_tracker_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../utility/category_type_icon.dart';
import '../utility/colors.dart';
import '../utility/font_theam.dart';
import 'helper_function.dart';




  void FilterData(BuildContext context,int n) {
    DateTime? startMonthDate;
    DateTime? endMonthDate;
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return StatefulBuilder(
            builder: (context, setState) {
           void startSelectDate() async {
             DateTime? selectedDate = await showDatePicker(
                 context: context,
                 initialDate: DateTime.now(),
                 firstDate: DateTime(2020),
                 lastDate: DateTime.now());

             if (selectedDate != null) {
               setState(() {
                 startMonthDate = selectedDate;
               });
             }
            }
           void endSelectDate() async {
             DateTime? selectedDate = await showDatePicker(
                 context: context,
                 initialDate: DateTime.now(),
                 firstDate: DateTime(2020),
                 lastDate: DateTime.now());

             if (selectedDate != null) {
               setState(() {
                 endMonthDate = selectedDate;
               });
             }
           }
              return Container(
                  height: 350.0,
                  width: double.infinity,
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("Filter Out Data",style: GoogleFonts.ptSerif(textStyle: exTitle3),)),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              child: Text(
                                "Select Date",
                                style: GoogleFonts.ptSerif(
                                  textStyle: exTitle2,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              startMonthDate == null
                                  ? "Choose Date"
                                  : "${getFormattedDateTime(startMonthDate!, 'dd/MM/yyyy')}",
                              style: GoogleFonts.ptSerif(textStyle: exTitle6),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                                onPressed: startSelectDate,
                                icon: Icon(
                                  Icons.date_range,
                                  size: 25,
                                  color: buttonColorSecondary,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              child: Text(
                                "Select End Date",
                                style: GoogleFonts.ptSerif(
                                  textStyle: exTitle2,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              endMonthDate == null
                                  ? "Choose Date"
                                  : "${getFormattedDateTime(endMonthDate!, 'dd/MM/yyyy')}",
                              style: GoogleFonts.ptSerif(textStyle: exTitle6),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            IconButton(
                                onPressed: endSelectDate,
                                icon: Icon(
                                  Icons.date_range,
                                  size: 25,
                                  color: buttonColorSecondary,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: ElevatedButton(
                          child: Text('Filter Data',style: GoogleFonts.ptSerif(textStyle: spBTitle1),),
                          onPressed: () {
                            filterData(n,context);
                          },
                        ),
                      ),
                    ],
                  ),
              );
              }
          );
        });
  }
  void filterData(int n,BuildContext context){
    List<IncomeModel> FilterincomeList=[];
    final provider=Provider.of<ExpansesTrackerProvider>(context,listen: false);

    if(n==1){
      for(IncomeModel im in provider.incomeList){

      }
    }
  }




