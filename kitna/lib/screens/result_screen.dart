import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitna/business_logic/bloc/result_bloc.dart';

class ResultScreen extends StatefulWidget {
  final String userWord;
  final String language;
  const ResultScreen({super.key, required this.userWord, required this.language});

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
                          final check = results.isEmpty;

        return Scaffold(
          backgroundColor: Color(0xFFFFC567),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Text(
                'Prefer the one which sounds similar to \'$word\'',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Cartoon',
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                ),
              ),
          
              const SizedBox(height: 5),
          
              // Result box
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 35),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: Colors.black, width: 4),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 8,
                        offset: const Offset(3, 6),
                        spreadRadius: 0,
                        blurStyle: BlurStyle.solid,
                      ),
                    ],
                  ),
                  child: !check ? ListView.separated(
                    itemCount: results.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.black,
                      thickness: 1,
                      height: 1,
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          results[index]['word'],
                          style: const TextStyle(
                            fontFamily: 'Cartoon',
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        trailing: Text(
                          results[index]['number'].toString(),
                          style: const TextStyle(
                            fontFamily: 'Cartoon',
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      );
                    },
                  ) : Center(
                    child: const Text('No matches! Try changing the spelling a bit.', textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cartoon',
                      fontSize: 15,
                      color: Colors.red,
                    ),),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
