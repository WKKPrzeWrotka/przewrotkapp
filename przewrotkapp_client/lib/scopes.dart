enum PrzeScope {
  zarzad('zarzad'),
  sprzetowiec('sprzetowiec'),
  godzinkowy('godzinkowy');

  final String name;

  const PrzeScope(this.name);

  @override
  String toString() => name;

  static PrzeScope fromName(String name) =>
      PrzeScope.values.firstWhere((v) => v.name == name);

  static Set<PrzeScope> fromNames(Iterable<String> names) =>
      names.map((n) => fromName(n)).toSet();
}
