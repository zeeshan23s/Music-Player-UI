import 'dart:convert';

import 'package:music_app/models/songs.dart';
import 'package:dio/dio.dart';

class SongController {
  static final dio = Dio();

  static Future<List<Songs>> latestSongs() async {
    final request = await dio.get(
        'https://itunes.apple.com/search?term=latest&country=us&media=music');

    if (request.statusCode == 200) {
      final response = jsonDecode(request.data as String);
      List<dynamic> data = response['results'];

      List<Songs> appLatestSongs = [];

      for (var element in data) {
        appLatestSongs.add(Songs.fromJson(element));
      }
      return appLatestSongs;
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  static Future<List<Songs>> popularSongs() async {
    final request = await dio.get(
        'https://itunes.apple.com/search?term=popular&country=us&media=music');

    if (request.statusCode == 200) {
      final response = jsonDecode(request.data as String);
      List<dynamic> data = response['results'];

      List<Songs> appPopularSongs = [];

      for (var element in data) {
        appPopularSongs.add(Songs.fromJson(element));
      }
      return appPopularSongs;
    } else {
      throw Exception('Failed to load data from the API');
    }
  }
}
