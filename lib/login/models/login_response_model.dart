
class LoginResponseModel {
  String status;
  String message;
  LoginResponseModel({
    required this.status,
    required this.message,
  });


  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
    );
  }


  @override
  String toString() => 'LoginResponseModel(statusCode: $status, message: $message)';


}
