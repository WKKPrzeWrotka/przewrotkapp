import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../utils/names_and_strings.dart';

class HoursEditPage extends StatefulWidget {
  final Hour hour;
  final bool emptyFields;

  const HoursEditPage({
    super.key,
    required this.hour,
    required this.emptyFields,
  });

  @override
  State<HoursEditPage> createState() => _HoursEditPageState();
}

class _HoursEditPageState extends State<HoursEditPage> {
  final formKey = GlobalKey<FormState>();
  late final Hour editedHour;

  @override
  void initState() {
    super.initState();
    editedHour = widget.hour.copyWith();
  }

  String? noNullValid(Object? any) => any == null ? "Nie może być puste" : null;

  String? bareMinimumValid(String? text) =>
      (text?.length ?? 0) < 10 ? "No weź, napisz tu coś porządnego" : null;

  String? intValid(String? text) =>
      int.tryParse(text ?? '') == null ? "Musi być całkowita liczba" : null;

  @override
  Widget build(BuildContext context) {
    const spacing = 8.0;
    final sm = context.watch<SessionManager>();
    final isGodzinkowy = sm.signedInUser!.scopeNames.contains(
      PrzeScope.godzinkowy.name,
    );
    final setInit = !widget.emptyFields;
    final client = context.read<Client>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.emptyFields
              ? "Zgłoś należne ci godzinki"
              : "Edytowanie godzinek",
        ),
        actions: [
          if (isGodzinkowy && setInit)
            TextButton.icon(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Na pewno?'),
                  content: Text(
                    'Usuwasz tą godzinke - na zawsze! Nie ma odwrotu!',
                  ),
                  surfaceTintColor: Colors.red,
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text("Dobra jednak nie..."),
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
                          await client.hours.deleteHour(widget.hour);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green.shade600,
                                content: Text("Sukces!"),
                              ),
                            );
                            context.pop();
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
                      child: Text("Ta na pewno"),
                    ),
                  ],
                ),
              ),
              style: TextButton.styleFrom(foregroundColor: Colors.red.shade900),
              icon: Icon(Icons.delete),
              label: Text("Usuń"),
            ),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: setInit ? editedHour.amount.toString() : null,
              onChanged: (t) => editedHour.amount = int.tryParse(t) ?? 0,
              validator: intValid,
              decoration: InputDecoration(label: Text("Ilość")),
            ),
            SizedBox(height: spacing),
            TextFormField(
              initialValue: setInit ? editedHour.description : null,
              onChanged: (t) => editedHour.description = t,
              validator: bareMinimumValid,
              decoration: InputDecoration(label: Text("Opis")),
            ),
            SizedBox(height: spacing),
            DropdownMenuFormField(
              initialSelection: setInit ? editedHour.category : null,
              dropdownMenuEntries: HourCategory.values
                  .map((c) => DropdownMenuEntry(value: c, label: c.humanName))
                  .toList(),
              onSelected: (c) => editedHour.category = c!,
              validator: noNullValid,
              label: Text("Kategoria"),
            ),
            SizedBox(height: spacing),
            Text(editedHour.date.toStringDate()),
            SizedBox(height: spacing),
            ElevatedButton(
              onPressed: () async {
                editedHour.date =
                    (await showDatePicker(
                      context: context,
                      initialDate: setInit ? editedHour.date : null,
                      firstDate: DateTime.now().subtract(Duration(days: 365)),
                      lastDate: DateTime.now().add(Duration(days: 60)),
                    ))?.copyWith(hour: 12) ??
                    editedHour.date;
                setState(() {});
              },
              child: Text("Wybierz date"),
            ),
            if (isGodzinkowy)
              CheckboxListTile(
                title: Text("Zatwierdzona"),
                value: editedHour.approved,
                onChanged: (n) =>
                    setState(() => editedHour.approved = n ?? false),
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
                  await client.hours.createOrUpdateHour(editedHour);
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
