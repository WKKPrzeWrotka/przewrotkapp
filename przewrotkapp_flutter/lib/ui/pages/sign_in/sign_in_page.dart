import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

import 'custom_email_auth_controller.dart';

const _defaultMaxPasswordLength = 128;
const _defaultMinPasswordLength = 8;

class SignInPage extends StatefulWidget {
  final Caller caller;
  final VoidCallback onSignedIn;

  const SignInPage({super.key, required this.caller, required this.onSignedIn});

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final CustomEmailAuthController _emailAuth;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _validationCodeController = TextEditingController();

  String? _passwordIssue;
  String? _emailIssue;
  String? _validationCodeIssue;

  bool _enabled = true;
  bool _isPasswordObscured = true;

  _CustomLoginPage _page = _CustomLoginPage.signIn;

  @override
  void initState() {
    super.initState();

    _emailAuth = CustomEmailAuthController(widget.caller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PrzeZalogujSie')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),

          width: 280,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: switch (_page) {
              _CustomLoginPage.signIn => loginPage(),
              _CustomLoginPage.forgotPassword => forgotPasswordPage(),
              _CustomLoginPage.confirmPasswordReset => confirmPasswordResetPage(),
            },
          ),
        ),
      ),
    );
  }

  List<Widget> loginPage() {
    return [
      TextField(
        decoration: InputDecoration(hintText: "E-mail", helperText: ' ', errorText: _emailIssue),
        controller: _emailController,
      ),
      TextField(
        obscureText: _isPasswordObscured,
        controller: _passwordController,
        maxLength: _defaultMaxPasswordLength,
        decoration: InputDecoration(
          hintText: "Hasło",
          helperText: ' ',
          errorText: _passwordIssue,
          suffixIcon: IconButton(
            icon: Icon(_isPasswordObscured ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isPasswordObscured = !_isPasswordObscured;
              });
            },
          ),
        ),
        onChanged: (_) {
          setState(() {
            _passwordIssue = null;
          });
        },
      ),
      ElevatedButton(onPressed: _signIn, child: Text("Zaloguj")),
      const SizedBox(height: 16),
      TextButton(
        onPressed: () {
          setState(() {
            _page = _CustomLoginPage.forgotPassword;
          });
        },
        child: Text("Zapomniałem hasła"),
      ),
    ];
  }

  List<Widget> forgotPasswordPage() {
    return [
      TextField(
        enabled: _enabled,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(hintText: "E-mail", helperText: ' ', errorText: _emailIssue),
        onChanged: (_) {
          setState(() {
            _emailIssue = null;
          });
        },
      ),
      const SizedBox(height: 16),
      ElevatedButton(onPressed: _enabled ? _initiatePasswordReset : null, child: Text("Resetuj hasło")),
      TextButton(
        onPressed: _enabled
            ? () {
                setState(() {
                  _page = _CustomLoginPage.signIn;
                });
              }
            : null,
        child: Text("Wstecz"),
      ),
    ];
  }

  List<Widget> confirmPasswordResetPage() {
    return [
      Text("Link do resetu wysłany"),
      const SizedBox(height: 16),
      TextField(
        enabled: _enabled,
        controller: _validationCodeController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(hintText: "Kod weryfikacyjny", helperText: ' ', errorText: _validationCodeIssue),
        onChanged: (_) {
          setState(() {
            _passwordIssue = null;
          });
        },
      ),
      TextField(
        enabled: _enabled,
        maxLength: _defaultMaxPasswordLength,
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(hintText: "Nowe hasło", helperText: ' ', errorText: _passwordIssue),
        onChanged: (_) {
          setState(() {
            _passwordIssue = null;
          });
        },
      ),
      const SizedBox(height: 16),
      ElevatedButton(onPressed: _enabled ? _resetPassword : null, child: Text("Zaloguj")),
      TextButton(
        onPressed: _enabled
            ? () {
                setState(() {
                  _page = _CustomLoginPage.signIn;
                });
              }
            : null,
        child: Text("Wstecz"),
      ),
    ];
  }

  Future<void> _signIn() async {
    // _resetIssues();
    var email = _emailController.text.trim().toLowerCase();
    if (!EmailValidator.validate(email)) {
      setState(() {
        _emailIssue = "Nieprawidłowy e-mail";
      });
      return;
    }

    var password = _passwordController.text;
    if (password.length < _defaultMinPasswordLength) {
      setState(() {
        _passwordIssue = "Za krótkie hasło. Min $_defaultMinPasswordLength znaków";
      });
      return;
    }

    setState(() {
      _enabled = false;
    });

    var authenticationResult = await _emailAuth.signIn(email, password);
    if (!authenticationResult.isSuccess && authenticationResult.failReason != null) {
      setState(() {
        _passwordIssue = authenticationResult.failReason;
        _enabled = true;
      });
      return;
    }

    widget.onSignedIn.call();
  }

  Future<void> _initiatePasswordReset() async {
    _resetIssues();
    var email = _emailController.text.trim().toLowerCase();
    if (!EmailValidator.validate(email)) {
      setState(() {
        _emailIssue = "Nieprawidłowy e-mail";
      });
      return;
    }

    setState(() {
      _enabled = false;
    });

    await _emailAuth.initiatePasswordReset(email);

    setState(() {
      _page = _CustomLoginPage.confirmPasswordReset;
      _enabled = true;
    });
  }

  Future<void> _resetPassword() async {
    _resetIssues();
    if (_passwordController.text.length < _defaultMinPasswordLength) {
      setState(() {
        _passwordIssue = "Za krótkie hasło. Min to $_defaultMinPasswordLength znaków";
      });
      return;
    }

    var email = _emailController.text.trim().toLowerCase();

    setState(() {
      _enabled = false;
    });

    var success = await _emailAuth.resetPassword(email, _validationCodeController.text, _passwordController.text);

    if (!success) {
      setState(() {
        _validationCodeIssue = "Nieprawidłowy kod";
        _enabled = true;
      });
      return;
    }

    var authenticationResult = await _emailAuth.signIn(email, _passwordController.text);
    if (!authenticationResult.isSuccess) {
      // Something went wrong, start over
      setState(() {
        _resetTextFields();
        _page = _CustomLoginPage.signIn;
        _enabled = true;
      });
      return;
    }

    widget.onSignedIn();
  }

  void _resetIssues() {
    setState(() {
      _emailIssue = '';
      _passwordIssue = '';
      _validationCodeIssue = '';
    });
  }

  void _resetTextFields() {
    setState(() {
      _validationCodeController.text = '';
      _passwordController.text = '';
      _emailController.text = '';
    });
  }
}

enum _CustomLoginPage { signIn, forgotPassword, confirmPasswordReset }
