import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nykaa/login/models/login_response_model.dart';

import '../../services/services.dart';

abstract class LoginRepository {
  Future<LoginResponseModel?> login(
      {required String username, required String passsword});
}

class LoginRepositoryImp implements LoginRepository {
  final NetworkService apiClient;
  LoginRepositoryImp({required this.apiClient});

  @override
  Future<LoginResponseModel?> login(
      {required String username, required String passsword}) async {
    LoginResponseModel? loginResponseModel =
        await apiClient.sendRequest<LoginResponseModel?>(
            requestType: RequestType.post,
            url: EndPoints.login,
            body: <String, dynamic>{
              'username': username,
              'password': passsword
            },
            onSuccess: (response) {
              return LoginResponseModel.fromMap(response);
            },
            onFailure: (response,errorType, msg) {
               return LoginResponseModel.fromMap(response);
            });
    return loginResponseModel;
  }
}
