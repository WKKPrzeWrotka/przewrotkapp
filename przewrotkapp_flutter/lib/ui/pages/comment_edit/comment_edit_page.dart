import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../logic/data_types.dart';
import '../../../logic/form_validation_utils.dart';
import '../../common/gear_chip.dart';
import '../../common/user_chip.dart';
import '../../utils/names_and_strings.dart';

class CommentEditPage extends StatefulWidget {
  final Comment comment;
  final bool emptyFields;

  const CommentEditPage({
    super.key,
    required this.comment,
    required this.emptyFields,
  });

  @override
  State<CommentEditPage> createState() => _CommentEditPageState();
}

class _CommentEditPageState extends State<CommentEditPage> {
  final formKey = GlobalKey<FormState>();
  late final Comment editedComment;

  @override
  void initState() {
    super.initState();
    editedComment = widget.comment.copyWith();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final tt = t.textTheme;
    final client = context.read<Client>();
    final you = context.read<SessionManager>().signedInUser;
    final allGear = context.watch<AllGearCache?>();
    final gearPair = allGear?.firstWhereOrNull(
      (g) => g.gear.id == (editedComment.gearId ?? -1),
    );
    final setInit = !widget.emptyFields;
    return Scaffold(
      appBar: AppBar(title: Text("Edytowanie komentarza")),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Wrap(
              spacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                UserChip(user: editedComment.by!),
                Text("komentuje"),
                editedComment.gearId == null
                    ? Text("🏠 Hangar", style: tt.bodyLarge)
                    : (allGear != null
                          ? GearChip(gearPair: gearPair!)
                          : Text("🟠Ładowanie...")),
              ],
            ),
            SizedBox(height: 8),
            // WARNING: This is done inside this container because:
            // 1. It makes everything jump way less
            // 2. When i was adding widgets to this list, the key shenanigans
            //    were messing up and Form Fields where given each other values
            Opacity(
              opacity: editedComment.resolved ? 1 : 0,
              child: Wrap(
                spacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text("✅ Rozwiązany"),
                  Text("${editedComment.dateResolved?.toStringDate()}"),
                  Text("przez"),
                  if (editedComment.resolvedBy != null)
                    UserChip(user: editedComment.resolvedBy!),
                ],
              ),
            ),
            Divider(),
            DropdownMenuFormField(
              initialSelection: setInit ? editedComment.type : null,
              dropdownMenuEntries: CommentType.values
                  .map((c) => DropdownMenuEntry(value: c, label: c.humanName))
                  .toList(),
              onSelected: (c) => editedComment.type = c!,
              validator: noNullValid,
              label: Text("Kategoria"),
            ),
            TextFormField(
              initialValue: setInit ? editedComment.text : null,
              onChanged: (t) => editedComment.text = t,
              validator: bareMinimumValid,
              decoration: InputDecoration(label: Text("Opis")),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: setInit
                  ? editedComment.hoursForResolving?.toString()
                  : null,
              onChanged: (t) =>
                  editedComment.hoursForResolving = int.tryParse(t),
              validator: allowNullIntValid,
              decoration: InputDecoration(
                label: Text("💸 Proponowane godzinki za rozwiązanie"),
              ),
            ),
            CheckboxListTile(
              title: Text("Rozwiązany"),
              value: editedComment.resolved,
              onChanged: (n) => setState(() {
                editedComment.resolved = n ?? false;
                editedComment.resolvedBy = editedComment.resolved ? you : null;
                editedComment.resolvedById = editedComment.resolved
                    ? you!.id!
                    : null;
                editedComment.dateResolved = editedComment.resolved
                    ? DateTime.now()
                    : null;
              }),
            ),
            SizedBox(height: 8 * 3),
            FilledButton(
              onPressed: () {
                formKey.currentState?.validate();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Przytrzymaj :)")));
              },
              onLongPress: () async {
                if (!(formKey.currentState?.validate() ?? false)) return;
                // TODO: Unify this
                try {
                  await client.comments.createOrUpdateComment(editedComment);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Sukces!"),
                      ),
                    );
                  }
                  await Future.delayed(Duration(milliseconds: 500));
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
              child: Text("Zapisz!"),
            ),
          ],
        ),
      ),
    );
  }
}
