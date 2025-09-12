import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_flutter/ui/pages/sign_in/sign_in_page.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sm = context.watch<SessionManager>();
    final user = sm.signedInUser;
    return sm.isSignedIn
        ? Column(
            children: [
              SizedBox(
                width: 128,
                height: 128,
                child: UserImageButton(sessionManager: sm, compact: false),
              ),
              Text(
                  '${user!.userName ?? 'null'}${user.fullName != null ? '(${user.fullName})' : ''}'),
            ],
          )
        : ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInPage()),
            ),
            child: Text("Sign in"),
          );
  }
}
