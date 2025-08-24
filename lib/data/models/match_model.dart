
class MatchModel {
  final String id;
  final String team1_name;
  final int team1_goal;
  final String team2_name;
  final int team2_goal;
  final double curent_time;
  final int match_time;


  MatchModel({
    required this.id,
    required this.team1_name,
    required this.team2_name,
    required this.team1_goal,
    required this.team2_goal,
    required this.curent_time,
    required this.match_time


  });




  Map<String,dynamic> toMap() {

    return {

      "team1_name" : team1_name,
      "team2_name" : team2_name,
      "team1_goal" : team1_goal,
      "team2_goal" : team2_goal,
      "match_time" : match_time,
      "current_time" : curent_time


    };


  }





}