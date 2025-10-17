part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class FetchProfile extends ProfileEvent {}

class ToggleLike extends ProfileEvent {
  final String profileId;

  const ToggleLike({required this.profileId});
  @override
  List<Object?> get props => [profileId];
}
