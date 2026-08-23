import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc() : super(ResultInitial()) {
    on<ResultRequested>(_onResultRequested);
  }

  Future<void> _onResultRequested (
    ResultRequested event,
    Emitter<ResultState> emit,
  ) async {
    emit(ResultLoading());
    print('📛Inside ResultRequested event handler function');
    try {
      final number = event.word;/*
      final response = await http.post(Uri.parse('https://interroad-nontragical-odessa.ngrok-free.dev/api/results'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'numberWord': event.word
      }));*/
      final response = await http.get(Uri.parse('https://interroad-nontragical-odessa.ngrok-free.dev/api/results?numberWord=${number}'));

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        final results = List<Map<String, dynamic>>.from(data);
        emit(ResultFetched(translations: results));//FIXME:List<Map<String, dynamic>>.from(data)
      }
    } catch (error) {
      print('Error fetching results: $error');
      emit(ResultError());
    }
  }
}
