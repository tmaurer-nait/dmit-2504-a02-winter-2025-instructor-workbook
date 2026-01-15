import 'package:async_ghibli/services/ghibli_api_service.dart';
import 'package:async_ghibli/models/film.dart';

void main(List<String> arguments) async {
  var filmJson = await getFilmByID('58611129-2dbc-4a81-a72f-77ddfc1b1b49');
  var film = Film.fromJson(filmJson);
  print('FILM YOU REQUESTED: $film');
}
