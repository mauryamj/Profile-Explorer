import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_explorer/features/profile_explorer/bloc/profile_bloc.dart';
import 'package:profile_explorer/features/profile_explorer/model/user_profile.dart';
import 'package:profile_explorer/features/profile_explorer/view/detail_screen.dart';

class Profilegriditem extends StatelessWidget {
  final UserProfile userProfile;
  const Profilegriditem({super.key, required this.userProfile});
  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(userProfile: userProfile),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Material(
        child: InkWell(
          onTap: () => _navigateToDetail(context),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: 'profile-image-${userProfile.userId}',
                child: Image.network(
                  userProfile.profileImage,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black45],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6, 1.0],
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 10,
                right: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userProfile.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            userProfile.city,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<ProfileBloc>().add(
                          ToggleLike(profileId: userProfile.userId),
                        );
                      },
                      icon: Icon(
                        userProfile.isLiked
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: userProfile.isLiked
                            ? Colors.redAccent
                            : Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
