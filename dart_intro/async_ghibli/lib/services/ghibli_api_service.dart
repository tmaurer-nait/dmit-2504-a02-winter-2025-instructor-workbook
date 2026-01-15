import 'package:http/http.dart' as http;
import 'dart:convert';

const endpoint = 'https://ghibliapi.vercel.app/films';

// fetches a film given a certain id from the ghibli API. Returns a decoded json dynamic
Future<dynamic> getFilmByID(String id) async {
  // TODO: Error handling for random failures
  // TODO: Error handling for incorrect codes

  try {
    // Parse the endpoint and add the id of the film we want
    var uri = Uri.parse('$endpoint/$id');

    // fetch the data
    var response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Something went wrong: ${response.statusCode} received');
    }

    // decodes the film into a dynamic object
    var jsonFilm = jsonDecode(response.body);

    return jsonFilm;
  } catch (e) {
    throw Exception('Something went wrong: $e');
  }
  // Something went wrong: 401 received
}
