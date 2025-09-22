import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kalender/kalender.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../data_types.dart';
import '../../common/rental_listing.dart';
import '../../common/utils.dart';

class RentalGroupDetailsPage extends StatelessWidget {
  final DateTime from;
  final DateTime to;

  const RentalGroupDetailsPage({
    super.key,
    required this.from,
    required this.to,
  });

  @override
  Widget build(BuildContext context) {
    final allGroups = context.watch<FutureRentalGroups?>();
    final group = allGroups?.firstWhereOrNull(
      (g) => g.from.isSameDay(from) && g.to.isSameDay(to),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          allGroups == null
              ? "Ładowanie..."
              : group != null
                  ? "Wyjazd ${group.from.toStringDate(showYear: false)} - "
                      "${group.to.toStringDate(showYear: false)}"
                  : "Nie znalezionow :(",
        ),
      ),
      body: ListView(
        children: [
          if (allGroups == null) Text("Ładowanie..."),
          for (final rental in group?.rentals ?? <Rental>[])
            RentalListing(rental: rental),
        ],
      ),
    );
  }
}
