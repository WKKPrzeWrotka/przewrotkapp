import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'package:przewrotkapp_flutter/ui/common/gear_listing.dart';
import 'package:przewrotkapp_flutter/ui/common/utils.dart';

class GearBrowserPage extends StatefulWidget {
  const GearBrowserPage({super.key});

  @override
  State<GearBrowserPage> createState() => _GearBrowserPageState();
}

class _GearBrowserPageState extends State<GearBrowserPage> {
  var typeChoiceSet = <GearType>{};

  late List<(Gear, dynamic)> allGear;
  List<(Gear, dynamic)> gearSelection = [];

  void applyGearFilter() {
    gearSelection = typeChoiceSet.isEmpty
        ? allGear
        : allGear.where((e) => typeChoiceSet.contains(e.$1.type)).toList();
  }

  @override
  void initState() {
    super.initState();
    _getAllGear(context.read<Client>()).then((v) => setState(() {
          allGear = v;
          gearSelection = v;
        }));
  }

  Widget choiceBottomSheet(BuildContext ctx, StateSetter setStateSheet) =>
      DraggableScrollableSheet(
        expand: false,
        builder: (ctx, controller) => ListView(
          controller: controller,
          children: [
            ListTile(
              leading: IconButton(
                onPressed: Navigator.of(ctx).pop,
                icon: Icon(Icons.close),
              ),
              title: Text("Type"),
              trailing: TextButton(
                onPressed: () {
                  typeChoiceSet = {};
                  setStateSheet(() {});
                  setState(() {});
                  Navigator.of(ctx).pop();
                },
                child: Text("Clear"),
              ),
            ),
            for (final type in GearType.values)
              CheckboxListTile(
                value: typeChoiceSet.contains(type),
                onChanged: (v) {
                  if (v ?? false) {
                    typeChoiceSet.add(type);
                  } else {
                    typeChoiceSet.remove(type);
                  }
                  applyGearFilter();
                  setStateSheet(() {});
                  setState(() {});
                },
                title: Text(type.toString()),
                secondary: Text(gearTypeToEmoji(type),
                    style: Theme.of(ctx).textTheme.titleLarge),
              ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    _showSheet() => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: true,
          builder: (ctx) => StatefulBuilder(
              builder: (ctx, stateSetter) =>
                  choiceBottomSheet(ctx, stateSetter)),
        );

    return gearSelection.isNotEmpty
        ? ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SearchBar(),
              Row(
                children: [
                  FilterChip(
                    label: Text(
                      typeChoiceSet.isEmpty
                          ? "Type"
                          : typeChoiceSet.map(gearTypeToEmoji).join("+"),
                    ),
                    onSelected: (e) => _showSheet(),
                    selected: typeChoiceSet.isNotEmpty,
                    deleteIcon: Icon(Icons.arrow_drop_down),
                    onDeleted: _showSheet,
                    // avatar: Icon(Icons.account_box),
                    deleteButtonTooltipMessage: "Select",
                  ),
                ],
              ),
              for ((Gear, dynamic) gear in gearSelection)
                GearListing(
                  gear: gear.$1,
                  subtypeData: gear.$2,
                ),
            ],
          )
        : Placeholder();
  }
}

Future<List<(Gear, dynamic)>> _getAllGear(Client client) async {
  final all = await Future.wait([
    client.gearRead.getAllBelts(),
    client.gearRead.getAllClothes(),
    client.gearRead.getAllFloatbags(),
    client.gearRead.getAllHelmets(),
    client.gearRead.getAllKayaks(),
    client.gearRead.getAllPaddles(),
    client.gearRead.getAllPfds(),
    client.gearRead.getAllSpraydecks(),
    client.gearRead.getAllThrowbags(),
  ]);
  return [for (final a in all) ...a]
      .map((dynamic e) => (e.gear as Gear, e))
      .toList();
}
