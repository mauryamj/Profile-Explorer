import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_explorer/features/profile_explorer/bloc/profile_bloc.dart';
import 'package:profile_explorer/features/profile_explorer/model/user_profile.dart';

class DetailScreen extends StatefulWidget {
  final UserProfile userProfile;
  const DetailScreen({super.key, required this.userProfile});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  AnimationStatusListener? _statusListener;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 20),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_statusListener == null) {
      _statusListener = (status) {
        if (status == AnimationStatus.completed) {
          _controller.forward();
        }
      };
      ModalRoute.of(context)?.animation?.addStatusListener(_statusListener!);
    }
  }

  @override
  void dispose() {
    if (_statusListener != null) {
      ModalRoute.of(context)?.animation?.removeStatusListener(_statusListener!);
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
            final displayedProfile = state.users.firstWhere(
              (p) => p.userId == widget.userProfile.userId,
              orElse: () => widget.userProfile,
            );
            return Stack(
              alignment: Alignment.bottomCenter,

              children: [
                Stack(
                  children: [
                    Hero(
                      tag: 'profile-image-${displayedProfile.userId}',
                      child: Image.network(
                        displayedProfile.profileImage,
                        fit: BoxFit.cover,
                        height: 700,
                      ),
                    ),
                    AppBar(backgroundColor: Colors.transparent),
                  ],
                ),

                SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 160,
                        decoration: const BoxDecoration(
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
                                "${displayedProfile.name}, ${displayedProfile.age}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Location",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          displayedProfile.city,
                                          style: const TextStyle(
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
                                    onPressed: () {
                                      context.read<ProfileBloc>().add(
                                        ToggleLike(
                                          profileId: displayedProfile.userId,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      displayedProfile.isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: displayedProfile.isLiked
                                          ? Colors.redAccent
                                          : Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
