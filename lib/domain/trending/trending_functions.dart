import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/apikey.dart';
import 'package:netflix_clone/domain/trending/trending.dart';

Future<List<Result>> getImageTrending() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/trending/all/week?api_key=$apikey'));
  if (response.statusCode == 200) {
    final jsondata = jsonDecode(response.body);
    final result = Trending.fromJson(jsondata);
    if (result.results != null) {
      return result.results!;
    }
  }
  List<Result> empty = [];
  return empty;
}
