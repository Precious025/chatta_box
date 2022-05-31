import 'package:chattabox/chat_overview_screen.dart';
import 'package:chattabox/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/chat_bloc.dart';
import 'bottom_navigator.dart';
import 'contacts.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: AppBlocObserver());
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      return;
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    return;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc()..add(const LoadChat()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(52, 184, 237, 1),
            secondary: const Color.fromRGBO(151, 151, 151, 1),
          ),
        ),
        home: const SplashScreen(),
        routes: {
          ChatScreen.routeName: (ctx) => const ChatScreen(),
          Contacts.routeName: (ctx) => const Contacts(),
          BottomNavigator.routeName: (ctx) => const BottomNavigator(),
        },
      ),
    );
  }
}
