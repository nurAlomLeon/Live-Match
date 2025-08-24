
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/models/match_model.dart';

class MatchInfoScreen extends StatefulWidget {

  static const String name="/matchInfoScreen";

  final MatchModel model;

  const MatchInfoScreen({super.key,
    required this.model
  });

  @override
  State<MatchInfoScreen> createState() => _MatchInfoScreenState();
}

class _MatchInfoScreenState extends State<MatchInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.model.id,style: TextStyle(fontSize: 20,color:Colors.white),),
        backgroundColor: Colors.redAccent,
      ),



      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,

          child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [

                const  SizedBox(height: 12,),


                /// first row
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Column(
                      children: [
                        Container(

                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0xFF008E69),
                                  width: 2
                              )
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(

                              radius:35,
                              backgroundColor:Color(0xFFF5D047),



                            ),
                          ),
                        ),
                        const SizedBox(height:8,),
                        Text(widget.model.team1_name,style:TextTheme.of(context).titleSmall,)

                      ],
                    ),

                    // const  SizedBox(width: 10,),

                    Text("${widget.model.team1_goal} : ${widget.model.team2_goal}",style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold),),


                    Column(
                      children: [
                        Container(

                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0xFF9E090F),
                                  width: 2
                              )
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(

                              radius:35,
                              backgroundColor:Color(0xFF36003A),



                            ),
                          ),
                        ),

                        Text(widget.model.team2_name,style:TextTheme.of(context).titleSmall,)

                      ],
                    )



                  ],

                ),


                /// second  row

                Text(widget.model.curent_time.toString(),style:TextTheme.of(context).titleSmall,),

                const SizedBox(height:6,),
                Text(widget.model.match_time.toString(),style:TextTheme.of(context).titleSmall,),








              ],





            ),
          ),

        ),
      ),




    );
  }
}