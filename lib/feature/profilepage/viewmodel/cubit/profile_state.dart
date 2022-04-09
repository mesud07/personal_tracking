part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileComplete extends ProfileState {
  final UserModel? user;

  ProfileComplete(this.user);

}
