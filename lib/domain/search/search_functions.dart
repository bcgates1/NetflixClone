import 'dart:convert';

import 'package:netflix_clone/apikey.dart';
import 'package:netflix_clone/domain/search/search.dart';
import 'package:http/http.dart' as http;

Future<List<Result>> getimageSearch() async {
  final response = await http.get(
    Uri.parse(
        'https://api.themoviedb.org/3/trending/all/week?api_key=$apikey'),
  );

  if (response.statusCode == 200) {
    final jsondata = jsonDecode(response.body);
    final result = Search.fromJson(jsondata);
    if (result.results != null) {
      return result.results!;
    }
  }

  List<Result> empty = [];
  return empty;
}

Future<List<Result>> getimageSearchGrid(String search) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/search/movie?api_key=$apikey&query=${search}'));

  if (response.statusCode == 200) {
    final jsondata = jsonDecode(response.body);
    final result = Search.fromJson(jsondata);
    if (result.results != null) {
      return result.results!;
    }
  }

  List<Result> empty = [];
  return empty;
}
