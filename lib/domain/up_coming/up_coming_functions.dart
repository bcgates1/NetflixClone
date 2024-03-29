import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/apikey.dart';
import 'package:netflix_clone/domain/up_coming/up_coming.dart';

Future<List<Result>> getImageUpComing() async {
  final response = await http.get(
    Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey&language=en-US&page=1'),
  );

  if (response.statusCode == 200) {
    final jsoncode = jsonDecode(response.body);
    final result = UpComing.fromJson(jsoncode);
    if (result.results != null) {
      return result.results!;
    }
  }
  List<Result> empty = [];
  return empty;
}
