import 'package:expanse_tracker_sql/model/expanses_category.dart';
import 'package:expanse_tracker_sql/pages/noted_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/expanses_model.dart';
import '../model/income_model.dart';
import '../provider/expanse_tracker_provider.dart';
import '../utility/colors.dart';
import '../utility/category_type_icon.dart';
import '../utility/font_theam.dart';
import '../widgets/helper_function.dart';
import '../widgets/iteam_short_details.dart';
import '../widgets/show_income_button_sheet.dart';

class ExpansesDashboard extends StatefulWidget {
  static const String routeName = "/dashboard";
  const ExpansesDashboard({Key? key}) : super(key: key);

  @override
  State<ExpansesDashboard> createState() => _ExpansesDashboardState();
}

class _ExpansesDashboardState extends State<ExpansesDashboard> {
  String incomeMonth=DateTime.now().month.toString();
  String expanseMonth=DateTime.now().month.toString();
 @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<ExpansesTrackerProvider>(context, listen: true);
    dataProvider.totalBalance();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<ExpansesTrackerProvider>(
        builder: (context, provider, _) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: buttonColorSecondary.withOpacity(.1),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: FittedBox(
                              child: Text("Total Balance",
                                  style:
                                  GoogleFonts.ptSerif(textStyle: exTitle1)),
                            ),
                          ),
                          Center(
                            child: FittedBox(
                              child: Text("\$ ${provider.totalBalanceAmount}",
                                  style:
                                  GoogleFonts.ptSerif(textStyle: exTitle1)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                child: Text("Total Income",
                                    style:
                                    GoogleFonts.ptSerif(textStyle: exTitle2)),
                              ),
                              FittedBox(
                                child: Text("Total Expanses",
                                    style:
                                    GoogleFonts.ptSerif(textStyle: exTitle2)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: FittedBox(
                                  child: Text("\$ ${provider.totalIncome}",
                                      style: GoogleFonts.ptSerif(
                                          textStyle: exTitle2)),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: FittedBox(
                                  child: Text("\$ ${provider.totalExpanse}",
                                      style: GoogleFonts.ptSerif(
                                          textStyle: exTitle2)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: (size.width / 2) - 90,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: 45,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: buttonColorPrimary,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, NotedPage.routeName);
                                  },
                                  child: Text(
                                    "Add",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Container(
            width: double.infinity,
            height: 350,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: FittedBox(
                          child: Text("Income",
                              style:
                              GoogleFonts.ptSerif(textStyle: exTitle3)),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: FittedBox(
                          child: Text("${monthName[int.parse(incomeMonth)-1]}",
                              style:
                              GoogleFonts.ptSerif(textStyle: exTitle5)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: FittedBox(
                            child: IconButton(
                              icon: Icon(
                                Icons.filter_alt,
                                size: 25,
                                color: textColorSecondaryDeep,
                              ),
                              onPressed: () {
                                provider.totalBalance();
                              },
                            )),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:provider.incomeList.isNotEmpty?ListView.builder(itemCount: provider.incomeList.length,itemBuilder: (context, index){
                          final incomes=provider.incomeList[index];
                          var date = new DateTime.fromMicrosecondsSinceEpoch(incomes.incomeTimestamp* 1000);
                          String time=getFormattedDateTime(date,'dd/MM/yyyy');
                          final incomeCat=getIncomeCategoryModelByTitle(incomes.incomeTitle);
                          return Dismissible(
                            key: ValueKey(incomes.id),
                            direction: DismissDirection.endToStart,
                            confirmDismiss: _showConfirmationDialog,
                            onDismissed: (direction) {
                              provider.deleteIncomeData(incomes.id);
                            },
                            child: InkWell(
                              onLongPress: (){
                                Navigator.pushNamed(context,UpdateIncome.routeName,arguments: incomes);
                              },
                              child: IteamShortDetails(
                                  typeIconData: Icons.arrow_circle_up,
                                  title: incomes.incomeTitle,
                                  amount:incomes.incomeamount,
                                  time: time,
                                  titleIconData: incomeCat.icon),
                            ),
                          );

                        },):Text("Empty"),
                      )),
                ],
              ),
            )),
            Container(
                width: double.infinity,
                height: 350,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: FittedBox(
                              child: Text("Expanses",
                                  style:
                                  GoogleFonts.ptSerif(textStyle: exTitle3)),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: FittedBox(
                              child: Text("${monthName[int.parse(expanseMonth)-1]}",
                                  style:
                                  GoogleFonts.ptSerif(textStyle: exTitle5)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: FittedBox(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.filter_alt,
                                    size: 25,
                                    color: textColorSecondaryDeep,
                                  ),
                                  onPressed: () {},
                                )),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(itemCount:provider.expansesList.length,itemBuilder: (context, index){
                              final expanses=provider.expansesList[index];
                              var date = new DateTime.fromMicrosecondsSinceEpoch(expanses.expansesTimestamp* 1000);
                              String time=getFormattedDateTime(date,'dd/MM/yyyy');
                              final expansesCat=getExpansesCategoryModelByTitle(expanses.expansesTitle);

                              return Dismissible(
                                key: ValueKey(expanses.id),
                                direction: DismissDirection.endToStart,
                                confirmDismiss: _showConfirmationDialog,
                                onDismissed: (direction) {
                                  provider.deleteExpansesData(expanses.id);
                                },
                                child: IteamShortDetails(
                                    typeIconData: Icons.arrow_circle_down,
                                    title: expanses.expansesTitle,
                                    amount:expanses.amount,
                                    time: time,
                                    titleIconData: expansesCat.icon),
                              );
                            },),
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
  Future<bool?> _showConfirmationDialog(DismissDirection direction) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title:  Text('D e l e t e'),
          content: Text('Are you sure to delete this?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('NO'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('YES'),
            ),
          ],
        ));
  }

}
