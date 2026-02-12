import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/magic_numbers.dart' as magick;
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

import '../../../logic/form_validation_utils.dart';
import '../../utils/names_and_strings.dart';

class GearEditPage extends StatefulWidget {
  final String clubId;
  final GearPair gearPair;
  final bool emptyFields;

  const GearEditPage({
    super.key,
    required this.clubId,
    required this.gearPair,
    required this.emptyFields,
  });

  @override
  State<GearEditPage> createState() => _GearEditPageState();
}

class _GearEditPageState extends State<GearEditPage> {
  late final Client client;
  final formKey = GlobalKey<FormState>();

  late final Gear editedGear;
  late final GearExtra editedExtra;
  late final MultiImagePickerController ctrlImg;

  // ====
  // ui utils here
  // ====

  void onImageMoved() {
    editedGear.photoUrls = ctrlImg.images
        .map((f) => Uri.parse(f.path!))
        .toList();
    setState(() {});
  }

  void updatePickerImages() {
    ctrlImg.updateImages(
      editedGear.photoUrls?.map(uriToImageFile).toList() ?? [],
    );
  }

  @override
  void initState() {
    super.initState();
    client = context.read<Client>();
    // avoid editing global list
    editedGear = widget.gearPair.gear.copyWith(
      photoUrls: widget.gearPair.gear.photoUrls?.toList(),
    );
    editedExtra = widget.gearPair.gearExtra.copyWith();

    ctrlImg = MultiImagePickerController(
      maxImages: 32,
      picker: (pickCount, params) async =>
          await Stream.fromIterable(await ImagePicker().pickMultiImage())
              .asyncMap(
                (e) async => uriToImageFile(await compressAndUploadImage(e)),
              )
              .toList(),
    );
    ctrlImg.addListener(onImageMoved);
    updatePickerImages();
  }

  String? nullIfEmpty(String text) => text.trim().isEmpty ? null : text.trim();

  int? parseInt(String? t) =>
      t == null ? null : int.tryParse(nullIfEmpty(t) ?? '');

  double? parseDouble(String? t) =>
      t == null ? null : double.tryParse(nullIfEmpty(t) ?? '');

  List<Widget> gearSpecificFields(BuildContext context) {
    final setInit = !widget.emptyFields;
    final genericSizeEntries = GenericGearSize.values
        .map((e) => DropdownMenuEntry(value: e, label: e.humanName))
        .toList();
    return switch (editedExtra) {
      GearBelt belt => [
        TextFormField(
          initialValue: setInit ? belt.length.toString() : null,
          onChanged: (t) => belt.length = double.parse(nullIfEmpty(t)!),
          validator: defaultDoubleValid,
          decoration: InputDecoration(label: Text('Długość')),
        ),
      ],
      GearClothing clothing => [
        DropdownMenuFormField(
          initialSelection: setInit ? clothing.size : null,
          dropdownMenuEntries: genericSizeEntries,
          onSelected: (s) => clothing.size = s!,
          validator: noNullValid,
          label: Text('Rozmiar'),
        ),
        DropdownMenuFormField(
          initialSelection: setInit ? clothing.type : null,
          dropdownMenuEntries: ClothingType.values
              .map((e) => DropdownMenuEntry(value: e, label: e.humanName))
              .toList(),
          onSelected: (t) => clothing.type = t!,
          validator: noNullValid,
          label: Text('Typ'),
        ),
        TextFormField(
          initialValue: setInit ? clothing.typeDescription : null,
          onChanged: (t) => clothing.typeDescription = nullIfEmpty(t),
          validator: allowNullValid,
          decoration: InputDecoration(label: Text('Opis typu')),
        ),
      ],
      GearFloatbag floatbag => [
        TextFormField(
          initialValue: setInit ? floatbag.volume?.toString() : null,
          onChanged: (t) => floatbag.volume = parseInt(t),
          validator: allowNullIntValid,
          decoration: InputDecoration(label: Text('Objętość')),
        ),
      ],
      GearHelmet helmet => [
        DropdownMenuFormField(
          initialSelection: setInit ? helmet.size : null,
          dropdownMenuEntries: genericSizeEntries,
          onSelected: (t) => helmet.size = t!,
          validator: noNullValid,
          label: Text('Rozmiar'),
        ),
      ],
      GearKayak kayak => [
        DropdownMenuFormField(
          initialSelection: setInit ? kayak.type : null,
          dropdownMenuEntries: KayakType.values
              .map((e) => DropdownMenuEntry(value: e, label: e.humanName))
              .toList(),
          onSelected: (t) => kayak.type = t!,
          validator: noNullValid,
          label: Text('Typ'),
        ),
        TextFormField(
          initialValue: setInit ? kayak.minWeight?.toString() : null,
          onChanged: (t) => kayak.minWeight = parseInt(t),
          validator: allowNullIntValid,
          decoration: InputDecoration(label: Text('Min waga jeźdźca')),
        ),

        TextFormField(
          initialValue: setInit ? kayak.maxWeight?.toString() : null,
          onChanged: (t) => kayak.maxWeight = parseInt(t),
          validator: allowNullIntValid,
          decoration: InputDecoration(label: Text('Max waga jeźdźca')),
        ),

        TextFormField(
          initialValue: setInit ? kayak.length.toString() : null,
          onChanged: (t) => kayak.length = parseInt(t)!,
          validator: defaultIntValid,
          decoration: InputDecoration(label: Text('Długość')),
        ),
      ],
      GearPaddle paddle => [
        DropdownMenuFormField(
          initialSelection: setInit ? paddle.type : null,
          dropdownMenuEntries: PaddleType.values
              .map((e) => DropdownMenuEntry(value: e, label: e.humanName))
              .toList(),
          onSelected: (t) => paddle.type = t!,
          validator: noNullValid,
          label: Text('Typ'),
        ),
        TextFormField(
          initialValue: setInit ? paddle.length.toString() : null,
          onChanged: (t) => paddle.length = parseDouble(t)!,
          validator: defaultDoubleValid,
          decoration: InputDecoration(label: Text('Długość')),
        ),

        TextFormField(
          initialValue: setInit ? paddle.rotation.toString() : null,
          onChanged: (t) => paddle.rotation = parseInt(t)!,
          validator: defaultIntValid,
          decoration: InputDecoration(
            label: Text('Skręt'),
            // maybe some nice checkbox in future here?
            // naaaah who has time for this
            helper: Text(
              "Jeśli kąt regulowany, wpisz maksymalny zakres na minusie - np 'maksymalnie 45' => '-45'",
            ),
          ),
        ),
      ],
      GearPfd pfd => [
        DropdownMenuFormField(
          initialSelection: setInit ? pfd.size : null,
          dropdownMenuEntries: genericSizeEntries,
          onSelected: (s) => pfd.size,
          validator: noNullValid,
          label: Text("Rozmiar"),
        ),
        DropdownMenuFormField(
          initialSelection: setInit ? pfd.type : null,
          dropdownMenuEntries: PfdType.values
              .map((s) => DropdownMenuEntry(value: s, label: s.humanName))
              .toList(),
          onSelected: (t) => pfd.type = t!,
          validator: noNullValid,
          label: Text("Typ"),
        ),
      ],
      GearSpraydeck spraydeck => [
        DropdownMenuFormField(
          initialSelection: setInit ? spraydeck.deckSize : null,
          dropdownMenuEntries: SpraydeckDeckSize.values
              .map((s) => DropdownMenuEntry(value: s, label: s.humanName))
              .toList(),
          onSelected: (s) => spraydeck.deckSize = s!,
          validator: noNullValid,
          label: Text("Rozmiar kokpitu"),
        ),
        DropdownMenuFormField(
          initialSelection: setInit ? spraydeck.waistSize : null,
          dropdownMenuEntries: genericSizeEntries,
          onSelected: (s) => spraydeck.waistSize = s!,
          validator: noNullValid,
          label: Text("Rozmiar w pasie"),
        ),
      ],
      GearThrowbag throwbag => [
        TextFormField(
          initialValue: setInit ? throwbag.length.toString() : null,
          onChanged: (t) => throwbag.length = parseInt(t)!,
          validator: defaultIntValid,
          decoration: InputDecoration(label: Text('Długość')),
        ),
      ],
      GearExtra() => throw UnimplementedError(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final setInit = !widget.emptyFields;
    return Scaffold(
      appBar: AppBar(title: Text("Edycja ${widget.clubId} ✏")),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            Container(
              color: Colors.grey.withAlpha(40),
              height: 256,
              child: MultiImagePickerView(
                controller: ctrlImg,
                longPressDelayMilliseconds: 200,
              ),
            ),
            TextFormField(
              initialValue: setInit ? editedGear.manufacturer : null,
              onChanged: (t) => editedGear.manufacturer = nullIfEmpty(t),
              validator: allowNullValid,
              decoration: InputDecoration(label: Text("Producent")),
            ),
            TextFormField(
              initialValue: setInit ? editedGear.model : null,
              onChanged: (t) => editedGear.model = nullIfEmpty(t),
              validator: allowNullValid,
              decoration: InputDecoration(label: Text("Model")),
            ),
            TextFormField(
              initialValue: setInit ? editedGear.friendlyName : null,
              onChanged: (t) => editedGear.friendlyName = nullIfEmpty(t),
              validator: allowNullValid,
              decoration: InputDecoration(label: Text("Ksywa")),
            ),
            Divider(),
            ...gearSpecificFields(context),
            SizedBox(height: 32),
            FilledButton(
              onPressed: () {
                formKey.currentState?.validate();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text("Przytrzymaj :)"),
                  ),
                );
              },
              onLongPress: () async {
                if (!(formKey.currentState?.validate() ?? false)) return;
                try {
                  await submit(client);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Sukces!"),
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("Błąd :( $e"),
                      ),
                    );
                  }
                }
              },
              child: Text("Zapisz"),
            ),
          ],
        ),
      ),
    );
  }

  // ====
  // shitty utils here
  // ====

  ImageFile uriToImageFile(Uri uri) => ImageFile(
    UniqueKey().toString(),
    // these two don't really work for our url schemes (blurhash etc),
    // but it doesn't break anything 🤷
    name: uri.pathSegments.last,
    extension: uri.pathSegments.last.split('.').last,
    path: uri.toString(),
  );

  Future<Uri> compressAndUploadImage(XFile imageFile) async {
    final bytes = await FlutterImageCompress.compressWithList(
      await imageFile.readAsBytes(),
      quality: magick.gearImageCompressionLevel,
      format: CompressFormat.jpeg,
    );
    return await client.gearManage.uploadGearImage(
      ByteData.sublistView(bytes),
      widget.clubId,
    );
  }

  Future<void> submit(Client client) => switch (editedExtra) {
    GearBelt belt => client.gearManage.createOrUpdateBelt(editedGear, belt),
    GearClothing clothing => client.gearManage.createOrUpdateClothing(
      editedGear,
      clothing,
    ),
    GearFloatbag floatbag => client.gearManage.createOrUpdateFloatbag(
      editedGear,
      floatbag,
    ),
    GearHelmet helmet => client.gearManage.createOrUpdateHelmet(
      editedGear,
      helmet,
    ),
    GearKayak kayak => client.gearManage.createOrUpdateKayak(editedGear, kayak),
    GearPaddle paddle => client.gearManage.createOrUpdatePaddle(
      editedGear,
      paddle,
    ),
    GearPfd pfd => client.gearManage.createOrUpdatePfd(editedGear, pfd),
    GearSpraydeck spraydeck => client.gearManage.createOrUpdateSpraydeck(
      editedGear,
      spraydeck,
    ),
    GearThrowbag throwbag => client.gearManage.createOrUpdateThrowbag(
      editedGear,
      throwbag,
    ),
    GearExtra() => throw UnimplementedError(),
  };

  @override
  void dispose() {
    ctrlImg.removeListener(onImageMoved);
    super.dispose();
  }
}
