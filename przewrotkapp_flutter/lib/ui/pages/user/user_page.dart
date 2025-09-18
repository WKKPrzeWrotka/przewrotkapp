import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class UserPage extends StatefulWidget {
  final int userId;

  const UserPage({super.key, required this.userId});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _userCmpl = Completer<UserInfoPublic>();

  @override
  void initState() {
    super.initState();
    context
        .read<Client>()
        .user
        .getUserInfo(widget.userId)
        .then(_userCmpl.complete);
  }

  @override
  Widget build(BuildContext context) {
    final sm = context.watch<SessionManager>();
    final isYou = sm.signedInUser?.id == widget.userId;
    return Scaffold(
      appBar: AppBar(
        title: Text('User page :>'),
        automaticallyImplyLeading: true,
      ),
      body: FutureBuilder(
        future: _userCmpl.future,
        builder: (context, snap) {
          if (!snap.hasData) return Placeholder();
          final user = snap.data!;
          return Column(
            children: [
              isYou
                  ? SizedBox(
                      width: 128,
                      height: 128,
                      child:
                          UserImageButton(sessionManager: sm, compact: false),
                    )
                  : CircularUserImage(
                      userInfoPublic: user,
                      size: 128,
                    ),
              Text(
                  '${user.userName ?? 'null'}${user.fullName != null ? '(${user.fullName})' : ''}'),
            ],
          );
        },
      ),
    );
  }
}
