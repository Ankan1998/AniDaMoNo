import 'package:anime_fe/modules/login/bloc/login_bloc.dart';
import 'package:anime_fe/modules/login/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/signup/bloc/sign_up_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LoginBloc()
        ),
        BlocProvider(
            create: (context) => SignUpBloc()
        )
      ],
      child: MaterialApp(
        title: 'Anime App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

