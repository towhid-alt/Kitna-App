import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitna/business_logic/bloc/result_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String selectedLang;
  HomeScreen({super.key, required this.selectedLang});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _amountController = TextEditingController();

  void _fetchResults() {
    print('📞fetchResult function running...'); //FIXME:
    final String chossenlanguage = widget.selectedLang;
    final word = _amountController.text;
    print('📛Adding event with language: $chossenlanguage');
    context.read<ResultBloc>().add(
      ResultRequested(language: chossenlanguage, word: word),
    );

    Navigator.pushNamed(context, '/result', arguments: {'userWord': word});
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The amount said by the shopkeeper'),

          const SizedBox(height: 5),

          TextField(controller: _amountController),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: _fetchResults,
            child: const Text('Translate'),
          ),

          // Result box
        ],
      ),
    );
  }
}
