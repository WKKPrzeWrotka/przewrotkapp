/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum HourCategory implements _i1.SerializableModel {
  /// Wypożyczenie sprzętu, zawsze ujemne
  rental(label: "Wypożyczenie"),

  /// Pomoc przy szkoleniówce
  helpAtCourse(label: "Pomoc przy szkoleniówce"),

  /// Pomoc w promocji klubu (stanie na DASach, rozwieszanie plakatów, itp)
  helpAtPromotion(label: "Pomoc w promocji klubu"),

  /// Pomoc przy nie-szkoleniówkowych wydarzeniach klubowych (PrzeRodziny, organizacja spływów, organizacja nie-kajakowych imprez integracyjnych)
  helpAtEvent(label: "Pomoc przy innych wydarzeniach"),

  /// Pomoc sprzętowa (naprawianie kajaków, sprzątanie hangaru)
  helpAtGear(label: "Prace sprzętowe"),

  /// Dotacja sprzętu do klubu lub zakup godzinek pieniędzmi
  donation(label: "Dotacja"),

  /// Wypłaty funkcyjnych
  functionary(label: "Funkcyjne"),

  /// Darmowe godzinki za płacenie składki, albo na start
  bonus(label: "Bonus"),

  /// Kary wszelakiej maści - za niepłacenie składki, za późne wypożyczanie sprzętu, za brak uśmiechu na wodzie
  punishment(label: "Kara"),
  other(label: "Inne");

  final String label;

  const HourCategory({required this.label});

  static HourCategory fromJson(String name) {
    switch (name) {
      case 'rental':
        return HourCategory.rental;
      case 'helpAtCourse':
        return HourCategory.helpAtCourse;
      case 'helpAtPromotion':
        return HourCategory.helpAtPromotion;
      case 'helpAtEvent':
        return HourCategory.helpAtEvent;
      case 'helpAtGear':
        return HourCategory.helpAtGear;
      case 'donation':
        return HourCategory.donation;
      case 'functionary':
        return HourCategory.functionary;
      case 'bonus':
        return HourCategory.bonus;
      case 'punishment':
        return HourCategory.punishment;
      case 'other':
        return HourCategory.other;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "HourCategory"');
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
