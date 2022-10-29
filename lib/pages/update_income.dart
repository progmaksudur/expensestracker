import 'package:expanse_tracker_sql/model/expanses_model.dart';
import 'package:expanse_tracker_sql/provider/expanse_tracker_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/income_model.dart';
import '../utility/category_type_icon.dart';
import '../utility/colors.dart';
import '../utility/font_theam.dart';
import '../widgets/helper_function.dart';

class UpdateIncome extends StatefulWidget {
  static const String routeName="/updateincome";
  const UpdateIncome({Key? key}) : super(key: key);

  @override
  State<UpdateIncome> createState() => _UpdateIncomeState();
}

class _UpdateIncomeState extends State<UpdateIncome> {
  final updateAnountController = TextEditingController();
  late IncomeModel incomeModel;
  String? category;
  DateTime? dateTime;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
     incomeModel=ModalRoute.of(context)!.settings.arguments as IncomeModel;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    updateAnountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(incomeModel.incomeTimestamp* 1000);
    String time=getFormattedDateTime(date,'dd/MM/yyyy');
    return Scaffold(
        body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: ListView(
            children:[
              Center(child: Text('Data Update',style: GoogleFonts.ptSerif(textStyle: exTitle8),)),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Text("Previous title--->",
                        style: GoogleFonts.ptSerif(
                          textStyle: exTitle2,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Text("${incomeModel.incomeTitle}",
                        style: GoogleFonts.ptSerif(
                          textStyle: exTitle2,
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Text("Income Catagory",
                        style: GoogleFonts.ptSerif(
                          textStyle: exTitle2,
                        ),
                      ),
                    ),
                    Spacer(),
                    DropdownButton(
                        hint: Text(
                          "No category selected",
                        ),
                        value: category,
                        items:incomeDropDownList.map((category) {
                          return DropdownMenuItem(
                            value: category.title,
                            child: Text(category.title),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            category = newValue.toString();
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Text("Previous Amount--->",
                        style: GoogleFonts.ptSerif(
                          textStyle: exTitle2,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Text("${incomeModel.incomeamount}",
                        style: GoogleFonts.ptSerif(
                          textStyle: exTitle2,
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 2),
                    child: Text(
                      "New Amount",
                      style: GoogleFonts.ptSerif(
                        textStyle: exTitle2,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 55,
                    width: 200,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: buttonColorSecondary.withOpacity(.1)),
                    child: TextFormField(
                      controller: updateAnountController,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.ptSerif(textStyle: exTitle7),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.attach_money,
                          color: buttonColorPrimary,
                          size: 25,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Text(" Date of data",
                        style: GoogleFonts.ptSerif(
                          textStyle: exTitle2,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Text("${time}",
                        style: GoogleFonts.ptSerif(
                          textStyle: exTitle2,
                        ),
                      ),
                    ),


                  ],
                ),
              ),

              SizedBox(height: 40,),
              ElevatedButton(
                child: Text('Update Data',style: GoogleFonts.ptSerif(textStyle: spBTitle1),),
                onPressed: () {
                  updateData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  updateData()async{
    final provider=Provider.of<ExpansesTrackerProvider>(context,listen: false);
    String updatetitle=category.toString();
    String updateamount=updateAnountController.text;
    String? title;
    String amount;
    if(updatetitle!=null && updatetitle.isNotEmpty){
      title=updatetitle;
    }
    if(updateamount!=null && updateamount.isNotEmpty){
      amount=updateamount;
    }
    else{
      title=incomeModel.incomeTitle;
      amount=incomeModel.incomeamount;
    }
    final status= provider.updateIncome(incomeModel.id,title!,amount);
    if(await status){
      print(status);
      updateAnountController.clear();
      category="";
      provider.getAllIncome();
      provider.totalBalance();
      Navigator.pop(context);
    }


  }
}

