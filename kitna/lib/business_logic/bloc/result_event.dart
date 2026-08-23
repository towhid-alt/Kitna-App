part of 'result_bloc.dart';

@immutable
sealed class ResultEvent {}

class ResultRequested extends ResultEvent {
  final String language;
  final String word;
   ResultRequested({required this.language, required this.word});
}