import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class CharactersWebServices {
  Future<List<dynamic>> getAllCharacters() async {
    try {
      final response = await http
          .get(Uri.parse('https://rickandmortyapi.com/api/character'));
      log('Response status code: ${response.statusCode}');
      // print('Response body: ${response.body}');
      //  log(characters[0]);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['results'] != null) {
          log('success');
          return jsonData['results'];
        } else {
          log('DDDDDDDDDDDDDD');
          throw Exception('No character data found');
        }
      } else {
        log('SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS');
        throw Exception('Failed to load characters: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('AAAAAAAAAAAAAAAAAAA');
      print('Error: $e');
      return [];
    }
  }
}
