import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/scopes.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../logic/data_types.dart';
import '../../../logic/gear_search.dart';
import '../../common/gear_listing.dart';
import '../../common/gear_search_filters.dart';
import 'new_gear_dialog.dart';

class GearBrowserPage extends StatefulWidget {
  const GearBrowserPage({super.key});

  @override
  State<GearBrowserPage> createState() => _GearBrowserPageState();
}

class _GearBrowserPageState extends State<GearBrowserPage> {
  var params = GearSearchParams.mainDefault;

  @override
  Widget build(BuildContext context) {
    final sm = context.read<SessionManager>();
    final isSprzetowiec =
        sm.signedInUser?.scopeNames.contains(
          PrzeScope.sprzetowiec.toString(),
        ) ??
        false;
    final allGear = context.watch<AllGearCache?>();
    final favs = context.watch<UserFavourites?>()?.gearIds;
    final filteredGear = sortGear(
      searchGear(allGear ?? [], params),
      favs ?? [],
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: 350,
            title: Text("Cały sprzęt"),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.only(
                top: kToolbarHeight,
                left: 8,
                right: 8,
              ),
              expandedTitleScale: 1,
              title: SizedBox(
                height: 350,
                child: SingleChildScrollView(
                  child: GearSearchFilters(
                    // set this same as var params = ...
                    initialParams: GearSearchParams.mainDefault,
                    onFiltersChange: (newParams) {
                      params = newParams;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
            actions: [
              if (isSprzetowiec)
                TextButton.icon(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => NewGearDialog(),
                  ),
                  icon: Icon(Icons.add),
                  label: Text("Nowy"),
                ),
            ],
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
