
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/match_model.dart';

class MatchCard extends StatefulWidget {

  final VoidCallback onclick;
  final MatchModel model;

  const MatchCard({super.key,

    required this.onclick,
    required this.model

  });

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap:widget.onclick ,

      child: Card(
        color: Colors.white,
        child: Row(

          children: [

            Expanded(
              flex: 4,
              child: Column(

                children: [

                  Row(
                    children: [

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: const Color(0xFFF5D047),
                              ),
                              const SizedBox(width: 10),
                              // Text takes remaining space
                              Expanded(
                                child: Text(
                                  widget.model.team1_name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Right side: Score
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          widget.model.team1_goal.toString(),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),






                  Row(



                    children: [

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 10),
                          child: Row( // for first   2 value

                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: const Color(0xFF36003A),
                              ),

                              const SizedBox(width: 10),

                              Expanded(
                                child: Text(
                                  widget.model.team2_name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),



                            ],


                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          widget.model.team2_goal.toString(),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),









                    ],


                  )




                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(Icons.arrow_forward,size: 30,color: Color(0xFF008E69),),
            )






          ],


        ),
      ),
    );
  }






}