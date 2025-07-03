import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:todo_list/features/auth/presentation/cubit/auth_state.dart';
import 'package:todo_list/features/home/data/my_pic_data_base.dart';

class PickImageWidget extends StatefulWidget {
  const PickImageWidget({super.key});

  @override
  State<PickImageWidget> createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  MyPicDataBase db = MyPicDataBase();
  @override
  void initState() {
    super.initState();
    db.loadImage();
    if (db.pic.isNotEmpty && File(db.pic).existsSync()) {
      context.read<AuthCubit>().uploadProfilePic(XFile(db.pic));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: 130,
          height: 130,
          child:
              context.read<AuthCubit>().profilePic == null
                  ? CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: const AssetImage(
                      "assets/images/avatar.png",
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () async {},
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade400,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: GestureDetector(
                                onTap: () async {
                                  if (await pickimage(context) == null) {
                                    return;
                                  } else {
                                    pickimage;
                                    db.loadImage();
                                    db.updateImage();
                                  }
                                },
                                child: const Icon(
                                  Icons.camera_alt_sharp,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  : GestureDetector(
                    onTap: () async {
                      if (await pickimage(context) == null) {
                        return;
                      } else {
                        pickimage;
                        db.loadImage();
                        db.updateImage();
                      }
                    },
                    child: CircleAvatar(
                      backgroundImage: FileImage(
                        File(context.read<AuthCubit>().profilePic!.path),
                      ),
                    ),
                  ),
        );
      },
    );
  }

  // pickimage(BuildContext context) async {
  pickimage(BuildContext context) async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (image != null) {
      final croppedImage = await cropImages(image);
      context.read<AuthCubit>().uploadProfilePic(XFile(croppedImage.path));
      db.saveImagePath(croppedImage.path);
      db.updateImage();
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => ImageCropperView(image: croppedImage),
      //   ),
      // );
    }
  }

  Future<CroppedFile> cropImages(XFile image) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9,
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );
    return croppedFile!;
  }
}
