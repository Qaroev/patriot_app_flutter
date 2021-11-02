import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patriotapp/bloc/status_bloc.dart';
import 'package:patriotapp/home.dart';
import 'package:patriotapp/services/service_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => StatusBloc(statusrepository:StatusService()),
        child: const MyHomePage(),
      ),
    );
  }
}
