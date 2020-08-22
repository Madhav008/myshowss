import 'package:http/http.dart' as http;
import 'package:myshows/model/new_movis_model.dart';

import '../model/model.dart';

Future<List<Movie>> getContact() async {
  var response = await http.get("https://msjfiles123.xyz/jsonfiles/movies.json");
  return movieFromJson(response.body);
}


Future<List<NewMovie>> getNewMovies() async {
  var response = await http.get("https://msjfiles123.xyz/jsonfiles/newmovies.json");
  return newmovieFromJson(response.body);
}

Future<List<Movie>> getSeries() async {
  var response = await http.get("https://msjfiles123.xyz/jsonfiles/series.json");
  return movieFromJson(response.body);
}



