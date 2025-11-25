import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_client/scopes.dart';

import '../../../di.dart';
import '../../common/user_chip.dart';

class UsersBrowserPage extends StatelessWidget {
  const UsersBrowserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    const chipsSpacing = 10.0;
    final allPrze =
        context.select<UsersBrowserPageCubit, List<PrzeUser>?>(
          (c) => c.state,
        ) ??
        <PrzeUser>[];
    isZarzad(PrzeUser prze) =>
        prze.user!.scopeNames.contains(PrzeScope.zarzad.name);
    return Scaffold(
      appBar: AppBar(title: Text("Cała trzoda 👪")),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          if (allPrze.isEmpty) Text("Ładowanie...", style: tt.headlineMedium),
          Text("Zarzont 👑", style: tt.headlineMedium),
          Wrap(
            spacing: chipsSpacing,
            runSpacing: chipsSpacing,
            children: [
              for (final prze in allPrze.where(isZarzad))
                UserChip(user: prze.user!),
            ],
          ),
          Text("Śmiertelnicy 😇", style: tt.headlineMedium),
          Wrap(
            spacing: chipsSpacing,
            runSpacing: chipsSpacing,
            children: [
              for (final prze in allPrze.where(
                (p) => !isZarzad(p) && !p.user!.blocked,
              ))
                UserChip(user: prze.user!),
            ],
          ),
          Text("Zablokowani ☠", style: tt.headlineMedium),
          Wrap(
            spacing: chipsSpacing,
            runSpacing: chipsSpacing,
            children: [
              for (final prze in allPrze.where((p) => p.user!.blocked))
                UserChip(user: prze.user!),
            ],
          ),
        ],
      ),
    );
  }
}
