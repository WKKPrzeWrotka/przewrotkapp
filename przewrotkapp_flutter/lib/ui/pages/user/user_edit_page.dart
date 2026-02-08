import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class UserEditPage extends StatefulWidget {
  final PrzeUser przeUser;

  const UserEditPage({super.key, required this.przeUser});

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  final key = GlobalKey<FormState>();
  late final TextEditingController ctrlUsername;
  late final TextEditingController ctrlFullName;
  late final TextEditingController ctrlPhone;

  @override
  void initState() {
    super.initState();
    ctrlUsername = TextEditingController(text: widget.przeUser.user?.userName);
    ctrlFullName = TextEditingController(text: widget.przeUser.user?.fullName);
    ctrlPhone = TextEditingController(text: widget.przeUser.phoneNumber);
  }

  String stripPhone(String phone) =>
      phone.trim().replaceAll(' ', '').replaceAll('-', '');

  @override
  Widget build(BuildContext context) {
    final extra = widget.przeUser;
    final user = extra.user!;
    final sm = context.read<SessionManager>();
    final client = context.read<Client>();
    return Scaffold(
      appBar: AppBar(title: Text('Edytowanie usera')),
      body: Form(
        key: key,
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            Center(
              child: SizedBox(
                width: 86,
                height: 86,
                child: UserImageButton(sessionManager: sm, compact: false),
              ),
            ),
            TextFormField(
              controller: ctrlUsername,
              decoration: InputDecoration(label: Text('Ksywa 😎')),
            ),
            TextFormField(
              controller: ctrlFullName,
              decoration: InputDecoration(label: Text('Pełne nazwisko 😒')),
            ),
            TextFormField(
              controller: ctrlPhone,
              keyboardType: TextInputType.numberWithOptions(signed: true),
              decoration: InputDecoration(label: Text('Numer telefonu 📞')),
              validator: (input) {
                if (input?.trim().isEmpty ?? true) return "Musisz mieć numer!";
                return int.tryParse(stripPhone(input!.replaceAll('+', ''))) !=
                        null
                    ? null
                    : "Napisz ten numer dobrze 😒";
              },
            ),
            // TODO: Social links
            SizedBox(height: 8),
            TextButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        // TODO: może by tu jednak pokierować do skarbnika?
                        Text("Nie da sie 😈"),
                        ElevatedButton(
                          onPressed: () => context.pop(),
                          child: Text("No dobra :("),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              child: Text("Jak zmienić email?"),
            ),
            SizedBox(height: 8),
            FilledButton(
              onPressed: () async {
                if (key.currentState!.validate()) {
                  await client.user.updateUser(
                    extra.copyWith(
                      user: user.copyWith(
                        userName: ctrlUsername.text.trim().isNotEmpty
                            ? ctrlUsername.text.trim()
                            : null,
                        fullName: ctrlFullName.text.trim().isNotEmpty
                            ? ctrlFullName.text.trim()
                            : null,
                      ),
                      phoneNumber: stripPhone(ctrlPhone.text).isNotEmpty
                          ? stripPhone(ctrlPhone.text)
                          : null,
                    ),
                  );
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.green,
                        content: Text("Zapisane!"),
                      ),
                    );
                  }
                }
              },
              child: Text("Zapisz"),
            ),
          ],
        ),
      ),
    );
  }
}
