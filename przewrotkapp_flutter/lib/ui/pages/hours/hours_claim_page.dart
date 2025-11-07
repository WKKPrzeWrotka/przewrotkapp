import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../utils/names_and_strings.dart';

class HoursClaimPage extends StatefulWidget {
  const HoursClaimPage({super.key});

  @override
  State<HoursClaimPage> createState() => _HoursClaimPageState();
}

class _HoursClaimPageState extends State<HoursClaimPage> {
  final formKey = GlobalKey<FormState>();
  final hour = Hour(
    userId: -1,
    amount: 0,
    description: '',
    category: HourCategory.other,
    date: DateTime.now(),
    approved: false,
  );

  String? noNullValid(Object? any) => any == null ? "Nie może być puste" : null;

  String? bareMinimumValid(String? text) =>
      (text?.length ?? 0) < 10 ? "No weź, napisz tu coś porządnego" : null;

  String? intValid(String? text) =>
      int.tryParse(text ?? '') == null ? "Musi być całkowita liczba" : null;

  @override
  Widget build(BuildContext context) {
    const spacing = 8.0;
    final sm = context.watch<SessionManager>();
    final client = context.read<Client>();
    hour.userId = sm.signedInUser!.id!;
    return Scaffold(
      appBar: AppBar(title: Text("Zgłoś należne ci godzinki")),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (t) => hour.amount = int.tryParse(t) ?? 0,
              validator: intValid,
              decoration: InputDecoration(label: Text("Ilość")),
            ),
            SizedBox(height: spacing),
            TextFormField(
              onChanged: (t) => hour.description = t,
              validator: bareMinimumValid,
              decoration: InputDecoration(label: Text("Opis")),
            ),
            SizedBox(height: spacing),
            DropdownMenuFormField(
              dropdownMenuEntries: HourCategory.values
                  .where(
                    (c) =>
                        c != HourCategory.rental &&
                        c != HourCategory.punishment,
                  )
                  .map((c) => DropdownMenuEntry(value: c, label: c.label))
                  .toList(),
              onSelected: (c) => hour.category = c!,
              validator: noNullValid,
              label: Text("Kategoria"),
            ),
            SizedBox(height: spacing),
            Text(hour.date.toStringDate()),
            SizedBox(height: spacing),
            ElevatedButton(
              onPressed: () async {
                hour.date =
                    await showDatePicker(
                      context: context,
                      firstDate: DateTime.now().subtract(Duration(days: 365)),
                      lastDate: DateTime.now().add(Duration(days: 60)),
                    ) ??
                    hour.date;
                setState(() {});
              },
              child: Text("Wybierz date"),
            ),
            SizedBox(height: spacing * 3),
            FilledButton(
              onPressed: () {
                formKey.currentState?.validate();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Przytrzymaj :)")));
              },
              onLongPress: () async {
                if (!(formKey.currentState?.validate() ?? false)) return;
                try {
                  await client.hours.claimHour(hour);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Sukces!"),
                      ),
                    );
                  }
                  await Future.delayed(Duration(seconds: 1));
                  if (context.mounted) context.pop();
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Błąd :( $e"),
                      ),
                    );
                  }
                }
              },
              child: Text("Zgłoś!"),
            ),
          ],
        ),
      ),
    );
  }
}
