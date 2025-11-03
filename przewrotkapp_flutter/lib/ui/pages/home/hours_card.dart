import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class HoursCard extends StatefulWidget {
  const HoursCard({super.key});

  @override
  State<HoursCard> createState() => _HoursCardState();
}

class _HoursCardState extends State<HoursCard> {
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final client = context.read<Client>();
    final sm = context.watch<SessionManager>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Text('Twoje godzinki:'),
            // TODO: Change this to some cool di, this is just for demo now
            StreamBuilder(
              stream: client.user.watchHoursSum(sm.signedInUser!.id!),
              builder: (context, snap) => Text(
                snap.hasData ? '${snap.data}h' : 'Ładowanie...',
                style: tt.displayMedium,
              ),
            ),
            ElevatedButton(
              onPressed: () => context.push('/comments'),
              child: Text("Zarób!"),
            ),
          ],
        ),
      ),
    );
  }
}
