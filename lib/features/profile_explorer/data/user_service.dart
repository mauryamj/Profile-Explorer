import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:profile_explorer/features/profile_explorer/model/user_profile.dart';

class UserService {
  Future<List<UserProfile>> fetchData() async {
    final response = await http.get(Uri.parse("uri"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      // ignore: collection_methods_unrelated_type
      if (data.containsKey("results") & data["results" is List]) {
        final List results = data["results"] as List;
        return results.map<UserProfile>((jsonProfile) {
          final profile = jsonProfile as Map<String, dynamic>;
          return UserProfile(
            name: profile["name"]["first"],
            profileImage: profile["picture"]["large"],
            age: profile["dob"]["age"],
            city: profile["location"]["city"],
            userId: profile["login"]["uuid"],
            islinked: false,
          );
        }).toList();
      } else {
        throw Exception(
          'API response missing "results" key or it is not a list.',
        );
      }
    } else {
      throw Exception(
        'Failed to load profiles. Status code: ${response.statusCode}',
      );
    }
  }
}
