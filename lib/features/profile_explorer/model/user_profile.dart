import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String name;
  final String profileImage;
  final int age;
  final String city;
  final String userId;
  final bool isLiked;
  const UserProfile({
    required this.name,
    required this.profileImage,
    required this.age,
    required this.city,
    required this.userId,
    this.isLiked = false,
  });
  UserProfile copyWith({
    String? name,
    String? profileImage,
    int? age,
    String? city,
    String? userId,
    bool? isLiked,
  }) {
    return UserProfile(
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      age: age ?? this.age,
      city: city ?? this.city,
      userId: userId ?? this.userId,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  @override
  List<Object> get props => [name, profileImage, age, city, userId, isLiked];
}
