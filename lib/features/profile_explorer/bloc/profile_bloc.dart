import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:profile_explorer/features/profile_explorer/data/user_service.dart';
import 'package:profile_explorer/features/profile_explorer/model/user_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserService _userService;
  ProfileBloc(this._userService) : super(ProfileInitial()) {
    on<FetchProfile>((event, emit) async {
      emit(ProfileLoading());
      try {
        final users = await _userService.fetchData();
        emit(ProfileLoaded(users));
      } catch (e) {
        print(e);
        emit(ProfileError(e.toString()));
      }
    });
    on<ToggleLike>((event, emit) {
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        final updatedProfile = currentState.users.map((profile) {
          if (profile.userId == event.profileId) {
            print(profile.userId);
            return profile.copyWith(islinked: !profile.islinked);
          }
          print("it did");
          return profile;
        }).toList();
        print("it showed");
        emit(ProfileLoaded(updatedProfile));
        print("it showed at this too");
      } else {
        print("ignored");
      }
    });
  }
}
