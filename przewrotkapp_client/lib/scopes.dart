enum PrzeScope {
  sprzetowiec('sprzetowiec'),
  godzinkowy('godzinkowy');

  final String name;

  const PrzeScope(this.name);

  @override
  String toString() => name;
}
