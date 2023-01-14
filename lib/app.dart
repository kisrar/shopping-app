import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';
import 'locator.dart';
import 'login/login.dart';

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
