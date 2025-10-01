import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_client/module.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../utils/names_and_strings.dart';

class UserChip extends StatelessWidget {
  final UserInfo userInfo;

  const UserChip({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: () => context.push('/user/${userInfo.id}'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      avatar: CircularUserImage(userInfo: userInfo, size: 63),
      label: Text(userInfo.name),
    );
  }
}
