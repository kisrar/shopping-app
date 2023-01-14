import 'package:flutter/material.dart';
import 'package:nykaa/login/view_models/login_view_model.dart';
import 'package:nykaa/login/views/widgets/bottom_curve.dart';
import 'package:nykaa/login/views/widgets/login_fields.dart';
import 'package:provider/provider.dart';

import 'widgets/top_curve.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LoginViewModel>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TopCurve(),
          Column(
            children: [
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    LoginFields(),
                    Consumer<LoginViewModel>(builder: (context, model, child) {
                      return Container(
                        height: 70,
                        width: 70,
                        child: FittedBox(
                          child: FloatingActionButton(
                            backgroundColor: Colors.cyan,
                            elevation: 10,
                            onPressed: () {
                              viewModel.login(context);
                            },
                            child: viewModel.showLoader
                                ? CircularProgressIndicator(color: Colors.white)
                                : Icon(
                                    Icons.arrow_forward,
                                  ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: TextButton(
                    child: Text(
                      'Forgot Password ?',
                      style:
                          TextStyle(color: Colors.grey.shade300, fontSize: 16),
                    ),
                    onPressed: () {
                      //TODO : Implement Sign up feature
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(100),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(-5, -5),
                        color: Colors.grey.shade200,
                      ),
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(5, 5),
                        color: Colors.grey.shade200,
                      ),
                    ]),
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Spacer(),
            ],
          ),
          const BottomCurve(),
        ],
      ),
    );
  }
}
