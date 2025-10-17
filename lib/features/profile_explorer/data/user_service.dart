import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:profile_explorer/features/profile_explorer/model/user_profile.dart';

class UserService {
  Future<List<UserProfile>> fetchData() async {
    final response = await http.get(
      Uri.parse("https://randomuser.me/api/?results=20"),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data["results"] as List<dynamic>;
      return results.map<UserProfile>((jsonProfile) {
        final profile = jsonProfile as Map<String, dynamic>;
        return UserProfile(
          name: profile["name"]["first"],
          profileImage: profile["picture"]["large"],
          age: profile["dob"]["age"],
          city: profile["location"]["city"],
          userId: profile["login"]["uuid"],
          isLiked: false,
        );
      }).toList();
    } else {
      throw Exception(
        'Failed to load profiles. Status code: ${response.statusCode}',
      );
    }
  }
}
