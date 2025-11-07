import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PrzeZalogujSie')),
      body: Center(
        child: SignInWithEmailButton(
          caller: context.read<Client>().modules.auth,
          initPage: InitPage.signIn,
          onSignedIn: () => context.go('/'),
        ),
      ),
    );
  }
}
