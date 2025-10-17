import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_explorer/features/profile_explorer/bloc/profile_bloc.dart';
import 'package:profile_explorer/features/profile_explorer/view/widgets/profile_grid_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final ProfileBloc profileBloc = context.read<ProfileBloc>();

    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading && state is! ProfileLoaded) {
            return Center(child: CircularProgressIndicator());
          }if (state is ProfileLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                profileBloc.add(FetchProfile());
                await profileBloc.stream.firstWhere(
                  (s) => s is ProfileLoaded || s is ProfileError,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final profile = state.users[index];
                    return Profilegriditem(userProfile: profile);
                  },
                ),
              ),
            );
          }if (state is ProfileError) {
            return Center(
              child: Column(
                children: [Text("failed to load the profile because ")],
              ),
            );
          }
          return Center(child: Text("default error"));
        },
      ),
    );
  }
}
