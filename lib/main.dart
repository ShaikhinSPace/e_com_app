import 'package:e_com_app/resources/apiProvider.dart';
import 'package:e_com_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ecommerce',
      // theme: ,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

// class SimpleBlocDelegate extends BlocObserver {
//   @override
//   void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
//     super.onEvent(bloc, event);
//     print(event);
//   }

//   @override
//   void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
//     super.onTransition(bloc, transition);
//     print(transition);
//   }

//   @override
//   void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
//     super.onError(bloc, error, stackTrace);
//     print(error);
//   }
// }
