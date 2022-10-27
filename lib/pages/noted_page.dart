import 'package:expanse_tracker_sql/model/expanses_model.dart';
import 'package:expanse_tracker_sql/model/income_category.dart';
import 'package:expanse_tracker_sql/model/income_model.dart';
import 'package:expanse_tracker_sql/provider/expanse_tracker_provider.dart';
import 'package:expanse_tracker_sql/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/expanses_category.dart';
import '../utility/category_type_icon.dart';
import '../utility/font_theam.dart';
import '../widgets/helper_function.dart';

class NotedPage extends StatefulWidget {
  static const String routeName = "/notedpage";
  const NotedPage({Key? key}) : super(key: key);

  @override
  State<NotedPage> createState() => _NotedPageState();
}

class _NotedPageState extends State<NotedPage> {
  final insertAnountController = TextEditingController();
  DateTime? dateTime;
  int? iconData;
  String? _category;
  String? cashin;
  int? expansesType;
  @override
  void dispose() {
    // TODO: implement dispose
    insertAnountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: buttonColorSecondary.withOpacity(.1)),
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  "Insert Your Data",
                  style: GoogleFonts.ptSerif(textStyle: exTitle1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: Text(
                      "Select Your data type",
                      style: GoogleFonts.ptSerif(
                        textStyle: exTitle2,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          title: Text("Expanse"),
                          value: 1,
                          groupValue: expansesType,
                          onChanged: (value) {
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
                          onChanged: (value) {
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Text(
                            expansesType == 2
                                ? "Income Catagory"
                                : "Expanses Category",
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
                            value: _category,
                            items: expansesType == 1
                                ? expansesDropDownList.map((category) {
                                    return DropdownMenuItem(
                                      value: category.title,
                                      child: Text(category.title),
                                    );
                                  }).toList()
                                : incomeDropDownList.map((category) {
                                    return DropdownMenuItem(
                                      value: category.title,
                                      child: Text(category.title),
                                    );
                                  }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _category = newValue.toString();
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
                          child: Text(
                            "Select Date",
                            style: GoogleFonts.ptSerif(
                              textStyle: exTitle2,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          dateTime == null
                              ? "Choose Date"
                              : "${getFormattedDateTime(dateTime!, 'dd/MM/yyyy')}",
                          style: GoogleFonts.ptSerif(textStyle: exTitle6),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: _selectDate,
                            icon: Icon(
                              Icons.date_range,
                              size: 25,
                              color: buttonColorSecondary,
                            )),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        child: Text(
                          "Amount \(Bdt)",
                          style: GoogleFonts.ptSerif(
                            textStyle: exTitle2,
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 55,
                        width: size.width / 2,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: buttonColorSecondary.withOpacity(.1)),
                        child: TextFormField(
                          controller: insertAnountController,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "Transection Type",
                      style: GoogleFonts.ptSerif(
                        textStyle: exTitle2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: buttonColorSecondary.withOpacity(.1)),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: 130,
                            child: RadioListTile(
                              title: Text("Cash"),
                              value: "Cash",
                              groupValue: cashin,
                              onChanged: (value) {
                                setState(() {
                                  cashin = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: RadioListTile(
                              title: Text("Card"),
                              value: "Card",
                              groupValue: cashin,
                              onChanged: (value) {
                                setState(() {
                                  cashin = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: RadioListTile(
                              title: Text("Online"),
                              value: "Online",
                              groupValue: cashin,
                              onChanged: (value) {
                                setState(() {
                                  cashin = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 55,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: buttonColorPrimary,
                        ),
                        child: TextButton(
                          onPressed: _saveData,
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now());

    if (selectedDate != null) {
      setState(() {
        dateTime = selectedDate;
      });
    }
  }

  void _saveData() async {
    final provider =
        Provider.of<ExpansesTrackerProvider>(context, listen: false);
    String trnsAmount = insertAnountController.text;
    if (expansesType == null) {
      showMsg(context, "Choose your data type ");
    }
    if (_category == null) {
      showMsg(context, "Choose your Category type ");
    }
    if (dateTime == null) {
      showMsg(context, "Choose your Date");
    }
    if (trnsAmount == null || trnsAmount.isEmpty) {
      showMsg(
          context,
          expansesType == 2
              ? "Choose Income amount"
              : "Choose Expanses amount");
    }
    if (cashin == null) {
      showMsg(context, "Choose Transection type");
    }
    final status = provider.saveData(
        trnsAmount, _category!, cashin!, expansesType!, dateTime!);
    if (await status) {
      insertAnountController.clear();
      showMsg(context, "SuccessFully Done");
      provider.getAllIncome();
      provider.getAllExpanses();
      provider.totalBalance();
      Navigator.pop(context);
    }
  }
}
