part of 'result_bloc.dart';

@immutable
sealed class ResultState {}

final class ResultInitial extends ResultState {}

final class ResultLoading extends ResultState{}

final class ResultFetched extends ResultState{
  final List<Map<String, dynamic>> translations;

  ResultFetched({required this.translations});
}

final class ResultError extends ResultState{}

final class ResultUnFetched extends ResultState{}