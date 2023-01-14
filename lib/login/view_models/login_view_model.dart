import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nykaa/login/models/login_response_model.dart';
import 'package:nykaa/login/repositories/login_repository.dart';
import 'package:nykaa/home/views/home_view.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  final LoginRepository _loginRepository;
  TextEditingController usernameTEC = TextEditingController();
  TextEditingController passswordTEC = TextEditingController();

  bool showLoader = false;

  Future<void> login(BuildContext context) async {
    showLoader = true;
    FocusManager.instance.primaryFocus?.unfocus();
    notifyListeners();
    LoginResponseModel? loginResponse = await _loginRepository.login(
        username: usernameTEC.text, passsword: passswordTEC.text);
    if (loginResponse?.status == '1') {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return HomeView();
      }));
    } else {
      showLoader = false;
      notifyListeners();
      Fluttertoast.showToast(
        msg: loginResponse?.message ?? '',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        // fontSize: 16.0,
      );
    }
  }

  @override
  void dispose() {
    usernameTEC.dispose();
    passswordTEC.dispose();
    super.dispose();
  }
}
