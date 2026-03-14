import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/editing_permissions.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:serverpod_auth_client/module.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../logic/data_types.dart';
import '../../logic/utils.dart';
import '../utils/names_and_strings.dart';
import 'gear_chip.dart';
import 'user_chip.dart';

class RentalListing extends StatelessWidget {
  final Rental rental;

  const RentalListing({super.key, required this.rental});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final allGear = context.watch<AllGearCache?>();
    final client = context.read<Client>();
    final user = context.select<SessionManager, UserInfo>(
      (sm) => sm.signedInUser!,
    );
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "${rental.start.toStringDate(showYear: false)} do "
                  "${rental.end.toStringDate(showYear: false)}",
                ),
                UserChip(user: rental.user!),
                Text("bierze:"),
              ],
            ),
            trailing:
                canDeleteRental(
                  user.id!,
                  PrzeScope.fromNames(user.scopeNames),
                  rental,
                )
                ? IconButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Na pewno?'),
                        content: SingleChildScrollView(
                          child: Text(
                            'Usuwasz to wypożyczenie - na zawsze! '
                            'Jeśli chcesz poprawić sprzęt który wypożyczasz - to dobrze 😇\n'
                            'Zrób nowe, z całością sprzętu który bierzesz\n\n'
                            'Pamiętaj, że jeśli teraz na nowo wypożyczysz sprzęt, '
                            'a do wyjazdu zostało mniej niż dwa dni (albo jest w trakcie 😬), '
                            'zostanie naliczona kara za spóźnialstwo!\n'
                            '(To wciąż lepiej niż gdybyś miał źle oznakowane wypożyczenie 🙄)\n\n'
                            'W razie wyjątkowych sytuacji - skontaktuj się z godzinkowym/ą 🤙 '
                            'może sie nad tobą zlituje',
                          ),
                        ),
                        surfaceTintColor: Colors.red,
                        actions: [
                          TextButton(
                            onPressed: () => context.pop(),
                            child: Text("Dobra jednak nie"),
                          ),
                          FilledButton(
                            onPressed: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text("Przytrzymaj ;)"),
                                  ),
                                ),
                            onLongPress: () async {
                              // TODO: Unify those try-success-fail snackbars everywhere
                              try {
                                await client.rental.deleteRental(rental);
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.green.shade600,
                                      content: Text("Sukces!"),
                                    ),
                                  );
                                  context.pop();
                                }
                              } catch (e) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red.shade800,
                                      content: Text(e.toString()),
                                    ),
                                  );
                                }
                              }
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.red.shade700,
                            ),
                            child: Text("Ta na pewno 😈"),
                          ),
                        ],
                      ),
                    ),
                    icon: Icon(Icons.cancel_outlined, color: Colors.red),
                  )
                : (rental.userId == user.id
                      ? IconButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Poproś kogoś z zarządu ☝️"),
                              content: Text(
                                "To wypożyczenie już się rozpoczęło, "
                                "lub skończyło - jeśli w awaryjnej sytuacji "
                                "chcesz je zmienić, może to zrobić ktoś z zarządu 👑",
                              ),
                              actions: [
                                FilledButton(
                                  onPressed: () => context.pop(),
                                  child: Text("Dobra 👍"),
                                ),
                              ],
                            ),
                          ),
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: t.disabledColor,
                          ),
                        )
                      : null),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                if (allGear != null)
                  for (final gear in rental.gearPairs(allGear))
                    GearChip(gearPair: gear),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
