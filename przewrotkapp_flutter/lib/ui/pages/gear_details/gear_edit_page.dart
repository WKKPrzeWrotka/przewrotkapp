import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';
import 'package:provider/provider.dart';
import 'package:przewrotkapp_client/przewrotkapp_client.dart';

class GearEditPage extends StatefulWidget {
  final String clubId;
  final GearPair gearPair;

  const GearEditPage({super.key, required this.clubId, required this.gearPair});

  @override
  State<GearEditPage> createState() => _GearEditPageState();
}

class _GearEditPageState extends State<GearEditPage> {
  late final Client client;
  final key = GlobalKey<FormState>();
  late final TextEditingController ctrlManufacturer;
  late final TextEditingController ctrlModel;
  late final TextEditingController ctrlFriendlyName;

  late final Gear editedGear;
  late final GearExtra editedExtra;
  late final MultiImagePickerController ctrlImg;
  late final TextEditingController ctrlUsername;

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

    ctrlManufacturer = TextEditingController(text: editedGear.manufacturer);
    ctrlModel = TextEditingController(text: editedGear.model);
    ctrlFriendlyName = TextEditingController(text: editedGear.friendlyName);

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

  String? defaultValid(String? text) => (text == null || text.trim().isEmpty)
      ? "Nie może być puste"
      : (text.length > 32 ? "Za długie" : null);

  String? allowNullValid(String? text) =>
      ((text?.length ?? 0) > 32) ? "Za długie" : null;

  String? nullIfEmpty(String text) => text.trim().isEmpty ? null : text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edycja ${widget.clubId} ✏")),
      body: ListView(
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
            controller: ctrlManufacturer,
            decoration: InputDecoration(label: Text("Producent")),
            onChanged: (t) => editedGear.manufacturer = nullIfEmpty(t),
            validator: allowNullValid,
          ),
          TextFormField(
            controller: ctrlModel,
            decoration: InputDecoration(label: Text("Model")),
            onChanged: (t) => editedGear.model = nullIfEmpty(t),
            validator: allowNullValid,
          ),
          TextFormField(
            controller: ctrlFriendlyName,
            decoration: InputDecoration(label: Text("Ksywa")),
            onChanged: (t) => editedGear.friendlyName = nullIfEmpty(t),
            validator: allowNullValid,
          ),
          SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(milliseconds: 500),
                  content: Text("Przytrzymaj :)"),
                ),
              );
            },
            onLongPress: () async {
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
      quality: 70,
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
