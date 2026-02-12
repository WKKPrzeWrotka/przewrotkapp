String? noNullValid(Object? any) => any == null ? "Nie może być puste" : null;

String? bareMinimumValid(String? text) =>
    (text?.length ?? 0) < 10 ? "No weź, napisz tu coś porządnego" : null;

String? intValid(String? text) =>
    int.tryParse(text ?? '') == null ? "Musi być całkowita liczba" : null;

String? defaultValid(String? text) => (text == null || text.trim().isEmpty)
    ? "Nie może być puste"
    : (text.length > 32 ? "Za długie" : null);

String? defaultIntValid(String? text) => (text == null || text.trim().isEmpty)
    ? "Nie może być puste"
    : (text.length > 32
          ? "Za długie"
          : (int.tryParse(text) == null
                ? "Ma być liczba, bez przecinka"
                : null));

String? defaultDoubleValid(String? text) =>
    (text == null || text.trim().isEmpty)
    ? "Nie może być puste"
    : (text.length > 32
          ? "Za długie"
          : (double.tryParse(text) == null
                ? "Ma być liczba (z kropką zamiast przecinka)"
                : null));

String? allowNullValid(String? text) =>
    ((text?.length ?? 0) > 32) ? "Za długie" : null;

String? allowNullIntValid(String? text) =>
    (text?.trim().isEmpty ?? true) ? null : defaultIntValid(text);

String? allowNullDoubleValid(String? text) =>
    (text?.trim().isEmpty ?? true) ? null : defaultDoubleValid(text);
