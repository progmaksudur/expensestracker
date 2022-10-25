import 'package:expanse_tracker_sql/pages/noted_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/colors.dart';
import '../utility/expanses_type_icon.dart';
import '../utility/font_theam.dart';
import '../widgets/iteam_short_details.dart';

class ExpansesDashboard extends StatefulWidget {
  static const String routeName="/dashboard";
  const ExpansesDashboard({Key? key}) : super(key: key);

  @override
  State<ExpansesDashboard> createState() => _ExpansesDashboardState();
}

class _ExpansesDashboardState extends State<ExpansesDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(flex :2,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.all(4),
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
                        child: Text("Total Balance",style:GoogleFonts.ptSerif(textStyle: exTitle1)),
                      ),
                    ),
                    Center(
                      child: FittedBox(
                        child: Text("\$ 5000",style:GoogleFonts.ptSerif(textStyle: exTitle1)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: Text("Total Income",style:GoogleFonts.ptSerif(textStyle: exTitle2)),
                        ),
                        FittedBox(
                          child: Text("Total Expanses",style:GoogleFonts.ptSerif(textStyle: exTitle2)),
                        ),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: FittedBox(
                            child: Text("\$ 7000",style:GoogleFonts.ptSerif(textStyle: exTitle2)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: FittedBox(
                            child: Text("\$ 2000",style:GoogleFonts.ptSerif(textStyle: exTitle2)),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          )),
          Expanded(flex: 3,child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                        child: FittedBox(
                          child: Text("Tracking",style:GoogleFonts.ptSerif(textStyle: exTitle3)),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                        child: FittedBox(
                          child: Text("Janaury",style:GoogleFonts.ptSerif(textStyle: exTitle5)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                        child: FittedBox(
                          child: IconButton(
                            icon: Icon(Icons.filter_alt,size:25,color: textColorSecondaryDeep,),
                            onPressed: (){},
                          )
                        ),
                      ),

                    ],
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView(
                      children: [
                        IteamShortDetails(typeIconData: Icons.ac_unit, title: "title", amount:"amount", time: "time",titleIconData: expansesIcon[1],),
                        IteamShortDetails(typeIconData: Icons.ac_unit, title: "title", amount:"amount", time: "time",titleIconData: expansesIcon[2],),
                        IteamShortDetails(typeIconData: Icons.ac_unit, title: "title", amount:"amount", time: "time",titleIconData: expansesIcon[3],),
                        IteamShortDetails(typeIconData: Icons.ac_unit, title: "title", amount:"amount", time: "time",titleIconData: expansesIcon[1],),
                        IteamShortDetails(typeIconData: Icons.ac_unit, title: "title", amount:"amount", time: "time",titleIconData: expansesIcon[2],),
                        IteamShortDetails(typeIconData: Icons.ac_unit, title: "title", amount:"amount", time: "time",titleIconData: expansesIcon[3],),
                      ],

                    ),
                  )),
                  Padding(
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
                            onPressed: (){
                              Navigator.pushNamed(context, NotedPage.routeName);
                            },
                            child: Text("Noted",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ),),


        ],
      ),

    );
  }
}
