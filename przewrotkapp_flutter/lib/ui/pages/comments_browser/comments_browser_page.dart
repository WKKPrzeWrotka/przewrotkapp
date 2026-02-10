import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../logic/data_types.dart';
import '../../common/comment_listing.dart';

class CommentsBrowserPage extends StatelessWidget {
  const CommentsBrowserPage({super.key});

  // Priority:
  // - hours
  // - severity
  List<Comment> sortComments(List<Comment> comments) {
    return comments.toList()..sort((a, b) {
      final hours = (b.hoursForResolving ?? 0).compareTo(
        a.hoursForResolving ?? 0,
      );
      if (hours != 0) return hours;
      severityStrength(CommentType comment) => switch (comment) {
        CommentType.neutral => 0,
        CommentType.warning => 1,
        CommentType.broken => 2,
      };
      final int severity = severityStrength(
        b.type,
      ).compareTo(severityStrength(a.type));
      if (severity != 0) return severity;
      return 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final comments = context.select<UnresolvedComments?, List<Comment>?>(
      (u) => u != null ? sortComments(u) : null,
    );
    // TODO:
    // - search bar?
    // - better listing for standalone
    return Scaffold(
      appBar: AppBar(title: Text("Wszystkie komentarze 📃")),
      body: ListView.builder(
        itemCount: comments?.length ?? 0,
        itemBuilder: (context, i) => CommentListing(comment: comments![i]),
      ),
    );
  }
}
