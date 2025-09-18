import 'package:flutter/material.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';
import 'utils.dart';
import 'package:rxdart/rxdart.dart';

class GearSearchFilters extends StatefulWidget {
  final void Function({
    String? text,
    Set<GearType>? types,
  }) onFiltersChange;

  const GearSearchFilters({super.key, required this.onFiltersChange});

  @override
  State<GearSearchFilters> createState() => _GearSearchFiltersState();
}

class _GearSearchFiltersState extends State<GearSearchFilters> {
  final searchCtrl = TextEditingController();
  var selectedGearType = GearType.kayak;

  void filters() => widget.onFiltersChange(
        text: searchCtrl.text,
        types: {selectedGearType},
      );

  @override
  void initState() {
    super.initState();
    searchCtrl
        .toStream()
        .debounceTime(Duration(milliseconds: 250))
        .listen((_) => filters());
    Future.microtask(() => filters());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [
            for (final type in GearType.values)
              ChoiceChip(
                label: Text(type.toDisplayString()),
                selected: selectedGearType == type,
                onSelected: (v) {
                  if (v) selectedGearType = type;
                  setState(() {});
                  filters();
                },
              ),
          ],
        ),
        SearchBar(
          controller: searchCtrl,
          leading: Icon(Icons.search),
          trailing: [
            if (searchCtrl.text.isNotEmpty)
              IconButton(
                onPressed: () {
                  searchCtrl.clear();
                  setState(() {});
                },
                icon: Icon(Icons.clear),
              ),
          ],
          onChanged: (_) => setState(() {}),
        ),
      ],
    );
  }
}
