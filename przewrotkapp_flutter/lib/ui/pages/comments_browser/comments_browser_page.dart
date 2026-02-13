import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../logic/comments_utils.dart';
import '../../../logic/data_types.dart';
import '../../../logic/utils.dart';
import '../../common/comment_listing.dart';
import '../../common/prze_sliver_app_bar.dart';

class CommentsBrowserPage extends StatefulWidget {
  const CommentsBrowserPage({super.key});

  @override
  State<CommentsBrowserPage> createState() => _CommentsBrowserPageState();
}

class _CommentsBrowserPageState extends State<CommentsBrowserPage> {
  var onlyWithHours = true;
  var resolved = false;

  @override
  Widget build(BuildContext context) {
    final comments = context.select<AllComments?, List<Comment>?>(
      (u) => u != null
          ? sortComments(
              u.where(
                (c) =>
                    // Jeśli spełnia któryś z tych, to go nie dawaj
                    !(
                    // onlyWithHours zaznaczone i ma zero godzinek
                    (onlyWithHours && (c.hoursForResolving ?? 0) == 0) ||
                        // jest odznaczone resolved a on jest resolved
                        (!resolved && c.resolved)),
              ),
            )
          : null,
    );
    final sm = context.read<SessionManager>();
    return Scaffold(
      // this is to avoid https://github.com/flutter/flutter/issues/124205
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          PrzeSliverAppBar(
            title: Text("Zarób🤑"),
            actions: [
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: ListView(
                      padding: EdgeInsets.all(16),
                      shrinkWrap: true,
                      children: [
                        Text("""📜 Oto lista wszystkich komentarzy do sprzętu

💸 Niektórych z nich mają ilość godzinek za ich naprawienie - jeśli chcesz troche zarobić, to idealny sposób!

⚠️ Ilość godzinek jest sugerowana - jeśli dobrze wynegocjujesz, możesz sie dorobić nieco więcej 😉 (albo nieco mniej, jeśli zrobisz kaszane 😜)

➕ Na górze jest przycisk dodaj - dodaje się nim komentarz ogólno-klubowy (np. 'Trzeba umyć podłoge')

🛶 Jeśli chcesz skomentować sprzęt, znajdź go, i przycisk w jego szczegółach

Owocnej pracy 🫡"""),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => context.pop(),
                          child: Text("Dzięki!"),
                        ),
                      ],
                    ),
                  ),
                ),
                child: Text("O co chodzi?"),
              ),
              TextButton.icon(
                onPressed: () => context.push(
                  '/comments/edit?emptyFields=true',
                  extra: CommentHandy.empty(
                    sm.signedInUser!.id!,
                  ).copyWith(by: sm.signedInUser, dateCreated: DateTime.now()),
                ),
                icon: Icon(Icons.add),
                label: Text('Dodaj'),
              ),
            ],
            flexibleContent: Wrap(
              spacing: 4,
              runSpacing: 4,
              alignment: WrapAlignment.start,
              children: [
                FilterChip(
                  selected: onlyWithHours,
                  label: Text("💸Tylko z godzinkami"),
                  onSelected: (v) =>
                      setState(() => onlyWithHours = !onlyWithHours),
                ),
                FilterChip(
                  selected: resolved,
                  label: Text("✅Rozwiązane"),
                  onSelected: (v) => setState(() => resolved = !resolved),
                ),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: comments?.length ?? 0,
            itemBuilder: (context, i) => CommentListing(comment: comments![i]),
          ),
        ],
      ),
    );
  }
}
