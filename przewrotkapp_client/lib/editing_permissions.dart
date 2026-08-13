import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_client/scopes.dart';

bool canEditRental(int userId, Set<PrzeScope> scopes, Rental rental) =>
    ((rental.userId == userId && rental.end.isAfter(DateTime.now())) ||
        scopes.contains(PrzeScope.zarzad));

bool canEditComment(int userId, Set<PrzeScope> scopes, Comment comment) =>
    (scopes.contains(PrzeScope.sprzetowiec) || userId == comment.byId);
