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
        emit(ProfileError(e.toString()));
      }
    });
    on<ToggleLike>((event, emit) {
      if (state is ProfileLoaded) {
        final currentState = state as ProfileLoaded;
        final updatedProfile = currentState.users.map((profile) {
          if (profile.userId == event.profileId) {
            return profile.copyWith(isLiked: !profile.isLiked);
          }
          return profile;
        }).toList();
        emit(ProfileLoaded(updatedProfile));
      } else {}
    });
  }
}
