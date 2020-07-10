import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:simple_app/aws/generate_image_url.dart';
import 'package:simple_app/aws/upload_file.dart';

import '../home_page.dart';
import 'add_attachment_sheet.dart';

typedef Future<bool> OnSaveImage(String url);

class SingleImagePicker {
  final Function(String path) onImagePicked;
  final Function(String downloadUrl) onImageSuccessfullyUploaded;
  final Function(String downloadUrl) onImageSuccessfullySaved;
  final OnSaveImage onSaveImage;
  final Function(String message) onImageUploadFailed;

  SingleImagePicker({
    @required this.onImagePicked,
    this.onImageSuccessfullyUploaded,
    @required this.onSaveImage,
    @required this.onImageSuccessfullySaved,
    @required this.onImageUploadFailed,
  });

  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickImage(context) async {
    try {
      Size size = MediaQuery.of(context).size;
      var sheet = AddAttachmentModalSheet(size);
      await showModalBottomSheet(
        context: context,
        builder: (context) => sheet,
        isScrollControlled: true,
      );

      ImageSource imageSource;
      if (sheet.source == Source.CAMERA) {
        imageSource = ImageSource.camera;
      } else if (sheet.source == Source.GALLERY) {
        imageSource = ImageSource.gallery;
      } else {
        return;
      }

      PickedFile image = await imagePicker.getImage(source: imageSource);

      if (image != null) {
        onImagePicked?.call(image.path);

        String fileExtension = path.extension(image.path);

        GenerateImageUrl generateImageUrl = GenerateImageUrl();
        await generateImageUrl.call(fileExtension);

        String uploadUrl;
        if (generateImageUrl.isGenerated != null &&
            generateImageUrl.isGenerated) {
          uploadUrl = generateImageUrl.uploadUrl;
        } else {
          throw generateImageUrl.message;
        }

        UploadFile uploadFile = UploadFile();
        await uploadFile.call(uploadUrl, image);

        await Future.delayed(Duration(seconds: 5));

        if (uploadFile.isUploaded != null && uploadFile.isUploaded) {
          onImageSuccessfullyUploaded?.call(generateImageUrl.downloadUrl);

          bool isSaved = await onSaveImage(generateImageUrl.downloadUrl);
          if (isSaved) {
            onImageSuccessfullySaved(generateImageUrl.downloadUrl);
          } else {
            throw "Failed to save image";
          }
        } else {
          throw uploadFile.message;
        }
      }
    } catch (e) {
      onImageUploadFailed(e.toString());
    }
  }
}
