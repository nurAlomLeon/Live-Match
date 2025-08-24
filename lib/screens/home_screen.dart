
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_match/screens/widget/match_card.dart';

import '../data/models/match_model.dart';
import 'match_info_screen.dart';

class HomeScreen extends StatefulWidget {

  static const String name="/homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<MatchModel> _matchList=[];
  FirebaseFirestore db=FirebaseFirestore.instance;
  bool _isLoading=false;


  // Future<void> _fetchData() async{
  //
  //   setState(() {
  //     _isLoading=true;
  //   });
  //
  //   _matchList.clear();
  //
  //     QuerySnapshot snapshots  = await db.collection("football").get();
  //
  //     for(QueryDocumentSnapshot doc in snapshots.docs){
  //
  //       MatchModel model=MatchModel(
  //             id: doc.id,
  //           team1_name: doc["team1_name"],
  //           team2_name: doc["team2_name"],
  //           team1_goal:doc["team1_goal"],
  //           team2_goal:doc["team2_goal"],
  //           curent_time: doc["current_time"],
  //           match_time: doc["match_time"]
  //       );
  //
  //
  //       _matchList.add(model);
  //
  //
  //     }
  //
  //     await Future.delayed(Duration(seconds: 1));
  //
  //   setState(() {
  //
  //     _isLoading=false;
  //
  //   });
  //
  //
  // }
  //
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //
  //   _fetchData();
  //   super.initState();
  // }
  //
  //



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFE62F2F),
      appBar: AppBar(
        title: Text("Live Score Updates"),
          //backgroundColor: Colors.redAccent,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 30,),

              // Text("Live\nMatches",style:TextStyle(fontSize: 40),)


              RichText(
                text: TextSpan(

                    style: TextStyle( // it is default value  if not overrride then it  will set
                        fontSize:34,
                        fontWeight: FontWeight.bold,
                        color: Colors.white

                    ) ,





                ),
              ),

              const  SizedBox(
                height: 20,
              ),



              StreamBuilder<QuerySnapshot>(
                  stream: db.collection("football").snapshots(),


                  builder: (context,snapshots){

                    if(snapshots.hasError){

                      return   Center(

                        child: Text("Something went wrong"),
                      );
                    }

                    if(snapshots.connectionState==ConnectionState.waiting){


                      return Center(child: CircularProgressIndicator(
                        color: Colors.white,
                      ),);
                    }


                    if(snapshots.hasData){

                      _matchList.clear();

                      for(QueryDocumentSnapshot doc in snapshots.data!.docs){

                        MatchModel model=MatchModel(
                            id: doc.id,
                            team1_name: doc["team1_name"],
                            team2_name: doc["team2_name"],
                            team1_goal:doc["team1_goal"],
                            team2_goal:doc["team2_goal"],
                            curent_time: doc["current_time"],
                            match_time: doc["match_time"]
                        );


                        _matchList.add(model);


                      }





                    }




                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),

                      itemBuilder: (context,index){



                        final model=_matchList[index];

                        return MatchCard(onclick: (){


                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MatchInfoScreen(
                            model: model,

                          )));

                        },
                            model: model
                        );


                      },

                      itemCount: _matchList.length,


                    );




                  }



              )








            ],




          ),
        ),
      ),




    );
  }
}