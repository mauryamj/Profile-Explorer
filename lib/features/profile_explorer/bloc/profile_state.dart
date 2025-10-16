part of 'profile_bloc.dart';

@immutable
sealed class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object?> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final List<UserProfile> users;

  const ProfileLoaded(this.users);
  @override
  List<Object?> get props => [users];
}

final class ProfileError extends ProfileState {
  final String message;
  const ProfileError(this.message);
}
