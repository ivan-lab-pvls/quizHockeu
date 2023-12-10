import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as api;

class HockeyRep {
  final String apiKey = '6b5e993ad23a4d155b992de4e5db82a6';
  final String apiHost = 'v1.hockey.api-sports.io';
  final String endpoint = '/games';

  Future<List<Match>> matches() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String yesterday = prefs.getString('lastUpdateDate') ?? '';
    final String today = getFormattedToday();
    if (yesterday != today) {
      final Uri url = Uri.https(apiHost, endpoint, {'date': today});
      final response = await api.get(
        url,
        headers: {
          'x-rapidapi-host': apiHost,
          'x-rapidapi-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        await prefs.setString('lastUpdateDate', today);
        await prefs.setString('cachedData', json.encode(data));
        return (data['response'] as List)
            .map((e) => Match.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
            'Failed to load data with status code: ${response.statusCode}');
      }
    } else {
      final String cachedData = prefs.getString('cachedData') ?? '';
      if (cachedData.isNotEmpty) {
        final data = json.decode(cachedData);
        return (data['response'] as List)
            .map((e) => Match.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Cached data is empty');
      }
    }
  }

  Future<List<Match>> matchesByDate(String date) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String lastUpdateDate = prefs.getString('lastUpdateDate') ?? '';
    if (lastUpdateDate != date) {
      final response = await api.get(
        Uri.https(apiHost, endpoint, {'date': date}),
        headers: {
          'x-rapidapi-host': apiHost,
          'x-rapidapi-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        await prefs.setString('lastUpdateDate', date);
        await prefs.setString('cachedData', json.encode(data));
        return (data['response'] as List<dynamic>)
            .map((e) => Match.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } else {
      final String cachedData = prefs.getString('cachedData') ?? '';
      if (cachedData.isNotEmpty) {
        final data = json.decode(cachedData);
        return (data['response'] as List<dynamic>)
            .map((e) => Match.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Cached data is empty');
      }
    }
  }
}

class Match {
  const Match({
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

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        homeTeamTitle: json['teams']['home']['name'],
        homeTeamLogo: json['teams']['home']['logo'],
        awayTeamTitle: json['teams']['away']['name'],
        awayTeamLogo: json['teams']['away']['logo'],
        time: DateTime.parse(json['date']),
        league: json['league']['name'],
      );
}

String getFormattedToday() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  return formattedDate;
}
