import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sport_news/data/models/match.dart';

class HockeyDatasource {
  final String apiKey = 'e0fbe3beaaed6d5b1321d8a9cbeaf93a';
  final String apiHost = 'v1.hockey.api-sports.io';
  final String endpoint = 'games';

  Future<List<MatchModel>> matches() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String lastUpdateDate = prefs.getString('hockeyLastUpdateDate') ?? '';
    final DateTime now = DateTime.now();
    final String todayDate = DateFormat('yyyy-MM-dd').format(now);
    if (lastUpdateDate != todayDate) {
      final response = await http.get(
        Uri.https(apiHost, endpoint, {'date': todayDate}),
        headers: {
          'x-rapidapi-host': apiHost,
          'x-rapidapi-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        await prefs.setString('hockeyLastUpdateDate', todayDate);
        await prefs.setString('hockeyCachedData', json.encode(data));
        return (data['response'] as List<dynamic>)
            .map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } else {
      final String cachedData = prefs.getString('hockeyCachedData') ?? '';
      if (cachedData.isNotEmpty) {
        final data = json.decode(cachedData);
        return (data['response'] as List<dynamic>)
            .map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Cached data is empty');
      }
    }
  }

  Future<List<MatchModel>> matchesByDate(DateTime dateTime) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    final String cachedData = prefs.getString('hockeyCachedData') ?? '';
    if (cachedData.isNotEmpty) {
      final data = json.decode(cachedData);
      await Future.delayed(const Duration(seconds: 1));

      return (data['response'] as List<dynamic>)
          .map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    final date = DateFormat('yyyy-MM-dd').format(dateTime);
    final String lastUpdateDate = prefs.getString('hockeyLastUpdateDate') ?? '';
    if (lastUpdateDate != date) {
      final response = await http.get(
        Uri.https(apiHost, endpoint, {'date': date}),
        headers: {
          'x-rapidapi-host': apiHost,
          'x-rapidapi-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        await prefs.setString('hockeyLastUpdateDate', date);
        await prefs.setString('hockeyCachedData', json.encode(data));
        return (data['response'] as List<dynamic>)
            .map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } else {
      final String cachedData = prefs.getString('hockeyCachedData') ?? '';
      if (cachedData.isNotEmpty) {
        final data = json.decode(cachedData);
        return (data['response'] as List<dynamic>)
            .map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Cached data is empty');
      }
    }
  }
}
