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
    print('📞fetchResult function running...');//FIXME:
    final String chossenlanguage = widget.selectedLang;
    final word = _amountController.text;
    print('📛Adding event with language: $chossenlanguage');
    context.read<ResultBloc>().add(ResultRequested(language: chossenlanguage, word: word));
  }

  @override
 @override
Widget build(BuildContext context) {
  return BlocBuilder<ResultBloc, ResultState>(
    builder: (context, state) {
      List<dynamic> results = [];

      if (state is ResultFetched) {
        results = state.translations;
        print('📛Results: $results');
      }

      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'The amount said by the shopkeeper',
            ),
        
            const SizedBox(height: 5),
        
            TextField(
              controller: _amountController,
            ),
        
            const SizedBox(height: 10),
        
            ElevatedButton(
              onPressed: _fetchResults,
              child: const Text('Translate'),
            ),
        
            const SizedBox(height: 20),
        
            // Result box
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: results.length,
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
