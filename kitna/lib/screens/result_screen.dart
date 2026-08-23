import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitna/business_logic/bloc/result_bloc.dart';

class ResultScreen extends StatefulWidget {
  final String userWord;

  const ResultScreen({super.key, required this.userWord});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final word = widget.userWord;

    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        List<dynamic> results = [];

        if (state is ResultFetched) {
          results = state.translations;
        }

        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Text('Pick the one which sounds similar to $word'),

              const SizedBox(height: 10),

              // Result box
              Expanded(
                child: ListView.separated(
                  itemCount: results.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black,
                    thickness: 1,
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(results[index]['word']),
                      trailing: Text(results[index]['number'].toString()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
