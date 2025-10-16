part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}
class FetchProfile extends ProfileEvent{}