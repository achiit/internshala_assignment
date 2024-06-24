import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internshala_assignment/models/internship_response.dart';

class InternshipViewModel extends ChangeNotifier {
  InternshipResponse? _internshipResponse;
  bool _isLoading = false;

  InternshipResponse? get internshipResponse => _internshipResponse;
  bool get isLoading => _isLoading;

  Future<void> fetchInternships() async {
    _isLoading = true;
    notifyListeners();

    try {
      Uri url = Uri.parse('https://internshala.com/flutter_hiring/search');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        _internshipResponse = InternshipResponse.fromJson(jsonResponse);
        // log(
        //   'InternshipResponse: ${_internshipResponse!.internshipsMeta}',
        // );
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error fetching internships: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
