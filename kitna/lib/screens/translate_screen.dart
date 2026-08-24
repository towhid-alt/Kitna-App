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
    final word = _amountController.text.trim();
    if (word.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter the amount',
            style: TextStyle(fontFamily: 'Cartoon', color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final String chossenlanguage = widget.selectedLang;
    context.read<ResultBloc>().add(
      ResultRequested(language: chossenlanguage, word: word),
    );

    Navigator.pushNamed(
      context,
      '/result',
      arguments: {'userWord': word, 'selectedLanguage': chossenlanguage},
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    final lang = widget.selectedLang;
    return Scaffold(
      backgroundColor: Color(0xFFFFC567),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: const Text(
                'Type the amount said by the shopkeeper',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Cartoon',
                  fontSize: 25,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),

            const SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0), // Rounded corners
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0, // Thick black border
                  ),
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
                child: TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    hint: Text(
                      '  Like \'untess\' \( means \'29\' in Hindi \)',
                      style: TextStyle(
                        fontFamily: 'Cartoon',
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey,
                      ),
                    ),
                    labelStyle: TextStyle(fontFamily: 'Cartoon'),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                border: BoxBorder.all(color: Colors.black, width: 3),
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
              child: ElevatedButton(
                onPressed: _fetchResults,
                style: ElevatedButton.styleFrom(
                  shape: LinearBorder(),
                  elevation: 10,
                  shadowColor: Colors.black,
                  minimumSize: const Size(100, 50),
                ),
                child: const Text(
                  'Translate',
                  style: TextStyle(
                    fontFamily: 'Cartoon',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(0),
                  border: BoxBorder.all(color: Colors.black, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 8,
                      offset: const Offset(5, 8),
                      spreadRadius: 0,
                      blurStyle: BlurStyle.solid,
                    ),
                  ],
                ),
                child: Text(
                  'Make sure the amount you are typing, is in $lang',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cartoon',
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Result box
          ],
        ),
      ),
    );
  }
}
