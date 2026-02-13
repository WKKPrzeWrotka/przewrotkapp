import 'package:przewrotkapp_client/przewrotkapp_client.dart';

/// Priority:
/// - hours
/// - severity
List<Comment> sortComments(Iterable<Comment> comments) {
  return comments.toList()..sort((a, b) {
    final resolvedStrength = switch ((a.resolved, b.resolved)) {
      (true, true) => 0,
      (true, false) => 1,
      (false, true) => -1,
      (false, false) => 0,
    };
    if (resolvedStrength != 0) return resolvedStrength;
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
