import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/data_types.dart';
import '../../common/comment_listing.dart';

class CommentsBrowserPage extends StatelessWidget {
  const CommentsBrowserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final comments = context.watch<UnresolvedComments?>();
    // TODO:
    // - sorting
    //   - options for sorting and filtering
    //     - latest, most hours
    // - search bar?
    // - better listing for standalone
    // - categories? big title "broken" that separate them from others, etc
    return Scaffold(
      appBar: AppBar(title: Text("Wszystkie komentarze 📃")),
      body: ListView.builder(
        itemCount: comments?.length ?? 0,
        itemBuilder: (context, i) => CommentListing(comment: comments![i]),
      ),
    );
  }
}
