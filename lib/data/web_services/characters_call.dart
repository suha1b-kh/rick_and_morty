import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class CharactersWebServices {
  Future<List<dynamic>> getAllCharacters() async {
    try {
      final response = await http.get(Uri.parse(
          'https://raw.githubusercontent.com/suha1b-kh/prototype-users/main/users.json'));
      log('Response status code: ${response.statusCode}');
      // print('Response body: ${response.body}');
      //  log(characters[0]);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['users'] != null) {
          log('success');
          return jsonData['users'];
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
      log('Error: $e');
      return [];
    }
  }
}
