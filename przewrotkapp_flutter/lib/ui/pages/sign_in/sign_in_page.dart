import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import 'signin_dialog_custom.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();

    // Wait until the first frame is rendered before showing the dialog
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showSignInWithEmailDialog(
        context: context,
        caller: context.read<Client>().modules.auth,
        initPage: InitPage.signIn,
        onSignedIn: () => context.go('/'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('PrzeZalogujSie')));
  }
}
