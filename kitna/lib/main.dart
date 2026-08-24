import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kitna/business_logic/bloc/result_bloc.dart';
import 'package:kitna/presentation/app_router.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ResultBloc>(create: (context) => ResultBloc(),)
    ], child: MaterialApp(
      title: 'Kitna?!',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.onGenerateRoute,
      initialRoute: '/',
    ),);
  }
}
