import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../data_types.dart';
import '../../../gear_search.dart';
import '../../common/gear_listing.dart';
import '../../common/gear_search_filters.dart';

class GearBrowserPage extends StatefulWidget {
  const GearBrowserPage({super.key});

  @override
  State<GearBrowserPage> createState() => _GearBrowserPageState();
}

class _GearBrowserPageState extends State<GearBrowserPage> {
  var filteredGear = <GearPair>[];

  @override
  Widget build(BuildContext context) {
    final allGear = context.watch<AllGearCache?>();
    final favs = context.watch<UserFavourites?>()?.gearIds ?? [];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: 300,
            title: Text("Cały sprzęt"),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding:
                  EdgeInsets.only(top: kToolbarHeight, left: 8, right: 8),
              expandedTitleScale: 1,
              title: GearSearchFilters(
                onFiltersChange: ({text, types}) {
                  filteredGear = sortGear(
                    searchGear(allGear ?? [], text: text, types: types),
                    favs,
                  );
                  setState(() {});
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => GearListing(gearPair: filteredGear[i]),
              childCount: filteredGear.length,
            ),
          ),
        ],
      ),
    );
  }
}
