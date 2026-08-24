import 'package:flutter/material.dart';

class LangScreen extends StatefulWidget {
  const LangScreen({super.key});

  @override
  State<LangScreen> createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {
  String selectedLanguage = 'Hindi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFC567),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0),
                border: BoxBorder.all(color: Colors.black, width: 4),
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
              child: const Text(
                'Kitna?!',
                style: TextStyle(
                  fontFamily: 'Cartoon',
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 50),

            const Center(
              child: Text(
                'Shopkeeper\'s Language?',
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
                child: DropdownButtonFormField<String>(
                  value: selectedLanguage,

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  items: const [
                    //TODO: Add more languages
                    DropdownMenuItem(value: 'English', child: Text('English')),
                    DropdownMenuItem(value: 'Hindi', child: Text('Hindi')),
                    DropdownMenuItem(value: 'Bengali', child: Text('Bengali')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 15),

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
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/home',
                    arguments: {'selectedLang': selectedLanguage},
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: LinearBorder(),
                  elevation: 10,
                  shadowColor: Colors.black,
                  minimumSize: const Size(100, 50)
                ),
                child: Text(
                  'Proceed',
                  style: TextStyle(
                    fontFamily: 'Cartoon',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
