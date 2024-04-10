import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/constants/strings.dart';

class CharactersWebServices {
  Future<List<dynamic>> getAllCharacters() async {
    try {
      var request = http.Request('GET', Uri.parse(baseURL));
      return jsonDecode(request.body);
    } catch (e) {
      return [];
    }
  }
}
