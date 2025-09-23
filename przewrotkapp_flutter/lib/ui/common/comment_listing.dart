import 'package:flutter/material.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class CommentListing extends StatelessWidget {
  final Comment comment;

  const CommentListing({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: switch (comment.type) {
        CommentType.neutral => null,
        CommentType.warning => Colors.orange.shade200,
        CommentType.broken => Colors.red.shade700,
      },
      child: ListTile(
        title: Text(comment.text),
        subtitle: Row(
          children: [
            Text("Autor: "),
            CircularUserImage(userInfo: comment.by),
            Text(comment.by?.userName ?? ""),
          ],
        ),
      ),
    );
  }
}
