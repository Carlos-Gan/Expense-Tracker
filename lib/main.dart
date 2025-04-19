import 'package:expense_tracker/app.dart';
import 'package:expense_tracker/screens/add_expense/icon_notifier.dart';
import 'package:expense_tracker/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:bloc/bloc.dart';

//Inicializa la aplicacion
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    ChangeNotifierProvider(
      create: (context) => IconNotifier(),
      child: const MyApp(),
    ),
  );
}
