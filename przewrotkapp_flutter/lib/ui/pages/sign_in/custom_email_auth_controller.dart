

import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart' show SessionManager;

import 'authentication_result.dart';

class CustomEmailAuthController {
  /// A reference to the auth module as retrieved from the client object.
  final Caller caller;

  /// Creates a new email authentication controller.
  CustomEmailAuthController(this.caller);

  /// Attempts to sign in with email and password. If successful, a [UserInfo]
  /// is returned. If the attempt is not a success, null is returned.
  Future<AuthenticationResult> signIn(String email, String password) async {
    try {
      var serverResponse = await caller.email.authenticate(email, password);
      if (!serverResponse.success ||
          serverResponse.userInfo == null ||
          serverResponse.keyId == null ||
          serverResponse.key == null) {

        return AuthenticationResult(isSuccess: false, failReason: _getFailReason(serverResponse.failReason));
      }

      // Authentication was successful, store the key.
      var sessionManager = await SessionManager.instance;
      sessionManager.registerSignedInUser(
        serverResponse.userInfo!,
        serverResponse.keyId!,
        serverResponse.key!,
      );
      return AuthenticationResult(isSuccess: true, failReason: null);
    } catch (e, stackTrace) {
      return AuthenticationResult(isSuccess: false, failReason: "Wystąpił błąd");
    }
  }

  String _getFailReason(AuthenticationFailReason? failReason) {
    return switch (failReason) {
      AuthenticationFailReason.invalidCredentials => "Nieprawidłowe hasło",
      AuthenticationFailReason.userCreationDenied => "Błąd tworzenia użytkownika",
      AuthenticationFailReason.internalError => "Wystąpił błąd",
      AuthenticationFailReason.tooManyFailedAttempts => "Zbyt dużo nieudanych prób",
      AuthenticationFailReason.blocked => "Użytkownik zablokowany",
      null => "Wystąpił błąd",
    };
  }

  /// Attempts to create a new account request with the given email and
  /// password. If successful, true is returned. If the attempt is not a
  /// success, false is returned.
  Future<bool> createAccountRequest(
      String userName,
      String email,
      String password,
      ) async {
    try {
      return await caller.email.createAccountRequest(
        userName,
        email,
        password,
      );
    } catch (e) {
      return false;
    }
  }

  /// Attempts to validate the account with the given email and verification
  /// code. If successful, a [UserInfo] is returned. If the attempt is not a
  /// success, null is returned.
  Future<UserInfo?> validateAccount(
      String email,
      String verificationCode,
      ) async {
    try {
      return await caller.email.createAccount(email, verificationCode);
    } catch (e) {
      return null;
    }
  }

  /// Attempts to initiate a password reset for the given email. If successful,
  /// true is returned. If the attempt is not a success, false is returned.
  Future<bool> initiatePasswordReset(String email) async {
    try {
      return await caller.email.initiatePasswordReset(email);
    } catch (e) {
      return false;
    }
  }

  /// Attempts to reset the password for the given email with the given
  /// verification code and new password. If successful, true is returned. If
  /// the attempt is not a success, false is returned.
  Future<bool> resetPassword(
      String email,
      String verificationCode,
      String password,
      ) async {
    try {
      return await caller.email.resetPassword(
        verificationCode,
        password,
      );
    } catch (e) {
      return false;
    }
  }
}