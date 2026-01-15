import 'package:async_ghibli/services/ghibli_api_service.dart';

void main(List<String> arguments) async {
  var film = await getFilmByID('58611129-2dbc-4a81-a72f-77ddfc1b1b49');
  print(film);
}
