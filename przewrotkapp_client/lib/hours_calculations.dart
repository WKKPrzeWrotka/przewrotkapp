import 'dart:math';

import 'package:przewrotkapp_client/scopes.dart';

import 'przewrotkapp_client.dart';

/// Kajak         = 2h
/// Kajak + szpej = 2h
/// Sam szpej     = 1h
///
/// Zarząd ma po jednym kajako-szpeju za darmo (a za ekstra już płaci)
int hoursForGear(
    Set<GearPair> gear, int numberOfDays, Set<PrzeScope> userScopes) {
  const hoursForKayak = 2;
  const hoursForGear = 1;
  final isZarzad = userScopes.contains(PrzeScope.zarzad);

  // Just in case 😅
  if (numberOfDays < 0) throw "Bro wtf";

  // Policz ile wziął kajaków - licz kanadyjkę podwójnie
  // (raz w tej linii i dodaj w countKayaks, gdzie też są wliczane jako kajak)
  var countKanadyjki = gear
      .where((e) =>
          e.gear.type == GearType.kayak &&
          {KayakType.kanadyjka, KayakType.dwuOsobowy}
              .contains((e.gearExtra as GearKayak).type))
      .length;
  var countKayaks =
      gear.where((e) => e.gear.type == GearType.kayak).length + countKanadyjki;

  // Zobacz na inne rodzaje
  final otherTypes = GearType.values.toList()
    ..remove(GearType.kayak)
    ..remove(GearType.floatbag);
  // Policz ile wziął sprzętu z każdej kategorii
  var otherMaxCount = [
    // Wyjątkowo dla komór - podziel ilość na dwa, zaokrąglij do pełnych w góre
    (gear.where((e) => e.gear.type == GearType.floatbag).length / 2).ceil(),
    // Dla reszty normalnie weź ilość z każdego typu
    for (final type in otherTypes)
      gear.where((e) => e.gear.type == type).length,
    // Znajdź maksymalną liczbę z wszystkich tych wyliczanek
  ].reduce(max);

  // Jeśli z zarządu - jeden Kajako-zestaw gratis
  if (isZarzad) {
    // Jeśli w zestawie jest kanadyjka, odejmij po dwa kajaki i dwa sprzęty
    // (Znowu - kanadyjka jest po prostu liczona jako dwa kajaki, i uprawnia
    // do wzięcia dwóch zestawów sprzętu)
    final freeCount = countKanadyjki > 0 ? 2 : 1;
    countKayaks = max(countKayaks - freeCount, 0);
    otherMaxCount = max(otherMaxCount - freeCount, 0);
  }

  // Ponieważ wzięcie kajaka już uprawnia do wzięcia innego sprzętu:
  // Odejmij od maks ilości sprzętu ilość kajaków. Sprowadź do 0 jeśli wyszło
  // ujemnie.
  // Jeśli nie, wtedy to jest ilość ekstra sprzętu za który ma zapłacić (1h)
  final otherEffectiveCount = max(otherMaxCount - countKayaks, 0);

  return ((countKayaks * hoursForKayak) +
          (otherEffectiveCount * hoursForGear)) *
      numberOfDays;
}
