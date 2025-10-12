import 'package:serverpod/server.dart';

class PrzeScope extends Scope {
  const PrzeScope(String super.name);

  static const sprzetowiec = PrzeScope('sprzetowiec');
  static const godzinkowy = PrzeScope('godzinkowy');
}
