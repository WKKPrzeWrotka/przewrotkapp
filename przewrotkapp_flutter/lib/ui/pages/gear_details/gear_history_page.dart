import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../logic/data_types.dart';
import '../../common/rental_listing.dart';
import '../../utils/names_and_strings.dart';

class GearHistoryPage extends StatelessWidget {
  final String clubId;

  const GearHistoryPage({super.key, required this.clubId});

  @override
  Widget build(BuildContext context) {
    final gearPair = context.watch<AllGearCache?>()?.firstWhere(
      (e) => e.gear.clubId == clubId,
    );
    final gear = gearPair?.gear;
    final client = context.read<Client>();

    return Scaffold(
      // Avoid bottom overflow on keyboards
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "${gear != null ? gear.type.toDisplayString(plural: false) : ''} $clubId",
        ),
      ),
      body: FutureBuilder<List<Rental>>(
        future: client.rental.getRentals(past: true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("🟠 Ładowanie...");
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Błąd ładowania histori wypożyczeń: ${snapshot.error}",
              ),
            );
          }

          final rentalsValue = snapshot.data ?? [];

          // Filter and inline-sort descending by lastModified using cascade operator ..sort
          final filteredRentals = gear != null
              ? (rentalsValue
                        .where(
                          (r) =>
                              r.junctions?.any((j) => j.gearId == gear.id) ??
                              false,
                        )
                        .toList()
                      ..sort(
                        (a, b) => b.lastModified.compareTo(a.lastModified),
                      ))
                    .take(10)
                    .toList()
              : <Rental>[];

          if (filteredRentals.isEmpty) {
            return const Center(
              child: Text("Nie znaleziono histori wypożyczeń."),
            );
          }

          return CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: filteredRentals.length,
                itemBuilder: (context, i) =>
                    RentalListing(rental: filteredRentals[i]),
              ),
            ],
          );
        },
      ),
    );
  }
}
