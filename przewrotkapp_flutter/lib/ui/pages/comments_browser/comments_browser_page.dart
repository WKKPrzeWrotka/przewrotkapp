import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../logic/comments_utils.dart';
import '../../../logic/data_types.dart';
import '../../../logic/utils.dart';
import '../../common/comment_listing.dart';

class CommentsBrowserPage extends StatelessWidget {
  const CommentsBrowserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final comments = context.select<AllComments?, List<Comment>?>(
      (u) => u != null
          ? sortComments(
              u.where(
                (c) =>
                    !(!c.resolved &&
                        c.type == CommentType.neutral &&
                        (c.hoursForResolving ?? 0) == 0),
              ),
            )
          : null,
    );
    final sm = context.read<SessionManager>();
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: ListView.builder(
        itemCount: comments?.length ?? 0,
        itemBuilder: (context, i) => CommentListing(comment: comments![i]),
      ),
    );
  }
}
