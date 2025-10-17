import 'package:flutter/material.dart';
import 'package:profile_explorer/features/profile_explorer/model/user_profile.dart';

class DetailScreen extends StatelessWidget {
  final UserProfile userProfile;
  const DetailScreen({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,

        children: [
          Stack(
            children: [
              Hero(
                tag: 'profile-image-${userProfile.userId}',
                child: Image.network(
                  userProfile.profileImage,
                  fit: BoxFit.cover,
                  height: 700,
                ),
              ),
              AppBar(backgroundColor: Colors.transparent),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "${userProfile.name}, ${userProfile.age}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userProfile.city,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Delhi",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
