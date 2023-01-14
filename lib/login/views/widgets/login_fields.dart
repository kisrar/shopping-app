import 'package:flutter/material.dart';
import 'package:nykaa/login/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LoginViewModel>(context);
    return Container(
      margin: const EdgeInsets.only(right: 20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8),
            width: 300,
            child: TextFormField(
              controller: viewModel.usernameTEC,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.black.withOpacity(0.6),
                  size: 30,
                ),
                hintText: 'Username',

                // ignore: prefer_const_constructors
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                  ),
                ),
              ),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
          ),
          const Divider(),
          SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextFormField(
                controller: viewModel.passswordTEC,
                obscureText: true,
                obscuringCharacter: '●',
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.black.withOpacity(0.6),
                    size: 30,
                  ),
                  hintText: 'Password',
                  // ignore: prefer_const_constructors
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
