import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
    try {
      final number = event.word;
      final language = event.language;
      final apiUrl = dotenv.env['SERVER_URL'];
      final response = await http.get(Uri.parse('$apiUrl/api/results?numberWord=${number}&language=${language}'));
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
