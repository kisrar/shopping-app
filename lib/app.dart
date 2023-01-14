import 'package:flutter/material.dart';
import 'package:nykaa/login/repositories/login_repository.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'home/repositories/home_repository.dart';
import 'home/view_models/home_view_model.dart';
import 'login/view_models/login_view_model.dart';
import 'home/views/views.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                LoginViewModel(loginRepository: locator<LoginRepository>())),

                    ChangeNotifierProvider(
            create: (context) =>
               HomeViewModel(homeRepository: locator<HomeRepository>()))
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nykaa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
    ));
  }
}