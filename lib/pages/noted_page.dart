import 'package:expanse_tracker_sql/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/expanses_type_icon.dart';
import '../utility/font_theam.dart';

class NotedPage extends StatefulWidget {
  static const String routeName="/notedpage";
  const NotedPage({Key? key}) : super(key: key);

  @override
  State<NotedPage> createState() => _NotedPageState();
}

class _NotedPageState extends State<NotedPage> {
  final formKey = GlobalKey<FormState>();
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
            Form(
                key: formKey,
                child:Padding(
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
                      Row(
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




                    ],
                  ),
                )),



          ],

        ),
      ),
    );
  }
}
