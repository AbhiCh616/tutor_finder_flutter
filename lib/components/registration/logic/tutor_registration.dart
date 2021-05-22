import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tutor_finder_flutter/components/registration/utils/constants.dart';
import 'package:tutor_finder_flutter/components/registration/utils/gender.dart';

createTutorProfile(String name, int age, Gender gender,
    double distanceCanTravel, double charge, String chargeDuration) async {
  String g = '';
  switch (gender) {
    case Gender.Male:
      g = 'M';
      break;
    case Gender.Female:
      g = 'F';
      break;
    case Gender.Other:
      g = 'O';
      break;
    case Gender.None:
      break;
  }

  Uri url = Uri.parse(BASE_URL + '/api/accounts/details/tutor/create/');
  var headers = {'Content-Type': 'application/json'};
  var body = jsonEncode({
    'email': 'abhich1607@gmail.com',
    'name': name,
    'age': age,
    'gender': g,
    'distance_can_travel': distanceCanTravel,
    'charge': charge,
    'charge_duration': chargeDuration
  });
  var response = await http.post(url, headers: headers, body: body);

  // Tutor profile created
  if (response.statusCode == 201) {
    print('Tutor profile created.');
  }
  // Tutor profile not created
  else {
    print(
        'Can\'t create tutor profile: ${response.statusCode}, sent body: $body, error body: ${response.body}');
  }
}
