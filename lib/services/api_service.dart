import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:internshala_assignment/models/internship.dart';

class ApiService {
  static const String _baseUrl =
      'https://internshala.com/flutter_hiring/search';

  Future<Internship> fetchInternships() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      log('Response: $jsonResponse');
      log('Response: ${jsonResponse.length}');
      return Internship.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load internships');
    }
  }
}
