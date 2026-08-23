import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitna/screens/lang_screen.dart';
import 'package:kitna/screens/result_screen.dart';
import 'package:kitna/screens/translate_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => LangScreen(),
        );

      case '/home':
      final args = settings.arguments as Map<String, dynamic>;
      final selectedLanguage = args['selectedLang'] ?? '';
      return MaterialPageRoute(builder: (_) => HomeScreen(selectedLang: selectedLanguage,));
      
      case '/result':
      final args = settings.arguments as Map<String, dynamic>;
      final word = args['userWord'];
      return MaterialPageRoute(builder: (_) => ResultScreen(userWord: word,));
      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
