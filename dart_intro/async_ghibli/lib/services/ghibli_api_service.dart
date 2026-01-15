import 'package:http/http.dart' as http;
import 'dart:convert';

var endpoint = 'https://ghibliapi.vercel.app/films';

// fetches a film given a certain id from the ghibli API. Returns a decoded json dynamic
Future<dynamic> getFilmByID(String id) async {
  // TODO: Error handling for random failures
  // TODO: Error handling for incorrect codes

  // Parse the endpoint and add the id of the film we want
  var uri = Uri.parse('$endpoint/$id');

  // fetch the data
  var response = await http.get(uri);

  // decodes the film into a dynamic object
  var jsonFilm = jsonDecode(response.body);

  return jsonFilm;
}
