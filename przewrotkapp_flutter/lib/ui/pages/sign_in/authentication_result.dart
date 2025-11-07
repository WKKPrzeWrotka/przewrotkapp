

class AuthenticationResult {
  bool isSuccess = false;
  String? failReason;

  AuthenticationResult({required this.isSuccess, required this.failReason});
}