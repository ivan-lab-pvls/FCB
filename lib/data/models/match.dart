class MatchModel {
  const MatchModel({
    required this.homeTeamTitle,
    required this.homeTeamLogo,
    required this.awayTeamTitle,
    required this.awayTeamLogo,
    required this.time,
    required this.league,
  });
  final String homeTeamTitle;
  final String homeTeamLogo;
  final String awayTeamTitle;
  final String awayTeamLogo;
  final DateTime time;
  final String league;

  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      MatchModel(
        homeTeamTitle: json['teams']['home']['name'],
        homeTeamLogo: json['teams']['home']['logo'],
        awayTeamTitle: json['teams']['away']['name'],
        awayTeamLogo: json['teams']['away']['logo'],
        time: DateTime.fromMillisecondsSinceEpoch(
          json['timestamp'] * 1000,
        ),
        league: json['league']['name'],
      );
}