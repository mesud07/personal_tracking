part of 'allowing_cubit.dart';

@immutable
abstract class AllowingState {}

class AllowingInitial extends AllowingState {}

class AllowingLoading extends AllowingState {
  DateTimeRange? dateRange;
  AllowingLoading({required this.dateRange});
}

class AllowingComplete extends AllowingState {}

