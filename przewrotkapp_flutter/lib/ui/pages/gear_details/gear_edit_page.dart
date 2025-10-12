import 'package:flutter/material.dart';
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
  final key = GlobalKey<FormState>();
  late final Gear editedGear;
  late final GearExtra editedExtra;
  late final MultiImagePickerController ctrlImg;
  late final TextEditingController ctrlUsername;

  void onImageMoved() {
    editedGear.photoUrls = ctrlImg.images
        .map((f) => Uri.parse(f.path!))
        .toList();
    setState(() {});
  }

  void updatePickerImages() {
    ctrlImg.updateImages(
      editedGear.photoUrls
              ?.map(
                (uri) => ImageFile(
                  UniqueKey().toString(),
                  // these two don't really work for our url schemes, but it works
                  name: uri.pathSegments.last,
                  extension: uri.pathSegments.last.split('.').last,
                  path: uri.toString(),
                ),
              )
              .toList() ??
          [],
    );
  }

  @override
  void initState() {
    super.initState();
    // avoid editing global list
    editedGear = widget.gearPair.gear.copyWith(
      photoUrls: widget.gearPair.gear.photoUrls?.toList(),
    );
    editedExtra = widget.gearPair.gearExtra.copyWith();

    ctrlImg = MultiImagePickerController(
      maxImages: 32,
      picker: (pickCount, params) async {
        final pickedImages = await ImagePicker().pickMultiImage();
        // TODO: Compress the image and upload it at *this point*
        return pickedImages.map((e) => convertXFileToImageFile(e)).toList();
      },
    );
    ctrlImg.addListener(onImageMoved);
    updatePickerImages();
  }

  @override
  Widget build(BuildContext context) {
    final client = context.read<Client>();
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
          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Przytrzymaj :)")));
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
