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

  late List<GearPair> allGear;
  List<GearPair> gearSelection = [];

  void applyGearFilter() {
    gearSelection = typeChoiceSet.isEmpty
        ? allGear
        : allGear.where((e) => typeChoiceSet.contains(e.gear.type)).toList();
  }

  @override
  void initState() {
    super.initState();
    context.read<Future<List<GearPair>>>().then((v) => setState(() {
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
        ? ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: gearSelection.length,
            itemBuilder: (context, i) =>
                GearListing(gearPair: gearSelection[i]),
          )
        : Placeholder();
  }
}
