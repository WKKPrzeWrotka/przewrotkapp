import 'package:flutter/material.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../data_types.dart';
import 'utils.dart';

class GearSearchFilters extends StatefulWidget {
  final GearSearchParams initialParams;
  final void Function(GearSearchParams params) onFiltersChange;

  const GearSearchFilters({
    super.key,
    this.initialParams = GearSearchParams.mainDefault,
    required this.onFiltersChange,
  });

  @override
  State<GearSearchFilters> createState() => _GearSearchFiltersState();
}

class _GearSearchFiltersState extends State<GearSearchFilters> {
  final searchCtrl = TextEditingController();
  var selectedGearType = GearType.kayak;

  void filters() => widget.onFiltersChange(GearSearchParams(
        text: searchCtrl.text,
        types: {selectedGearType},
      ));

  @override
  void initState() {
    super.initState();
    searchCtrl.text = widget.initialParams.text ?? "";
    selectedGearType = widget.initialParams.types?.first ?? GearType.kayak;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
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
