import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../logic/data_types.dart';

class GearEditPage extends StatefulWidget {
  final String clubId;

  const GearEditPage({super.key, required this.clubId});

  @override
  State<GearEditPage> createState() => _GearEditPageState();
}

class _GearEditPageState extends State<GearEditPage> {
  final key = GlobalKey<FormState>();
  final ctrlImg = MultiImagePickerController(
    maxImages: 32,
    picker: (pickCount, params) async {
      final pickedImages = await ImagePicker().pickMultiImage();
      // TODO: Compress the image and upload it at *this point*
      return pickedImages.map((e) => convertXFileToImageFile(e)).toList();
    },
  );
  late final TextEditingController ctrlUsername;

  @override
  Widget build(BuildContext context) {
    final client = context.read<Client>();
    final gearPair = context.watch<AllGearCache?>()?.firstWhere(
      (e) => e.gear.clubId == widget.clubId,
    );
    final gear = gearPair?.gear;
    return Scaffold(
      appBar: AppBar(title: Text("Edycja")),
      body: ListView(
        children: [
          Container(
            color: Colors.grey.withAlpha(40),
            height: 200,
            child: MultiImagePickerView(
              controller: ctrlImg,
              longPressDelayMilliseconds: 200,
            ),
          ),
          FilledButton(onPressed: () {}, child: Text("Zapisz")),
        ],
      ),
    );
  }
}
