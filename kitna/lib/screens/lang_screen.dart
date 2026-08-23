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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Choose Language')),

          const SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.all(20),
            child: DropdownButtonFormField<String>(
              value: selectedLanguage,
              decoration: const InputDecoration(
                labelText: 'Language',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'English', child: Text('English')),
                DropdownMenuItem(value: 'Hindi', child: Text('हिन्दी')),
                DropdownMenuItem(value: 'Bengali', child: Text('বাংলা')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
          ),

          const SizedBox(height: 15,),

          ElevatedButton(onPressed: () {
            Navigator.pushReplacementNamed(context, '/home',
            arguments: {'selectedLang': selectedLanguage});
          }, child: Text('Proceed'))
        ],
      ),
    );
  }
}
