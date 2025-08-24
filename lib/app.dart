

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_match/screens/home_screen.dart';

class MatchUpdate extends StatelessWidget{
  const MatchUpdate({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      //  home: HomeScreen(),
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

          textTheme: const  TextTheme(
              titleSmall: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  color: Colors.black


              )

          )


      ),

      initialRoute:HomeScreen.name,

      routes: {

        HomeScreen.name  : (context) => HomeScreen(),
        //  MatchInfoScreen.name : (context) => MatchInfoScreen()


      },

    );

  }


}