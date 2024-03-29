import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/apikey.dart';
import 'package:netflix_clone/domain/top_rated/top_rated.dart';

Future<List<Result>> getImageTopRated() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US&page=1'));

  if (response.statusCode == 200) {
    final jsondata = jsonDecode(response.body);
    final result = TopRated.fromJson(jsondata);
    if (result.results != null) {
      return result.results!;
    }
  }
  List<Result> empty = [];
  return empty;
}
