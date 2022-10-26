import 'package:expanse_tracker_sql/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../model/expanses_category.dart';
import '../utility/expanses_type_icon.dart';
import '../utility/font_theam.dart';

class NotedPage extends StatefulWidget {
  static const String routeName="/notedpage";
  const NotedPage({Key? key}) : super(key: key);

  @override
  State<NotedPage> createState() => _NotedPageState();
}

class _NotedPageState extends State<NotedPage> {
  
  final insertAnountController=TextEditingController();
  DateTime? dateTime;
  int? iconData;
  String? _category;
  int? cashin;
  int? expansesType;
  @override
  void dispose() {
    // TODO: implement dispose
    insertAnountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: buttonColorSecondary.withOpacity(.1)
        ),
        child: ListView(

          children: [
            Center(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              child: Text("Insert Your Data",style: GoogleFonts.ptSerif(textStyle: exTitle1),),
            ),),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
                    child: Text("Select Your data type",style: GoogleFonts.ptSerif(textStyle: exTitle2,),),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          title: Text("Expanse"),
                          value: 1,
                          groupValue: expansesType,
                          onChanged: (value){
                            setState(() {
                              expansesType = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: Text("Income"),
                          value: 2,
                          groupValue: expansesType,
                          onChanged: (value){
                            setState(() {
                              expansesType = value;
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
                          child: Text(expansesType==2?"Income Catagory":"Expanses Category",style: GoogleFonts.ptSerif(textStyle: exTitle2,),),
                        ),
                        Spacer(),
                        DropdownButton(
                            hint: Text(
                              "No category selected",
                            ),
                            value: _category,
                            items:expansesDropDownList.map((category){
                              return DropdownMenuItem(
                                value: category.title,

                                child: Text(category.title),
                              );
                            }).toList(),
                            onChanged: (newValue){
                              setState(() {
                                _category=newValue.toString();
                              });
                            }),


                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
                          child: Text("Select Date",style: GoogleFonts.ptSerif(textStyle: exTitle2,),),
                        ),
                        Spacer(),
                        Text(dateTime==null?"Chose Date":"${getFormattedDateTime(dateTime!,'dd/MM/yyyy')}",style: GoogleFonts.ptSerif(textStyle: exTitle6),),
                        SizedBox(width: 20,),
                        IconButton(onPressed: _selectDate, icon: Icon(Icons.date_range,size: 25,color: buttonColorSecondary,)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 2),
                        child: Text("Amount \(Bdt)",style: GoogleFonts.ptSerif(textStyle: exTitle2,),),
                      ),
                      Spacer(),
                      Container(
                          height: 55,
                          width: size.width/2,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: buttonColorSecondary.withOpacity(.1)
                          ),
                          child: TextFormField(
                            controller: insertAnountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.attach_money,color:buttonColorPrimary,size: 25,),
                            ),


                          ),)
                    ],
                  ),







                ],
              ),
            ),



          ],

        ),
      ),
    );
  }
  CatagoryExpanses getCategoryModelByTitle(String title){
    return expansesDropDownList.firstWhere((element) => element.title==title);
  }
  void _selectDate() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now());

    if (selectedDate != null) {
      setState(() {
        dateTime= selectedDate;
      });
    }
  }
  String getFormattedDateTime(DateTime dateTime, String pattern) =>
      DateFormat(pattern).format(dateTime);

}
