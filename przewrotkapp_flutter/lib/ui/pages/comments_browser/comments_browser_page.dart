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
      (u) => u != null ? sortComments(u) : null,
    );
    final sm = context.read<SessionManager>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Komentarze 📃"),
        actions: [
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
